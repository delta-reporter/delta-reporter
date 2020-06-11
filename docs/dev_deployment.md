# Deployment for development

Docker Compose can be used to deploy all Delta services and perform real time changes. 
This page contains information on how to set Delta Reporter locally for development purposes.

This is the main Delta repository:  https://github.com/delta-reporter/delta-reporter.git

## **Local dev deployment**

* To start with, clone main delta repository (preferably in your root folder create a folder called "delta-local" and clone it there)

`git clone https://github.com/delta-reporter/delta-reporter.git`

***All the files needed for local deployment are located in /dev folder.***

* In the delta-reporter/dev/ folder you will find a script to easily clone all the other repositories of the project (core and frontend repos)

`cd dev && ./clone_services.sh`

  Or do it manually:
      - Core  https://github.com/delta-reporter/delta-core.git
      - Frontend https://github.com/delta-reporter/delta-frontend.git

* After cloning the repos, you have the option to let the script build the images from each repo
* You might need to go to /delta-frontend/ and run 
`npm install` 
to have all the dependencies ready.

* Since the application is dockerized, it can be deployed easily with Docker Compose. To spin up the application simply run the following commands from your /delta-reporter/dev/ folder

`docker-compose build && docker-compose up`

* Before you start using Delta Reporter, you'll need to initialize the database and some default values, please follow the instructions below. 

## **Database**

* Before start using Delta Reporter, you'll need to initialize the database and some default values, do this with this command:

`docker exec delta_core_dev python manage.py db upgrade`

 This command run the scripts located in `migrations/versions/` in order to apply the changes on the database

 * Then, to load default values, send a POST request to the endpoint `/api/v1/initial_setup` by running:

 `curl -X POST http://localhost:5000/api/v1/initial_setup`

* If no errors are met, the environment should be ready on: http://localhost:3000


### **Generating test data**

To be able to work with delta, you will need some test data in your database. In order to generate the data, you will need to clone one of our test clients (testNG, PHPUnit or wdio) and run the tests. Note, Delta Reporter should be up and running, when you do so.
For example:

* Clone TestNG client plugin 

`https://github.com/delta-reporter/delta-reporter-testng.git`

* Install maven, if you don't have it on your local machine

`https://www.appsdeveloperblog.com/how-to-install-maven-on-mac-os/`

* Go to that /delta-reporter-testng/ folder and run the tests

` mvn clean test -Dsurefire.suiteXmlFiles=suites/TestSuite1.xml`


### **Useful information**

- [http://localhost:3000/](http://localhost:3000/) | Delta Frontend Service
- [http://localhost:5000/](http://localhost:5000/) | Delta Core Service


* The server will restart automatically on any change in the code
* To stop the server at any stage use `docker-compose stop`
