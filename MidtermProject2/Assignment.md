# Midterm Project 2

- Work with the attached MidtermDataModelingCSCI381 backup (.bak).
- Create detailed sections describing your domain subtopics below:

## Create a 1-to-1 or 1-to-many relationship for one or more application columns in the database.
- Explain your UDT: 
    - Naming convention is self-documenting.
    - How many times is it being reused?
    - Why did you choose this datatype?
- Refine the existing fully qualified UDTs (user-defined datatypes) into an application name which is equivalent to the Default root domain using a camelCase convention. 
    - dApplicationName for top-level domains (Example is attached) and SchemaName. Sub-domaining your taxonomies with sdSubDomain.UDTobject name topic.

## Create constraints in each of the tables to provide high data integrity.
- Default values
- Required or optional columns
- Unique columns
- Business rule template validations that are reusable (refer to the assignment on domains chapter 15) and override validation on the column and table level.

## Additional Columns and a New Table
- Create a new table DbSecurity.UserAuthorization in this project and add the following columns, applying your new UDT and demonstrating reusability if needed to be created: 
    - new table DbSecurity.UserAuthorization 
        - UserAuthorizationId INT NOT NULL (primary key)
        - ClassTime nchar(5) Null Default (e.g., '9:15')
        - IndividualProject nvarchar(60) null default ('CSCI381 Midterm Project')
        - GroupMemberLastName nvarchar(35) NOT NULL
        - GroupMemberFirstName nvarchar(25) NOT NULL
        - GroupName nvarchar(20) NOT NULL
        - DateAdded datetime2 null default sysdatetime()
        - DateOfLastUpdate datetime2 null default sysdatetime()
- Alter all of the tables in this project and add the following columns to each of the tables: 
    - UserAuthorizationId INT NOT NULL
    - DateAdded datetime2 null default sysdatetime()
    - DateOfLastUpdate datetime2 null default sysdatetime()

# Presentation:
- Submit your Erwin models with your name in each of the model names (SQL Server 2019, PostgresSQL 11.x & MySQL 8.X).
- Submit your Erwin FET DDL with your name in the model name.
- Use Redgate SQL.doc to create a PDF of your forward-engineered (FET) design into the SQL server database.
- Create a PowerPoint describing your Domain modeling strategy.
- Create an MP4 (20 minutes in length) based upon your PowerPoint, covering all of your insights and specifics of the features used in Erwin DM to complete your individual project.

## Sample skills acquired through these NACE CAREER READINESS COMPETENCIES for this individual assignment:
- Career & Self-Development: Demonstrated the ability to set goals, identify strengths and weaknesses, and create effective career development plans.
- Communication: Enhanced verbal and written communication skills, fostering clear and concise messages to interact effectively with others.
- Critical Thinking: Developed analytical and problem-solving abilities to approach challenges with a systematic and innovative mindset.
- Professionalism: Cultivated a professional demeanor, adhering to ethical standards and displaying accountability and reliability in the workplace.
- Technology: Acquired proficiency in relevant technologies, leveraging them to improve efficiency and productivity in job-related tasks.
- Submit the video link and any associated materials on Blackboard.
