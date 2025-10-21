/*
==============================================================
 Project Title : Client Rental Database
 Description   : A property rental management database system
                 designed for a real estate company. 
                 Includes schema creation, dummy data insertion,
                 and 10 analytical SQL queries.

 Author         : Egshiglen Enkhbayar
 Tools Used     : MySQL Workbench
 Database Name  : client-rental-database
==============================================================
*/

-- =============================================================
-- SECTION 1: DATABASE CREATION
-- =============================================================

-- delete database if it already exists
DROP DATABASE IF EXISTS ClientRentalDB;

--create ClientRentalDB if it doesn't exist
CREATE DATABASE IF NOT EXISTS ClientRentalDB;

-- show existing databases
SHOW databases;

-- Use database
USE ClientRentalDB;

-- =============================================================
-- SECTION 2: TABLE CREATION
-- =============================================================

-- Clients table
DROP TABLE IF EXISTS Clients;
CREATE TABLE IF NOT EXISTS Clients(
    Client_No VARCHAR(20) NOT NULL PRIMARY KEY,          -- Unique client number with auto-increment, declared as the primary key
    Client_Name VARCHAR(100) NOT NULL                  -- Fullname of client, cannot be NULL 
    );
    
DESCRIBE Clients;
    
-- Owners table
DROP TABLE IF EXISTS Owners;
CREATE TABLE IF NOT EXISTS Owners(
    Owner_No VARCHAR(20) NOT NULL PRIMARY KEY,          -- Unique owner number with auto-increment, declared as the primary key
    Owner_Name VARCHAR(100) NOT NULL                  -- Fullname of owner, cannot be NULL 
    );
DESCRIBE Owners;

-- Properties table
DROP TABLE IF EXISTS Properties;
CREATE TABLE IF NOT EXISTS Properties(
	Property_No VARCHAR(20) PRIMARY KEY,        -- Unique property number with auto-increment, declared as the primary key
    Property_Address VARCHAR(200) NOT NULL,            -- Address of property, constraint of value being always provided
    Monthly_rent DECIMAL (10, 0) NOT NULL,             -- Rent amount monthly for up to 10 digits, but not fractions
    Owner_No VARCHAR(20) NOT NULL,                             -- Calling foreign key from Owners table
    FOREIGN KEY (Owner_No) REFERENCES Owners (Owner_No) ON DELETE CASCADE    -- if owner is deleted their property also will be deleted
    );

DESCRIBE Properties;

-- RentInfo table
DROP TABLE IF EXISTS RentInfo;
CREATE TABLE IF NOT EXISTS RentInfo(
    Client_No VARCHAR(20) NOT NULL,                           -- Foreign key from Client table
    Property_No  VARCHAR(20) NOT NULL,                         -- Foreign key from Properties table
    Rent_start DATE NOT NULL,                         -- Starting date of renting the property
    Rent_finish DATE NOT NULL,                        -- Finishing date of renting the property
    PRIMARY KEY (Client_No, Property_No),             -- Composite key = Client_No + Property_No
    FOREIGN KEY (Client_No) REFERENCES Clients(Client_No) ON DELETE CASCADE,  -- If a client is deleted their rental log will be deleted
    FOREIGN KEY (Property_No) REFERENCES Properties(Property_No) ON DELETE CASCADE -- If a property is deleted, their rental log will be deleted
    );
    
DESCRIBE RentInfo;

show tables;

				#Data Insertion

-- =============================================================
-- SECTION 3: DATA INSERTION
-- =============================================================

-- Insert Data into Clients Table
INSERT INTO Clients (Client_No, Client_Name)          -- Inserting client names and numbers to Cliens table
VALUES                                                -- Every name and number are dummy datas
('CR-01', 'Morris Dickerson'),
('CR-02', 'Derna Everett'),
('CR-03', 'Geraldine Levy'),
('CR-04', 'Betty Logan'),
('CR-05', 'Adrienne Basset'),
('CR-06', 'Denny Randall'),
('CR-07', 'Rod Hines'),
('CR-08', 'Yvette Austin'),
('CR-09', 'Donald Duncan'),
('CR-10', 'Russ Francis'),
('CR-11', 'Jeanette Dodge'),
('CR-12', 'Felicia Weston'),
('CR-13', 'Cesar Baker'),
('CR-14', 'Olivia Cline'),
('CR-15', 'Gabriel Whitaker');

