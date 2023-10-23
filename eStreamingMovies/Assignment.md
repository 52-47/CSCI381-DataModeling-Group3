# eStreamingMovies Project 1

- The group Erwin Model for the project submitted by the group project leader only.
- Make sure to make use of your business rules with: 
    - defaults
    - validation rules 
    - fully qualified domains (User defined Datatypes) 
        - using dDomainName and sdDomainName with the physical side mapping the Domain Parent to a SchemaName.
- Be really judicious in setting Attribute\Column datatype sizes for memory and disk consideration.
- Create the FET ddl from the group Erwin Model and create it in SQL Server, then back it up and submit in your VHDX files.
- The Individual Erwin Model for the individual project with the group member's name in the model in ERwin 12.1 format.
- Create the FET ddl from the individual  Erwin Model  with the group member's your name in the model

## Submit the link to your VHDX file of all of yours work on Blackboard.
### This is required for all future project submissions.

## To Do
TODO:
1. Select a Group Model to use. 
    - Push individual work for Project 1 (if you haven't already) to our group repo in the directory: eStreamingMovies/Individual/%YOURNAME
    - Discuss the individual models in the repo and come to a consensus on which one to go forward with.
    - Review and define business logic of the model.
    - (Zoom meeting scheduled for Sunday 10/22/2023 @ 9pm)

2. Divide up the work/presentation (5 min each) into reviewing and defining: 
schemas, 
entities/tables, 
attributes/columns, 
relationships, 
domains (& mappings to schemas in PDM), 
default values, 
validation rules, 
sequence objects,
...etc 
to support the business logic.

**
Be mindful of assignment instructions: 
" - Make sure to make use of your business rules with defaults, validation rules, fully qualified domains (User defined Datatypes) usin dDomainName and sdDomainName with the physical side mapping the Domain Parent to a SchemaName.
  - Be really judicious in setting Attribute\Column datatype sizes for memory and disk consideration."
**

3. Create DDL & instantiate the model in SQLServer2019 Database.
4. Make a backup of the database (.bak)
5. Put all files (our entire git repo) and presentation on vhdx and drop it in a cloud storage.
6. Submit <= Sunday 10/29/2023

## Notes
It may be difficult for us to all manipulate the same file, so I'm thinking we should make a new set of working folders in the group directory (/eStreamingMovies/Group/%YOURNAME) similar to the ones we have in the /eStreamingMovies/Individual directory.  
Here, we can each take a copy of the original group model, make changes and push to our respective folders a timestamped file of the model with a commit message describing what was updated.  
Then, on the main group model we can run a complete compare in erwin to import the changes.  
It would be good if someone other than the author of the change did the complete compare & merge, so they can try to catch any errors that might have been missed by the author (similar to a pull request process, just ping the discord group chat and ask to get a PR for your change).