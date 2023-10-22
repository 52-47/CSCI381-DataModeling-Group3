# CSCI381-DataModeling-Group3
## PlaceHolder
# DATA-model-



- UserID: Int (Primary Key, Auto-incremented)
- Email: String
- PhoneNumber: String (Unique)
- Region: String
# eMovies Streaming Remodel

The eMovies Streaming Remodel project is aimed at modernizing the movie rental model using a comprehensive data model that streamlines the process and enhances the user experience. This project features user authentication via phone number, regional restrictions, secure payment processing, and integration with the IMDB API for movie details retrieval.

## Project Overview

The objective of this project was to design a movie streaming rental service with the following features:

## Project Steps

1. **Planning Entities and Attributes**: The project started with the planning of entities, attributes, and their relationships on a textpad.

2. **Erwin CDM and LDM Implementation**: The planned data model was implemented using erwin's Conceptual Data Model (CDM) and Logical Data Model (LDM) views, using eMovies as a guide.

3. **Bridge Tables for PDM**: Bridge tables were created in the Physical Data Model (PDM) to manage many-to-many relationships.

4. **Formatting and Documentation**: The project was formatted, relationships were renamed, a README was created, and the project was uploaded to GitHub.

## Data Model
-CDM



![image](https://github.com/kennethhas/DATA-model-/assets/60455294/40fa2161-90c3-4395-85d4-a56466d28671)


-LDM

![image](https://github.com/kennethhas/DATA-model-/assets/60455294/90729f86-88f2-4503-a483-ec380f3e06c4)



-PDM 

![image](https://github.com/kennethhas/DATA-model-/assets/60455294/c0a3e796-e021-4e42-8ce9-943a56d1b1b3)






### Entities and Attributes:

#### User:
#### Movie:
- MovieID: Int (Primary Key, Auto-incremented)
- Title: String
- MovieIMDBID: String (used to fetch movie details from IMDB on user devices)
- MovieSteamURL: String (movie storage bucket link)
- AvailableRegions: String (Comma-separated values e.g., "region1, region2, region3...")

#### Genre:
- GenreID: Int (Primary Key, Auto-incremented)
- Name: String

#### Actor:
- ActorID: Int (Primary Key, Auto-incremented)
- Name: String

#### MovieActor (Bridge table between Movie and Actor):
- MovieActorID: Int (Primary Key, Auto-incremented)
- MovieID: Foreign Key (referring to Movie)
- ActorID: Foreign Key (referring to Actor)

#### MovieGenre (Bridge table between Movie and Genre):
- MovieGenreID: Int (Primary Key, Auto-incremented)
- MovieID: Foreign Key (referring to Movie)
- GenreID: Foreign Key (referring to Genre)

#### Rental:
- RentalID: Int (Primary Key, Auto-incremented)
- UserID: Foreign Key (referring to User)
- MovieID: Foreign Key (referring to Movie)
- RentalDate: Date
- ExpiryDate: Date

#### Payment (Inserted by a third-party payment provider):
- PaymentID: Int (Primary Key, Auto-incremented)
- UserID: Foreign Key (referring to User)
- Amount: Decimal
- PaymentDate: Date
- EPaymentId: String

### Entity Relationships:

- User to Rental: One-to-many
- Movie to Rental: One-to-many
- User to Payment: One-to-many
- Movie to Actor (via MovieActor): Many-to-many
- Movie to Genre (via MovieGenre): Many-to-many

### Default Values:

This model enforces non-null requirements since it uses only essential entities and attributes to meet the project's requirements.

## Usage

To use the eMovies Streaming Remodel project, you can follow these steps:

- Clone the repository to your local machine.
- Set up the necessary dependencies and environment.
- Initialize the database and populate it with sample data.
- Start the server and access the platform through a web browser.

## Contact

If you have any questions or feedback, please feel free to contact us at Kennethhasiholan@gmail.com.

Thank you for using the eMovies Streaming Remodel project.
