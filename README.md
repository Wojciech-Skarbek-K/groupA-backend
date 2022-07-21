# groupA-backend
Backend part of Kainos Job application.
## Application
### Config
The following environment variables need to be set to enable database connection (put them in your .zshrc):
```
DB_USERNAME
DB_PASSWORD
DB_HOST
DB_NAME
JWT_TOKEN_SECRET
```
### Running the application
```bash
mvn clean install
java -jar target/groupA-backend-1.0-SNAPSHOT.jar
```
Application will be running on ```http://localhost:8080/```

#### Running using IntelliJ
You can also run the application using IntelliJ. Add new run configuration 'application' with following parameters:
```
java version: 18
main class: org.kainos.groupA.GroupAApplication
program arguments: server
```
Then if the application can't read the variables from .zshrc file, put the DB_USERNAME, DB_PASSWORD etc. into environment variables.
### Running the tests
```
mvn test
mvn integration-test
```
## Swagger
You can see all models and endpoints in ```http://localhost:8080/swagger```
