# groupA-backend
## Config
The following environment variables need to be set to enable database connection (put them in your .zshrc):
```
DB_USERNAME
DB_PASSWORD
DB_HOST
DB_NAME
```
## Running the application
```bash
mvn clean install
java -jar target/groupA-backend-1.0-SNAPSHOT.jar
```
## Running the tests
```
mvn test
mvn integration-test
```
