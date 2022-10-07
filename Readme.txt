For cypress image
docker pull cypress/included:10.9.0
docker run -d --name App cypress/included:10.9.0
docker run -it --entrypoint=cypress cypress/included:10.9.0 info

docker run -it -v "%cd%":/e2e -w /e2e cypress/included:10.9.0


For Jenkins image
docker run -p 8090:8080 -p 50000:50000 -v C:\Jenkins_Home:/var/jenkins_home jenkins/jenkins:lts-jdk11
docker run --name App2 -p 8090:8080 -p 50000:50000 -v C:\Jenkins_Home:/var/jenkins_home jenkins/jenkins:lts-jdk11

Jenkins needs to know where your git binary file is installed; this is usually at /usr/bin/git on Linux systems. Go to the /configure page of your Jenkins installation (the "Manage Jenkins" link) and set it up in the "Git" section.

Use this code in VS terminal to build image 
docker build -t cyp-dock-mocha-report .

To build image 
docker build -t my-cypress-image:1.0.0 .
To run image
docker run -i -v "%cd%":/my-cypress-project -t my-cypress-image:1.0.0 --spec 'cypress/e2e/*.js'


Create a file in project with name of Dockerfile and place a given lines 


#Base image taken from:https://github.com/cypress-io/cypress-docker-images
FROM cypress/browsers:node16.17.1-chrome106-ff105-edge
#Create the folder where our project will be stored
RUN mkdir /my-cypress-project
#We make it our workdirectory
WORKDIR /my-cypress-project
#Let's copy the essential files that we MUST use to run our scripts.
COPY ./package.json .
COPY ./cypress.config.js .
COPY ./cypress ./cypress
#Install the cypress dependencies in the work directory
RUN npm install
#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx","cypress","run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]    



Syntax for push 

docker tag imageID reponame/imageID:tag

docker tag 6a72c8142da0 francislaavi/adactin:1.0.0

docker push reponame/imagename:tag
