CREATE DATABASE Cricket_24;
use Cricket_24;

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

show tables;
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

CREATE TABLE Match_Teams (
    mt_id INT PRIMARY KEY AUTO_INCREMENT,
    m_id INT,
    t_id INT,
    team_role VARCHAR(20), -- Home / Away
    FOREIGN KEY (m_id) REFERENCES Matches(m_id),
    FOREIGN KEY (t_id) REFERENCES Team(t_id)
);

-- Insert data into Coach table
INSERT INTO Coaches (c_name) VALUES ('Gary Kirsten'),
('Jawed Miandad'),
('Wasim Akram'),
('Vivian Rechards'),
('Ian Chappel');
SELECT * FROM Coaches

SELECT p.p_name, t.t_name, c.c_name
FROM Players p
JOIN Team t ON p.t_id = t.t_id
JOIN Coaches c ON t.c_id = c.c_id;

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

-- Player Performance per Match
SELECT 
p.p_name,
m.m_id,
s.s_runs,
s.s_wickets
FROM Statistics s
JOIN Players p ON s.p_id = p.p_id
JOIN Matches m ON s.m_id = m.m_id;

-- Insert data into Venue table
INSERT INTO Venues (v_name) VALUES 
('National Stadium Karachi'),
('Eden Park'),
('Melbourne Cricket Ground (MCG)'),
('Old Trafford'),
('The Oval');
SELECT * FROM Venues

-- Top Run Scorers
SELECT 
p.p_name,
SUM(s.s_runs) AS TotalRuns
FROM Statistics s
JOIN Players p ON s.p_id = p.p_id
GROUP BY p.p_name
ORDER BY TotalRuns DESC;

INSERT INTO Umpire (u_name) VALUES
('Aleem Dar'),
('Kumar Dharmasena'),
('Rod Tucker'),
('Marais Erasmus'),
('Paul Reiffel');
SELECT * FROM Umpire

-- Tournament Matches
SELECT 
ta.ta_name,
COUNT(m.m_id) AS TotalMatches
FROM Matches m
JOIN Tournaments ta ON m.ta_id = ta.ta_id
GROUP BY ta.ta_name;

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

-- (Match + Umpires)
SELECT 
m.m_id,
m.DATE,
u1.u_name AS Umpire1,
u2.u_name AS Umpire2
FROM Matches m
LEFT JOIN Umpire u1 ON m.u1_id = u1.u_id
LEFT JOIN Umpire u2 ON m.u2_id = u2.u_id;

-- Venue Analysis
SELECT 
v.v_name AS VenueName,
COUNT(m.m_id) AS TotalMatches
FROM Venues v
LEFT JOIN Matches m ON v.v_id = m.v_id
GROUP BY v.v_name
ORDER BY TotalMatches DESC;

-- Added indexes on frequently used foreign keys to improve query performance --
CREATE INDEX idx_players_team ON Players(t_id);
SHOW INDEX FROM Players;

CREATE INDEX idx_matches_venue ON Matches(v_id);
EXPLAIN SELECT * 
FROM Matches 
WHERE v_id = 2;

EXPLAIN
SELECT m.m_id, v.v_name
FROM Matches m
JOIN Venues v ON m.v_id = v.v_id;

CREATE INDEX idx_statistics_player_match 
ON Statistics(p_id, m_id);

SHOW INDEX FROM Statistics;

-- Creating a composite index on team IDs to optimize match queries involving both teams -- 
CREATE INDEX idx_matches_team 
ON Matches(t1_id, t2_id);

-- Displaying all indexes on Matches table to verify index creation
SHOW INDEX FROM Matches;

-- Create Ball_By_Ball Table -- 
CREATE TABLE Ball_By_Ball (
    b_id INT PRIMARY KEY AUTO_INCREMENT,
    m_id INT,
    over_number INT,
    ball_number INT,
    striker_id INT,
    bowler_id INT,
    runs_scored INT,
    is_wicket BOOLEAN,
    
    FOREIGN KEY (m_id) REFERENCES Matches(m_id),
    FOREIGN KEY (striker_id) REFERENCES Players(p_id),
    FOREIGN KEY (bowler_id) REFERENCES Players(p_id)
);

-- Insertion --
INSERT INTO Ball_By_Ball 
(m_id, over_number, ball_number, striker_id, bowler_id, runs_scored, is_wicket)
VALUES
(1, 1, 1, 1, 3, 4, FALSE),
(1, 1, 2, 1, 3, 0, FALSE),
(1, 1, 3, 1, 3, 1, FALSE),
(1, 1, 4, 2, 3, 6, FALSE),
(1, 1, 5, 2, 3, 0, TRUE);

-- Runs per Player in a Match --
SELECT 
p.p_name,
SUM(b.runs_scored) AS TotalRuns
FROM Ball_By_Ball b
JOIN Players p ON b.striker_id = p.p_id
WHERE b.m_id = 1
GROUP BY p.p_name;

-- Wickets by Bowler --
SELECT 
p.p_name,
COUNT(*) AS Wickets
FROM Ball_By_Ball b
JOIN Players p ON b.bowler_id = p.p_id
WHERE b.is_wicket = TRUE
GROUP BY p.p_name;

CREATE INDEX idx_ball_match ON Ball_By_Ball(m_id);
SHOW INDEX FROM Matches
WHERE Key_name = 'idx_matches_team';

-- Show all indexes on Matches table
SHOW INDEX FROM Matches;

-- Create --
CREATE INDEX idx_statistics_match 
ON Statistics(m_id);

