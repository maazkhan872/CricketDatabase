🏏 Cricket Database Management System
📌 Project Overview

The Cricket Database Management System is a SQL-based project designed to manage and analyze cricket-related data such as teams, players, matches, tournaments, venues, coaches, and player statistics.

This project demonstrates fundamental concepts of Database Management Systems (DBMS) including relational schema design, table relationships, foreign keys, and SQL queries for data analysis.

🏛 Database Architecture & Schema Design
The project implements a highly normalized 3NF (Third Normal Form) schema to eliminate data redundancy and ensure referential integrity.

Core Entities: Players, Teams, Matches, Venues, and Umpires.

Performance Metrics: Detailed tables for Batting (Runs, Strike Rate, 4s/6s), Bowling (Wickets, Economy, Dots), and Fielding.

Relationship Mapping: Complex many-to-many relationships between players and matches, handled via optimized junction tables.

🧱 Database Structure

The database contains the following tables:

Table Name	Description
Coaches	Stores information about cricket team coaches
Team	Stores team details and links each team with a coach
Players	Contains player details including role, batting style, bowling style, and team
Venues	Stores cricket stadium or venue information
Umpire	Contains umpire information
Tournaments	Stores tournament name and year
Matches	Records match details including teams, venue, tournament, and umpires
Statistics	Stores player performance data such as runs and wickets

📊 Features

This project demonstrates:

Database creation and schema design

Table relationships using Foreign Keys

Data insertion using INSERT

Data modification using UPDATE

Data retrieval using SQL queries

Data aggregation using:

JOIN
GROUP BY
HAVING
ORDER BY
COUNT
SUM

💻 Technology 

RDBMSMySQL (DDL, DML, DCL)
Backend IntegrationJava (JDBC / Spring Data JPA)
ModelingER Diagram (MySQL Workbench)

⚡ Optimized Querying & Indexing
Clustered Indexing: Applied on Match_ID and Player_ID for sub-second query responses during large-scale data retrieval.

Stored Procedures: Automated calculation of "Player Rankings" and "In-Form Streaks" directly within the database layer.

▶️ How to Run the Project

Install MySQL Server

Open MySQL Workbench / Command Line
Run the SQL script:
source Cricket_24.sql;
The database and tables will be created automatically.

🎯 Learning Objectives

This project helps in understanding:

Database normalization
Relational database design
SQL queries for data manipulation
Data aggregation and analysis
Real-world sports database modeling

Database Enhancement: Added advanced SQL queries to the Cricket Database for professional analysis. These include: fetching match details along with umpire assignments, and analyzing the number of matches held at each venue. These queries improve the database’s usability and provide deeper insights into teams, players, and tournament statistics.
These queries use multi-table JOINs and aggregation to deliver clear insights into player performances, team statistics, and tournament results. This upgrade makes the database more analytical and professional, providing a strong demonstration of SQL proficiency and real-world relational database design.

Note:
The repository includes a comprehensive SQL script featuring:
Advanced Joins: Multi-table joins to generate a full Scorecard.
Window Functions: Used for calculating cumulative career runs over time.
Transaction Management: Ensuring atomicity during match data uploads.
