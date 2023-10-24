# CSCI381-DataModeling-Group3
# Group Task List:

# Model Work, DDL, & SQL Server2019 Instantiation/Backup:
## Model Update:
**Aim to complete by 10/25/2023 EOD**
The model work will be performed during group meetings where all members contribute to the revisement/selection of: 
- business logic, 
- UML coloring, 
- schemas, 
- entities/tables, 
- attributes/columns, 
- domains/datatypes, 
- defaults, 
- validations, 
- sequences
- ...etc

## DDL, SQLServer2019 Instantatiation/Backup: 
**Aim to complete by 10/26**
This work will also be performed during group meetings following the completion of the model work. 

# Presentation Work:
**Submission Deadline: 10/29/2023**
**Group Deadline: 10/28/2023** 
- Group Intro Slide
- Explanation on how we decided on a model to use for the group.
- Business Logic of the group model.
- CDM, LDM, PDM overview

- Individual Sections (by Schema):
	- A. dEStreamingMovies Schema / Custom Domain Set:
		- All Top level custom domains & created schemas for said domains.

	- B. Sequence Schema:
		- Sequence Objects & Defaults for them

	- C. Person Schema:
		- Person
		- UML Coloring
		- ID Sequence
		- Domains & Datatypes chosen
		- Check Constraint for Gender
		- Default Values
		- Relationships & Multiplicites 
		
	- D. Geo Schema:
		- Locale, City, Address
		- UML Coloring
		- ID Sequences
		- Domains & Datatypes chosen
		- Check constraint for ZipCode
		- Default Values (if any)
		- Relationships & Multiplicites 

	- E. Sales:
		- Employee, SubscriptionTier, Payment
		- UML Coloring
		- ID Sequences
		- Domains & Datatypes chosen
		- Self referential join for Supervisor
		- Check constraint for Supervisor (TBD)
		- Check constraint for EmployeeLevel
		- Check constraint for PaymentStatus
		- Default Values
		- Relationships & Multiplicites 

	- F. Industry:
		- Content, Talent, ContentTalent, Genre
		- UML Coloring
		- ID Sequences
		- Domains & Datatypes chosen
		- Default Values
		- Relationships & Multiplicites 

	- G. Client:
		- Client, Device, DeviceType, WatchHistory, Subscription, PaymentType, CreditCard, ElectronicPayment
		- UML Coloring
		- ID Sequences
		- Domains & Datatypes chosen
		- Check constraint for Subscription Start / End Date
		- Check constraint for CreditCardNumber
		- Check constraint for CreditCardExpirationDate
		- Check constraint for CVC
		- Default Values
		- Relationships & Multiplicites 

**The next few sections we will alternate:**
- Generating DDL
- Instantiation in SQL Server 2019
- Creating the VHDX
- Conclusion about our experiences / teamwork.
	
