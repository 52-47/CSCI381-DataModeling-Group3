#TSQL -> MongoDB

1. Create MongoDB Model On Erwin by using migration methods.
    - Create subdocuments to embed into each document. 
    - connect subdocuments together to generate nested subdocuments
2. Using the generated SQL Server 2019 DDL write views to create JSON to generate data for MongoDB
    - refer to erwin model to write sql command to generate JSON based on current data.
    - after generating JSON prettify and paste into model.
3. Presentations
    MongoDB: model demonstrating the porting your SQL Server model to MongoDB.
        a. Using correlated subqueries to create JSON that can be loaded into Compass.
            - Showcase use of SQL commands to generate JSON files along with nested JSON files within eachother to mimick a relational database.
            - Showcase nested JSON objects. 
        b. Adding 2 or 3 Erwin report
            - Views
            - Domains