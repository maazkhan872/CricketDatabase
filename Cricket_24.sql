CREATE DATABASE Cricket_24

-- Create the Coach table
CREATE TABLE Coaches (
c_id INT PRIMARY KEY AUTO_INCREMENT,
c_name VARCHAR(50) NOT NULL
)
-- Create the Team table
CREATE TABLE Team (
t_id INT PRIMARY KEY,
t_name VARCHAR(100) NOT NULL,
c_id INT,
FOREIGN KEY (c_id) REFERENCES Coaches(c_id)
)
-- Create the Player table
CREATE TABLE Players (
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_name VARCHAR(100) NOT NULL,
p_role VARCHAR(30) NOT NULL,
p_bowlingstyle VARCHAR(50),
p_battingstyle VARCHAR(50),
t_id INT,
FOREIGN KEY (t_id) REFERENCES Team(t_id)
)
-- Create the Venue table
CREATE TABLE Venues (
v_id INT PRIMARY KEY AUTO_INCREMENT,
v_name VARCHAR(100) NOT NULL
)
-- Create the Umpire table
CREATE TABLE Umpire (
u_id INT PRIMARY KEY AUTO_INCREMENT,
u_name VARCHAR(100) NOT NULL
)
ALTER TABLE Umpire
ADD COLUMN 
-- Create the Tournament table
CREATE TABLE Tournaments (
ta_id INT PRIMARY KEY AUTO_INCREMENT,
ta_name VARCHAR(100) NOT NULL,
ta_year INT
)
-- Create the Match table
CREATE TABLE Matches (
    m_id INT PRIMARY KEY AUTO_INCREMENT,
    DATE DATE NOT NULL,
    m_result VARCHAR(25) NOT NULL,
    v_id INT,
    t1_id INT,
    t2_id INT,
    ta_id INT,
    u1_id INT,
    u2_id INT,
    FOREIGN KEY (v_id) REFERENCES Venues(v_id),
    FOREIGN KEY (t1_id) REFERENCES Team(t_id),
    FOREIGN KEY (t2_id) REFERENCES Team(t_id),
    FOREIGN KEY (ta_id) REFERENCES Tournaments(ta_id),
    FOREIGN KEY (u1_id) REFERENCES Umpire(u_id),
    FOREIGN KEY (u2_id) REFERENCES Umpire(u_id)
)
-- Create the Statistics table
CREATE TABLE Statistics (
s_id INT PRIMARY KEY AUTO_INCREMENT,
p_id INT,
m_id INT,
s_runs INT,
s_wickets INT,
FOREIGN KEY (p_id) REFERENCES Players(p_id),
FOREIGN KEY (m_id) REFERENCES Matches(m_id)
)

-- Insert data into Coach table
INSERT INTO Coaches (c_name) VALUES ('Gary Kirsten'),
('Jawed Miandad'),
('Wasim Akram'),
('Vivian Rechards'),
('Ian Chappel');
SELECT * FROM Coaches

-- Insert data into Team table
INSERT INTO Team (t_id, t_name, c_id) VALUES 
(1,'Pakistan', 1),
(2,'New Zealand', 2),
(3,'India', 3),
(4,'Australia', 5),
(5,'South Africa', 4);
SELECT * FROM Team

-- Insert data into Player table
INSERT INTO Players (p_name, p_role, p_bowlingstyle, p_battingstyle, t_id) VALUES 
('Virat Kohli', 'Batsmen', NULL, 'Righ-Hand-Batsmen', 3 ),
('Bobzie Azam', 'Batsmen', NULL, 'Righ-Hand-Batsmen', 1 ),
('Muhammad Amir', 'Bowler', 'Left-Handed', 'Left-Hand-Batsmen', 1 ),
('Ab de Villiars', 'Batsmen', NULL, 'Righ-Hand-Batsmen', 5 ),
('Mitchel Starc', 'Bowler', 'Left-Hand', 'Left-Hand-Batsmen', 4);
SELECT * FROM Players

-- Insert data into Venue table
INSERT INTO Venues (v_name) VALUES 
('National Stadium Karachi'),
('Eden Park'),
('Melbourne Cricket Ground (MCG)'),
('Old Trafford'),
('The Oval');
SELECT * FROM Venues


INSERT INTO Umpire (u_name) VALUES
('Aleem Dar'),
('Kumar Dharmasena'),
('Rod Tucker'),
('Marais Erasmus'),
('Paul Reiffel');
SELECT * FROM Umpire

-- Insert data into Tournament table
INSERT INTO Tournaments (ta_name, ta_year) VALUES
('ICC T20 World Cup', 2024),
('ICC World Cup', 2023),
('ICC T20 World Cup', 2022),
('ICC Champions Trophy', 2025);
SELECT * FROM Tournaments

-- Insert data into Match table
INSERT INTO Matches (DATE, m_result, v_id, t1_id, t2_id, ta_id, u1_id, u2_id) 
VALUES 
('2024-06-30', 'Won', 1, 2, 1, 1, 2, NULL),
('2024-06-27', 'Won', 2, 3, 4, 2, 2, 1);
SELECT * FROM Matches

INSERT INTO Statistics (p_id , m_id, s_runs, s_wickets) 
VALUES 
(1, 1, 75, 0),
(2, 1, 55, 1),
(1, 2, 175, 0),
(2, 2, 210, 0);
SELECT * FROM Statistics

UPDATE Matches
SET v_id = 2
WHERE m_id = 1;
SELECT * FROM Matches

UPDATE Coaches
SET c_name = 'Micky Arthur'
WHERE c_id = 2;
SELECT * FROM Coaches

SELECT Players.p_name AS PlayerName,
Team.t_name AS TeamName
FROM Players
JOIN Team ON Players.t_id = Team.t_id;
    
SELECT Players.p_name AS PlayerName,
Team.t_name AS TeamName,
Coaches.c_name AS CoachName
FROM Players
JOIN Team ON Players.t_id = Team.t_id
JOIN Coaches ON Team.c_id = Coaches.c_id;
    
SELECT Team.t_name AS TeamName,
COUNT(Players.p_id) AS NumberOfPlayers
FROM Players
JOIN Team ON Players.t_id = Team.t_id
GROUP BY Team.t_name;
    
SELECT Team.t_name AS TeamName,
COUNT(Players.p_id) AS NumberOfPlayers
FROM Players
JOIN Team ON Players.t_id = Team.t_id
GROUP BY Team.t_name
HAVING COUNT(Players.p_id) > 1;
    
SELECT Players.p_name AS PlayerName,
SUM(Statistics.s_runs) AS TotalRuns
FROM Players
JOIN Statistics ON Players.p_id = Statistics.p_id
GROUP BY Players.p_name
HAVING SUM(Statistics.s_runs) > 100;

SELECT Team.t_name AS TeamName,
COUNT(Matches.m_id) AS NumberOfMatches
FROM Matches
JOIN Team ON Matches.t1_id = Team.t_id OR Matches.t2_id = Team.t_id
GROUP BY Team.t_name;

SELECT 
t_id,
t_name AS TeamName,
c_id
FROM Team
ORDER BY t_name ASC;

SELECT 
v_id,
v_name AS VenueName
FROM Venues
ORDER BY v_name ASC;

SELECT Players.p_name AS PlayerName,
SUM(Statistics.s_wickets) AS TotalWickets
FROM Players
JOIN Statistics ON Players.p_id = Statistics.p_id
GROUP BY Players.p_name
ORDER BY TotalWickets DESC;


