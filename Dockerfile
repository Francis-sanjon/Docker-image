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
RUN npm install -D @badeball/cypress-cucumber-preprocessor
RUN npm install -D @bahmutov/cypress-esbuild-preprocessor
RUN npm install -D @esbuild-plugins/node-modules-polyfill

#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx","cypress","run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]    