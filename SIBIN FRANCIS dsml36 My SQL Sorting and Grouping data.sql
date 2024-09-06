CREATE TABLE Country (
Id INT PRIMARY KEY,
Country_name VARCHAR(50),
Population INT,
Area VARCHAR(50)
);

CREATE TABLE Persons (
Id INT PRIMARY KEY,
Fname VARCHAR(30),
Lname VARCHAR(30),
Population INT,
Rating FLOAT,
Country_Id INT,
Country_name VARCHAR(50),
FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES 
(1, 'USA', 331000000, 'California'),
(2, 'India', 1380000000, 'Maharashtra'),
(3, 'Canada', 38000000, 'Ontario'),
(4, 'Australia', 25600000, 'New South Wales'),
(5, 'UK', 67000000, 'London'),
(6, 'Germany', 83000000, 'Bavaria'),
(7, 'France', 67000000, 'Île-de-France'),
(8, 'Japan', 125000000, 'Tokyo'),
(9, 'Brazil', 213000000, 'São Paulo'),
(10, 'South Africa', 60000000, 'Gauteng');

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(1, 'John', 'Doe', 1000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 2000000, 4.8, 2, 'India'),
(3, 'Michael', 'Brown', 1500000, 4.2, 3, 'Canada'),
(4, 'Emily', 'Davis', 2500000, 3.9, 4, 'Australia'),
(5, 'James', 'Wilson', 1800000, 4.0, 5, 'UK'),
(6, 'Anna', 'Moore', 1300000, 4.6, 6, 'Germany'),
(7, 'Robert', 'Taylor', 1700000, 3.7, 7, 'France'),
(8, 'Linda', 'Anderson', 1400000, 4.9, 8, 'Japan'),
(9, 'David', 'Thomas', 2100000, 3.8, 9, 'Brazil'),
(10, 'Sarah', 'Jackson', 1600000, 4.3, 10, 'South Africa');

SELECT * FROM Country;
SELECT * FROM Persons;

# 1. Write an SQL query to print the first three characters of Country_name from the Country table. 

SELECT LEFT(Country_name, 3) AS FirstThreeCharacters FROM Country;

# 2. Write an SQL query to concatenate first name and last name from Persons table.

SELECT concat(Fname,' ',Lname) AS Full_Name FROM Persons;

# 3. Write an SQL query to count the number of unique country names from Persons table.

SELECT COUNT(DISTINCT Country_name) AS UniqueCountryName FROM Persons;

# 4. Write a query to print the maximum population from the Country table. 

SELECT max(Population) AS MaximumPopulation FROM Country;

# 5. Write a query to print the minimum population from Persons table.

SELECT min(Population) AS MinimumPopulation FROM Persons;

# 6. Insert 2 new rows to the Persons table making the Lname NULL.
# Then write another query to count Lname from Persons table.

# Foreign key Constrains
INSERT INTO Country (Id, Country_name, Population, Area) VALUES 
(11, 'UAE', 331500000, 'Abu Dhabi'),
(12, 'Turkey', 1385000000, 'Istanbul');

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES 
(11, 'Janice', NULL, 1200000, 4.6, 11, 'UAE'),
(12, 'Richie', NULL, 2200000, 4.9, 12, 'Turkey');

SELECT count(Lname) FROM Persons WHERE Lname IS NOT NULL;

# 7. Write a query to find the number of rows in the Persons table. 

SELECT COUNT(*) AS Rowcount FROM Persons;

# 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 

SELECT Population FROM Country LIMIT 3;

# 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 

SELECT * FROM Country 
ORDER BY rand() LIMIT 3;

# 10. List all persons ordered by their rating in descending order. 

SELECT Fname, Lname, Rating FROM Persons 
ORDER BY Rating DESC ;

# 11. Find the total population for each country in the Persons table. 

SELECT  Country_name, sum(Population) AS Total_Population FROM Persons
GROUP BY Country_name;

# 12. Find countries in the Persons table with a total population greater than 50,000

SELECT Country_Id, Country_name, Population FROM Persons WHERE Population > 50000;

# 13. List the total number of persons and average rating for each country, 
# but only for countries with more than 2 persons, ordered by the average rating in ascending order.

SELECT Country_Id, COUNT(*)  AS PersonCount, avg(Rating) AS AvgRating FROM Persons
GROUP BY Country_Id
HAVING COUNT(*) >2
ORDER BY avg(Rating) ASC ;




