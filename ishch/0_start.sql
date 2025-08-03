CREATE DATABASE IF NOT EXISTS test CHARACTER SET utf8 COLLATE utf8_general_ci
###
GRANT ALL PRIVILEGES ON test.* TO 'dg'@'%';
###
FLUSH PRIVILEGES;
###
DROP TABLE IF EXISTS test.statinfo CASCADE;
###
DROP TABLE IF EXISTS test.population CASCADE;
###
CREATE TABLE test.statinfo  
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    year VARCHAR(30),
    region INT,
	tip_mo VARCHAR(30),
	visits INT,
    doctors INT,
    nurse INT,
    nursevisits INT
);
###
CREATE TABLE test.population  
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    year VARCHAR(30),
    region VARCHAR(30),
	population INT
);
###
INSERT INTO test.population (test.population.year, test.population.region, test.population.population) 
VALUES 
('2025', '77', 13274285),
('2025', '67', 857847),
('2025', '87', 49527),
('2024', '77', 13274285),
('2024', '67', 857847),
('2024', '87', 49527);
###
INSERT INTO test.statinfo (year, region, tip_mo, visits, doctors, nurse, nursevisits) 
VALUES 
('2025', '77', 'health center', 99, 15, 40, 10),
('2025', '77', 'health center', 80, 19, 40, 12),
('2025', '77', 'polyclinic', 100, 17, 40, 5),
('2025', '77', 'polyclinic', 600, 18, 40, 5),
('2025', '77', 'polyclinic', 397, 21, 40, 4),
('2025', '77', 'kid polyclinic', 15, 20, 40, 2),
('2025', '77', 'hospital', 800, 19, 40, 1),
('2025', '77', 'hospital', 40, 20, 40, 0),
('2025', '77', 'kid hospital', 160, 20, 40, 15),
('2025', '67', 'health center', 100, 20, 40, 15),
('2025', '67', 'polyclinic', 100, 20, 40, 15),
('2025', '67', 'polyclinic', 100, 20, 40, 15),
('2025', '67', 'kid polyclinic', 100, 20, 40, 15),
('2025', '67', 'hospital', 100, 20, 40, 115),
('2025', '87', 'health center', 100, 20, 40, 120),
('2025', '87', 'polyclinic', 10, 20, 400, 150),
('2024', '77', 'health center', 100, 20, 40, 15),
('2024', '77', 'health center', 100, 20, 40, 15),
('2024', '77', 'polyclinic', 500, 20, 40, 15),
('2024', '77', 'polyclinic', 800, 20, 40, 15),
('2024', '77', 'polyclinic', 400, 20, 40, 15),
('2024', '77', 'kid polyclinic', 100, 20, 40, 15),
('2024', '77', 'hospital', 1000, 20, 40, 15),
('2024', '77', 'hospital', 50, 20, 40, 15),
('2024', '77', 'kid hospital', 150, 20, 40, 15),
('2024', '67', 'health center', 100, 20, 40, 15),
('2024', '67', 'health center', 100, 20, 40, 15),
('2024', '67', 'polyclinic', 100, 20, 40, 15),
('2024', '67', 'polyclinic', 100, 20, 40, 15),
('2024', '67', 'polyclinic', 100, 20, 40, 15),
('2024', '67', 'kid polyclinic', 100, 20, 40, 15),
('2024', '67', 'hospital', 100, 20, 40, 145),
('2024', '87', 'health center', 100, 20, 5, 101),
('2024', '87', 'health center', 100, 20, 5, 101),
('2024', '87', 'polyclinic', 10, 20, 26, 122);