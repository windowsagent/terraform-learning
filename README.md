# Learning terraform: Documenting my experience

## Environment

I'm using [localstack](https://docs.localstack.cloud/overview/) to simulate an AWS environment throughout this course. Below are the steps to reproduce it:

### Setting up localstack

*Docker needs to be previously installed, we'll assume you already have it!*

#### Install localstack

```bash
pip install localstack
```

#### Launch localstack

```bash
docker-compose up
```

*There's already a file in [docker-compose.yaml](./docker-compose.yaml) for running localstack*