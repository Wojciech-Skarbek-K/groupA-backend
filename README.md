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
```
### Running the application
```bash
mvn clean install
java -jar target/groupA-backend-1.0-SNAPSHOT.jar
```
Application will be running on ```http://localhost:8080/```
### Running the tests
```
mvn test
mvn integration-test
```
## Swagger
You can see all models and endpoints in ```http://localhost:8080/swagger```