SELECT * FROM Clients;                              -- Shows the new Clients table with the inserted information

-- Insert Data into Owners Table
INSERT INTO Owners (Owner_No, Owner_Name)           -- Inserting property owner names and numbers to Owners table
VALUES                                              -- Every name and number are dummy datas
('C001', 'Jan Dillon'),
('C002', 'Drew English'),
('C003', 'Tim Espinoza'),
('C004', 'Jaime Duncan'),
('C005', 'Brendan Patterson'),
('C006', 'Stewart Flowers'),
('C007', 'Eddie Simms'),
('C008', 'Lyle Reilly'),
('C009', 'Marguerite Morrison'),
('C010', 'Roger Eldridge');

SELECT * FROM Owners;                              -- Shows the new Owners table with the inserted information

-- Insert Data into Properties Table
INSERT INTO Properties (Property_No, Property_Address, Monthly_rent, Owner_No)    -- Inserting property information to Properties table
VALUES                                                                            -- Every address and numbers are dummy datas
('PG001', '1 South Circular Road, Dublin', '1000','C001'),
('PG002', '2 South Circular Road, Dublin', '1100','C002'),
('PG003', '3 South Circular Road, Dublin', '1200','C003'),
('PG004', '4 South Circular Road, Dublin', '1300','C004'),
('PG005', '5 South Circular Road, Dublin', '1400','C005'),
('PG006', '6 South Circular Road, Dublin', '1500','C006'),
('PG007', '7 South Circular Road, Dublin', '1600','C007'),
('PG008', '8 South Circular Road, Dublin', '1700','C008'),
('PG009', '9 South Circular Road, Dublin', '1800','C009'),
('PG010', '10 South Circular Road, Dublin', '1900','C010'),
('PG011', '11 South Circular Road, Dublin', '2000','C001'),
('PG012', '12 South Circular Road, Dublin', '2100','C002'),
('PG013', '13 South Circular Road, Dublin', '2200','C003'),
('PG014', '14 South Circular Road, Dublin', '2300','C004'),
('PG015', '15 South Circular Road, Dublin', '2400','C005');

SELECT * FROM Properties;                                                         -- Shows the new Properties table with the inserted information

-- Insert Data into RentInfo Table
INSERT INTO RentInfo (Client_No, Property_No, Rent_start, Rent_finish)          -- Inserting rent information to RentInfo table
VALUES                                                                          -- Every dates and numbers are dummy datas
('CR-01', 'PG001', '2021-06-01', '2021-08-01' ),
('CR-02', 'PG002', '2021-08-01', '2021-10-01' ),
('CR-03', 'PG003', '2021-10-01', '2021-12-01' ),
('CR-04', 'PG004', '2021-12-01', '2022-02-01' ),
('CR-05', 'PG005', '2022-02-01', '2022-04-01' ),
('CR-06', 'PG006', '2022-04-01', '2022-06-01' ),
('CR-07', 'PG007', '2022-06-01', '2022-08-01' ),
('CR-08', 'PG008', '2022-08-01', '2022-10-01' ),
('CR-09', 'PG009', '2022-10-01', '2022-12-01' ),
('CR-10', 'PG010', '2022-12-01', '2023-02-01' ),
('CR-11', 'PG011', '2023-02-01', '2023-04-01' ),
('CR-12', 'PG012', '2023-04-01', '2023-06-01' ),
('CR-13', 'PG013', '2023-06-01', '2023-08-01' ),
('CR-14', 'PG014', '2023-08-01', '2023-10-01' ),
('CR-15', 'PG015', '2023-10-01', '2024-01-01' );

-- =============================================================
-- SECTION 4: SQL QUERIES
-- =============================================================

SELECT * FROM RentInfo;                                                         -- Shows the new RentInfo table with the inserted information

				-- Queries
-- 1. Retrieve all clients along with their associated properties.
-- Option 1: Gives all the information including Client No, Name and Property No, Address and monthly rent amount

SELECT 															-- Joining Clients, Properties and RentInfo tables to show clients and their rented properties
    Clients.Client_No AS Client_No, 							-- Showing Client number from Clients table
    Clients.Client_Name AS Client_Name,							-- Showing Client name from Clients table
    Properties.Property_No AS Property_No,						-- Showing Property number from Properties table
    Properties.Property_Address AS Property_Address,			-- Showing Property Address from Properties table
    Properties.Monthly_rent AS Monthly_rent						-- Showting monthly rent amount from Properties table
