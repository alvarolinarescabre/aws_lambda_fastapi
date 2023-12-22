## Introduction
In this project we implemented a app on FastAPI in the container running on AWS Lambda and published on AWS API Gateway using Terrafom.

The app count the *"href="* tag on ten random website index page.


## Quick Installation
    python -m venv .venv
    source .venv/bin/activate
    pip install -r app/requirements.txt
    cd infra/env/dev
    terraform init
    terraform apply
    Go to API Gateway URL with path /dev/docs
    
## Demostration

[demo.webm](https://github.com/alvarolinarescabre/aws_lambda_fastapi/assets/12623570/79c80fa1-3be6-4649-865f-93b89f53ac84)

## Installation detailed


