## quote-api
### Description

You should implement a REST API for the web interface in the two wireframes below.

![wireframe 1](https://developers.kameleoon.com/assets/images/quote-list-b4ae876beb1478ad755d48572b302d7d.png)
![wireframe 2](https://developers.kameleoon.com/assets/images/quote-detail-ca17a570f49884a29f906ac65791bd48.png)
Project requirements:  
- source code should be published on https://github.com/;
- Docker image should be published on https://hub.docker.com/;
- project should have docker-compose.yaml for local deploy, OR you can deploy it on a public hosting provider (Heroku, etc);
- use any in-memory database (Derby, H2, SQLite);
- use Java and Spring Boot.  

The API should allow:
- creation of a user account (deletion and other CRUD operations not requested). User properties are name, email, 
password and date of creation;
- addition, viewing (including a method to get a random quote), modification, and deletion of quotes (real deletion 
from the database, not just via an archive flag). Quote properties include content, date of creation / update, link to 
user who posted it, link to votes;
- voting on quotes (either upvote or downvote);
- view of the top and worse 10 quotes, the details of each quote, and ideally a graph of the evolution of the votes over time.

Not requested: frontend part, authentication mechanism, and account rights management.

If you have some questions about business logic not covered here, you can choose yourself the answer, no need to ask us. 
At this point, the goal is to evaluate your coding skills, not how you respect a technical specification (this is also 
important, but can come later :-).

The full exercise can take about 6-8 hours (for a middle-level developer; longer for a junior) but the goal is not 
necessarily to do everything. You need to show your development skills, respect of best practices, understanding of the 
web development model (client, server), ability to deliver your work to a production-like environment, and your productivity.  
### Requests examples
Create user account:
```
curl -X 'POST' \
  'http://localhost:8080/api/users' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Andrey",
  "email": "c00lhak3r@mail.com",
  "password": "12345678"
}'
```
Add a quote:
```
curl -X 'POST' \
  'http://localhost:8080/api/quotes?userId={USER_ID}' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod..."
}'
```
Get all quotes list:
```
curl -X 'GET' \
  'http://localhost:8080/api/quotes' \
  -H 'accept: */*'
```
Get all quotes of particular user:
```
curl -X 'GET' \
  'http://localhost:8080/api/quotes?userId={USER_ID}' \
  -H 'accept: */*'
```
Get a random quote:
```
curl -X 'GET' \
  'http://localhost:8080/api/quotes?random' \
  -H 'accept: */*'
```
Edit quote:
```
curl -X 'PATCH' \
  'http://localhost:8080/api/quotes/{QUOTE_ID}' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "content": "Edited quote"
}'
```
Delete a quote:
```
curl -X 'DELETE' \
  'http://localhost:8080/api/quotes/{QUOTE_ID}' \
  -H 'accept: */*'
```
Upvote or downvote:
```
curl -X 'POST' \
  'http://localhost:8080/api/quotes/{QUOTE_ID}?userId={VOTER_ID}&vote={TRUE_IF_UPVOTE_OTHERWISE_FALSE}' \
  -H 'accept: */*' \
  -d ''
```
View of the top 10 quotes:
```
curl -X 'GET' \
  'http://localhost:8080/api/quotes?best' \
  -H 'accept: */*'
```
View of the worst 10 quotes:
```
curl -X 'GET' \
  'http://localhost:8080/api/quotes?worst' \
  -H 'accept: */*'
```
Full OpenAPI documentation available at:
```
http://localhost:8080/swagger-ui.html
```
### Build and usage
Build project using Maven:
```
mvn clean package
```
Launch on your local machine:
```
java -jar target/quote-api-0.0.1-SNAPSHOT.jar
```
### Docker
For launching this app inside Docker container go to project root folder and enter in your terminal:
```
docker compose up
```
OR get an image from [DockerHub](https://hub.docker.com/r/lordgarrish/quote-api-quote-api):  
```
docker pull lordgarrish/quote-api-quote-api
```
Run downloaded image:
```
docker run -p 8080:8080 --name quote-api lordgarrish/quote-api-quote-api
```
