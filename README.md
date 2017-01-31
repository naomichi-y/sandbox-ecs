# Sandbox ECS

This package is a sample application runs Rails application on [AWS ECS](https://aws.amazon.com/ecs/).

<img src="https://raw.githubusercontent.com/wiki/naomichi-y/sandbox-ecs/images/cowsay.png" />

## Required tools

* [aws/aws-cli](https://github.com/aws/aws-cli)
* [silinternational/ecs-deploy](https://github.com/silinternational/ecs-deploy)

## Docker components

* Rails
  * [Amazon Linux Container Image](http://docs.aws.amazon.com/AmazonECR/latest/userguide/amazon_linux_container_image.html)
* MySQL

## Setup local environment

```
$ docker-compose build
$ docker-compose run --rm rails rake db:create
$ docker-compose run --rm rails rake db:migrate
$ docker-compose up
```
Open [http://localhost:3000/](http://localhost:3000/) in your browser.

## Deploy to ECS

### Add application to repository

You need to create an ECS Container Repository beforehand (e.g. `sandbox-ecs`).

```
$ aws ecr get-login --region ap-northeast-1
(Execute `docker login` command)

$ docker build -t sandbox-ecs .

# Tag image.
# e.g. docker tag xxx.dkr.ecr.ap-northeast-1.amazonaws.com/sandbox-ecs:latest
$ docker tag sandbox-ecs:latest {REPOSITORY}:{TAG}

# Push image to AWS repository.
$ docker push sandbox-ecs:latest {REPOSITORY}:{TAG}
```

### Deploy

It's necessary to create ECS clusters and service beforehand.

```
$ bin/ecs-deploy -c sandbox-ecs -n test -i {REPOSITORY}:{TAG}
```
