Steps to run the application
1. Create your DB and import the DB.sql file to your sql browser.
2. check the credentials of your DB inside the application.properties file 
3. After setting DB credentials, run the application.
4. Import the AlgoTest.postman_collection to your postman
5. Call the login API, in the response you will get token.
6. Go to searchProduct API in the postman, set the header "x-auth-token" as the token which you have recieved in the reponse of the login API
7. Call the search API with what ever parameter you want and you can see desired output.
8. Using seller credentials in the DB login and call the addProduct API, because using customer credentials you cannot call add product(check for the same is implemented).
