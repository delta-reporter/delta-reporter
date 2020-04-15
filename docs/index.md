# Welcome to Delta Reporter Documentation

To access the reporter visit [delta-reporter](https://delta-frontend.herokuapp.com/).

## The goal 

Next generation reporting tool where results from all kind all tests are displayed in real time

The goals of this project are:
- Monitor in real time all the automated tests involved on a software development flow

- Offer image comparison service to be used with visual regression tools

- Keep an history of the results on previous deployments

- Automated comparison with older results to suggest type of failure (application change, test to be updated, platform issue)

## Architecture 

Delta Reporter is based on a micro service architecture, as the first micro service is a MVP is just split between backend and frontend

## Backend

- Based on Flask

## Frontend

- Based on NextJS

## The goal

## Deployment

* There is a script to easily clone all the repositories of the projects

`./clone_services.sh`

* After cloning, you have the option to let the script build the images from each repo

* Since the application is dockerized, it can be deployed easily with Docker Compose

`docker-compose build && docker-compose up`

* If no errors are met, the environment should be live on:

### Frontend

- http://localhost:3000/

### Backend

- http://localhost:5000/ | Delta Core Service

* The server will restart automatically on any change in the code
* To stop the server at any stage use `docker-compose stop`

## Database

Before start using Delta Reporter, you'll need to initialize the database and some default values, do this with this command:

`docker exec delta_core python manage.py db upgrade`

 This command run the scripts located in `migrations/versions/` in order to apply the changes on the database

 Then, to load default values, send a POST request to the endpoint `/api/v1/initial_setup` by running:

 `curl -X POST http://localhost:5000/api/v1/initial_setup`

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.
