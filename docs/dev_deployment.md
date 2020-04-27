# Deployment for development

Docker Compose can be used to deploy all Delta services and perform real time changes

## **Local dev deployment**

* There is a script to easily clone all the repositories of the projects

`cd dev && ./clone_services.sh`

* After cloning, you have the option to let the script build the images from each repo

* Since the application is dockerized, it can be deployed easily with Docker Compose

`docker-compose build && docker-compose up`

* The server will restart automatically on any change in the code
* To stop the server at any stage use `docker-compose stop`

## **Database**

Before start using Delta Reporter, you'll need to initialize the database and some default values, do this with this command:

`docker exec delta_core python manage.py db upgrade`

 This command run the scripts located in `migrations/versions/` in order to apply the changes on the database

 Then, to load default values, send a POST request to the endpoint `/api/v1/initial_setup` by running:

 `curl -X POST http://localhost:5000/api/v1/initial_setup`

* If no errors are met, the environment should be ready on:

### **Frontend**

- [http://localhost:3000/](http://localhost:3000/) | Delta Frontend Service

### **Core**

- [http://localhost:5000/](http://localhost:5000/) | Delta Core Service
