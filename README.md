🏏 Cricket Database Management System
📌 Project Overview

The Cricket Database Management System is a SQL-based project designed to manage and analyze cricket-related data such as teams, players, matches, tournaments, venues, coaches, and player statistics.

This project demonstrates fundamental concepts of Database Management Systems (DBMS) including relational schema design, table relationships, foreign keys, and SQL queries for data analysis.

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

🛠️ Technologies Used

SQL
MySQL
Relational Database Concepts
DBMS

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
These queries use multi-table JOINs and aggregation to deliver clear insights into player performances, team statistics, and tournament results. This upgrade makes the database **more analytical and professional**, providing a strong demonstration of SQL proficiency and real-world relational database design.
