## Introduction
In this project we implemented a app on FastAPI in the container running on AWS Lambda and published on AWS API Gateway
using Terrafom. The app count the **"href="** tag on **only ten** random website index page.

## Quick Installation
    python -m venv .venv
    source .venv/bin/activate
    pip install -r app/requirements.txt
    cd infra/env/dev
    terraform init
    terraform apply
    Go to API Gateway URL with path /dev/docs
    
## Demostration

[deploy.webm](https://github.com/alvarolinarescabre/aws_lambda_fastapi/assets/12623570/adf957a3-f082-4748-b44b-da4d171e3bb2)

[demo.webm](https://github.com/alvarolinarescabre/aws_lambda_fastapi/assets/12623570/79c80fa1-3be6-4649-865f-93b89f53ac84)

## Installation detailed

First at first, we need to do a git clone from repo, 
then we must create the virtual environment to activate it and install the libraries, then we enter the **infra/env/dev**
directory and initialize Terraform, once this last step is done, we apply to create the infrastructure, to finish we
must enter the URL of the API Gateway with the path **/dev/docs**, we will see the Swagger of the App.

    1.- git clone  https://github.com/alvarolinarescabre/aws_lambda_fastapi.git
    2.- python -m venv .venv
    3.- source .venv/bin/activate
    4.- pip install -r app/requirements.txt
    5.- cd infra/env/dev
    6.- terraform init
    7.- terraform apply
    8.- Go to API Gateway URL with path /dev/docs


## URL Path from AWS API Gateway

The URLs of the App services from AWS API Gateway are:

    1.- /dev/ -> root
    2.- /dev/ping -> healthcheck endpoint
    3.- /dev/counter -> counter tags endpoint
    4.- /dev/docs -> the swagger endpoint

## Important Note

In the demo app not have implemented CI/CD, but that reason if we change the app code we need to update the var
**tag = "v1.0"** manually to a new version to create a update, and then run again **terraform apply**.

You can change the website to search on the file **app/conf/settings.py -> random_website**
