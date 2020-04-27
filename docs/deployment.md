# Deployment

## **Docker Compose**

Clone this repo and run Docker Compose:

```
git clone https://github.com/delta-reporter/delta-reporter.git
docker-compose up
```

You can access Delta Reporter on [http://localhost:3000/](http://localhost:3000/)

Point the client in your tests to: [http://localhost:5000/](http://localhost:5000/)

## **Kubernetes**

To deploy Delta Reporter into Minikube, follow this instructions:

- First add this repo to Helm and install Delta Reporter

```
helm repo add delta https://delta-reporter.github.io/helm
helm install delta-reporter delta/delta-reporter
```

**If no errors are met, Delta Reporter should be alive into Minikube, so we just need to expose it**

- Expose Delta Reporter's Core service

```
kubectl delete service delta-core
kubectl expose deployment delta-core --type=LoadBalancer
minikube service delta-core --url
```
- Expose Delta Reporter's Frontend service

```
kubectl delete service delta-frontend
kubectl expose deployment delta-frontend --type=LoadBalancer
minikube service delta-frontend --url
```

## **AWS**

Delta Reporter uses the Serverless Framework to be easily deployed as Lambda functions

Its a good idea to install Serverless Framework globally in your system:

```
npm install -g serverless
```

First you need to have your AWS credentials at `~/.aws/` Serverless Framework will use it to create the resources needed

Then, you should clone core and frontend repositories, install dependencies and deploy each service, we should start with the core service first

### Core Service

- Clone Core service repository:

```
git clone https://github.com/delta-reporter/delta-core.git
```

- Create a Python virtual environment and install the dependencies:

```
cd delta-core
pip install virtualenv
virtualenv venv --python=python3
source venv/bin/activate
pip install -r requirements.txt
npm install
```

* Modify the `serverless.yml` file if you need to specify a domain name or other settings

- Make the deployment into AWS with:

```
sls deploy
```

- After its deployed, go into AWS and set these required environment variables:

```
APP_SETTINGS=config.DevelopmentConfig
DATABASE_URL=postgresql://<user>:<password>@<host>:<port>/<db_name>
```

### Frontend Service

- Clone Frontend service repository:

```
git clone https://github.com/delta-reporter/delta-frontend.git
```

- Install dependencies:

```
cd delta-frontend
npm install
# or
yarn
```

- Then export the environment variable `DELTA_CORE_URL` with the endpoint of the Core service, so the lambda get generated with this parameter:

```
export DELTA_CORE_URL=<core_service_endpoint>
```

- You'll need the environment variable `PORT` as well:

```
export PORT=<port_number>
```

- Time to deploy it into AWS

```
serverless
```