FROM 
    RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
    Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
    Properties ON RentInfo.Property_No = Properties.Property_No;
    
-- Option 2: Only the client name and property address
SELECT 															-- Joining Clients, Properties and RentInfo tables to show clients and their rented properties
	Clients.Client_Name AS Client_Name,							-- Showing Client Names from Clients table
	Properties.Property_Address AS Property_Address  			-- Showing Property Address from Properties table
FROM 
    RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
    Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
    Properties ON RentInfo.Property_No = Properties.Property_No;
    
-- 2. List all properties rented out by all clients whose name begins with ‘D’.
-- Option 1: Giving client names with letter 'D' and the property number and address information
SELECT 															-- Joining Clients, Properties and RentInfo tables to show clients that their names start with letter 'D', and their rented properties
	Clients.Client_Name AS Client_Name_D,						-- Showing Client Names  from Clients table
    Properties.Property_No AS Property_No,  					-- Showing Property number from Properties table
    Properties.Property_Address AS Property_Address  			-- Showing Property Address from Properties table
FROM 
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
	Properties ON RentInfo.Property_No = Properties.Property_No
WHERE Clients.Client_Name LIKE 'D%';   							-- Choosing client names that starts with letter 'D' using LIKE operator to match the values

-- Option 2: Only showing the properties from the clients whose name starts with letter 'D'
SELECT 															-- Joining Clients, Properties and RentInfo tables to show clients that their names start with letter 'D', and their rented properties
    Properties.Property_No AS Property_No,  					-- Showing Property number from Properties table
    Properties.Property_Address AS Property_Address  			-- Showing Property Address from Properties table
FROM 
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
	Properties ON RentInfo.Property_No = Properties.Property_No
WHERE Clients.Client_Name LIKE 'D%';   							-- Choosing client names that starts with letter 'D' using LIKE operator to match the values

-- 3. List all clients who have properties rented out for a specific duration, from the date 2023-02-20 to 2023-10-20.
-- Option 1: Listing all clients with specific date range with their rent date information
SELECT 															-- Joining Clients and RentInfo table to list all the client who rented properties between 2023-02-20 to 2023-10-20
	Clients.Client_No, 											-- Showing Client number from Clients table
    Clients.Client_Name,										-- Showing Client Names  from Clients table
    RentInfo.Rent_start,										-- Showing start date  from RentInfo table
    RentInfo.Rent_finish										-- Showing finish date  from RentInfo table
FROM
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
WHERE					 										--  Finding clients who rented properties within specific date range
	RentInfo.Rent_start >= '2023-02-20'							-- if the start date is after 2023-02-20
    AND
    RentInfo.Rent_finish <= '2023-10-20';						-- if the finish date is before 2023-10-20

-- Option 2: Listing only the clients with specific date ranges without the rent date information
SELECT 															-- Joining Clients and RentInfo table to list all the client who rented properties between 2023-02-20 to 2023-10-20
	Clients.Client_No, 											-- Showing Client number from Clients table
    Clients.Client_Name										-- Showing Client Names  from Clients table
FROM
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
WHERE					 										--  Finding clients who rented properties within specific date range
	RentInfo.Rent_start >= '2023-02-20'							-- if the start date is after 2023-02-20
    AND
    RentInfo.Rent_finish <= '2023-10-20';						-- if the finish date is before 2023-10-20

-- 4. Calculate the total monthly rent for each client.
SELECT 															-- Joining Clients, Properties, RentInfo table to list all the client with their total monthly rent
	Clients.Client_No, 											-- Showing Client number from Clients table
    Clients.Client_Name,										-- Showing Client Names  from Clients table
    SUM(Properties.Monthly_rent) AS Total_Monthly_rent  		-- Calculating the total monthly rent for each client using SUM
FROM
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
	Properties ON RentInfo.Property_No = Properties.Property_No
GROUP BY														-- Grouping by client to find the total rent amount
	Clients.Client_No,
    Clients.Client_Name;

-- 5. Find the owner of a specific property.
SELECT 															-- Joining Properties and Owners table to find the owner of a specific property 
    Properties.Property_No, 				  					-- Showing Property number from Properties table
    Properties.Property_Address, 					  			-- Showing Property Address from Properties table
    Owners.Owner_name 								  			-- Showing Owner name from Owners table
