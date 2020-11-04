# Start Guide

This section will guide you through main Delta features and help to start using this great tool!

To have Delta up and running for your team, you will need to complete the following:

- Deploy Delta Reporter locally or into any cloud solution
- Hook Delta plugin to the tests you want to be displayed in Delta

## Deployment

On this step it's important to decide, whether you want to try Delta Reporter locally, or want to deploy it to some cloud solution for the whole team to use. 

It's quite easy in both scenarios:

- [Deploy Delta locally with docker-compose](dev_deployment.md) by cloning the repo and running one command

- [Deploy Delta to Kubernetes](deployment.md)

- Deploy Delta to [Heroku](https://dashboard.heroku.com/), free tier cloud platform


## Configuration

So after the deployment happened, you are all set and ready to run your tests! Now the question is: what tests do you want to start with?

Delta Reporter has a number of plugins, that are really easy to hook up to your testing framework. 

Here is the list of what's available now:

- [WebdriverIO](webdriverIO.md)

- [TestNG](testNG.md)

- [PHPUnit](phpUnit.md)

These ones are under active development and will be available soon:

- Cypress 

- JUnit

- Jest

## Delta Structure and Features 
Please read about Report Structure and Main Features [here](main_features.md)
