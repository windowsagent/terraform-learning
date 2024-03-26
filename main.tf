resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}


resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-abcdef01"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "web-server-${count.index}"
  }
}

resource "aws_elb" "main" {
  name               = "main-load-balancer"
  subnets            = [aws_subnet.main.id]
  security_groups    = [aws_security_group.elb_sg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances          = aws_instance.web[*].id
}

resource "aws_security_group" "elb_sg" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