FROM
	Properties
JOIN  															-- Linking Properties table to Owners table by Owner_No in both tables
	Owners ON Properties.Owner_No = Owners.Owner_No
WHERE 															-- Find the owner of the property number 15
	Properties.Property_No = 'PG015'; 
    
-- 6. Count the total number of properties owned by each owner.
SELECT  														-- Joining Properties and Owners table to find the total number of properties of each owner
    Owners.Owner_No,  								  			-- Showing Owner number from Owners table
    Owners.Owner_Name,  								  		-- Showing Owner name from Owners table
    COUNT(Properties.Property_No) AS Total_Properties_Count 	-- Calculating property count from Property table
FROM 
    Owners
JOIN 															-- Linking Owners table to Properties table to count properties by each owner
    Properties ON Owners.Owner_No = Properties.Owner_No
GROUP BY 														-- Grouping by owner to calculate property count
    Owners.Owner_No, 
    Owners.Owner_Name;
    
-- 7. Identify owners who own multiple properties.
SELECT  														-- Joining Properties and Owners table to find the owners who owns multiple properties
    Owners.Owner_No,  								  			-- Showing Owner number from Owners table
    Owners.Owner_Name,  								  		-- Showing Owner name from Owners table
    COUNT(Properties.Property_No) AS Total_Properties_Count 	-- Calculating property count from Property table
FROM 
    Owners
JOIN 															-- Linking Owners table to Properties table to count properties by each owner
    Properties ON Owners.Owner_No = Properties.Owner_No
GROUP BY 														-- Grouping by owner to calculate property count
    Owners.Owner_No, 
    Owners.Owner_Name
HAVING															-- Finding the owners who have more than 1 property	
	COUNT(Properties.Property_No) > 1;
    
-- 8. List all clients along with the total rent they pay annually, sorted in ascending order (i.e. lowest rent at the top).
SELECT 															-- Joining Clients, Properties, RentInfo table to list all the client with their annual rent sorted by ASC
	Clients.Client_No, 											-- Showing Client number from Clients table
    Clients.Client_Name,										-- Showing Client Names  from Clients table
    SUM(Properties.Monthly_rent * 12) AS Annual_rent  		    -- Calculating the total annual rent by multiplying each amount with 12
FROM
	RentInfo
JOIN 															--  Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
	Properties ON RentInfo.Property_No = Properties.Property_No
GROUP BY														-- Grouping by client to find the total annual rent amount
	Clients.Client_No,
    Clients.Client_Name
ORDER BY														-- Sorting the annual rent by lowest to highest
	Annual_rent ASC;
    
-- 9. Find the client who pays the highest monthly rent.
SELECT 															-- Joining Clients, Properties, RentInfo table to list all the client with the highest monthly rent
	Clients.Client_No, 											-- Showing Client number from Clients table
    Clients.Client_Name,										-- Showing Client Names  from Clients table
    Properties.Monthly_rent AS Highest_rent	  		    		-- Showing the highest amount of rent
FROM
	RentInfo
JOIN 															-- Linking RentInfo table to Clients table by Client_No in both tables
	Clients ON RentInfo.Client_No = Clients.Client_No
JOIN  															-- Linking RentInfo table to Properties table by Property_No in both tables
	Properties ON RentInfo.Property_No = Properties.Property_No
WHERE															-- Finding the highest paying rent from properties using MAX by filtering Monthly_rent
	Properties.Monthly_Rent = (
		SELECT MAX(Monthly_rent)
        FROM Properties);

-- 10. List all properties with rent amounts greater than the average rent amount across all properties. 
SELECT															-- Finding the average monthly rent
	AVG(Monthly_rent)
FROM
	Properties;
    
SELECT 															-- Selecting properties with rents that has greater amount than average
    Properties.Property_No, 				  					-- Showing Property number from Properties table
    Properties.Property_Address, 					  			-- Showing Property Address from Properties table
    Properties.Monthly_rent								  		-- Showing Monthly_rent from Properties table
FROM
	Properties
WHERE 															-- Find the property information that has more than average monthly rent
	Properties.Monthly_rent > (
		SELECT
			AVG(Monthly_rent)
            FROM
				Properties); 