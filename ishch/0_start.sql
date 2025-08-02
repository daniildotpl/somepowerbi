DROP TABLE IF EXISTS statinfo CASCADE;
###
DROP TABLE IF EXISTS population CASCADE;
###
CREATE TABLE test.statinfo  
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    year VARCHAR(30),
    region INT,
	tip_mo VARCHAR(30),
	visits INT,
    doctors INT,
    nurse INT
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
INSERT INTO test.population (year, region, population) 
VALUES 
('2025', '77', 13274285),
('2025', '67', 857847),
('2025', '87', 49527),
('2024', '77', 13274285),
('2024', '67', 857847),
('2024', '87', 49527);
###
INSERT INTO test.statinfo (year, region, tip_mo, visits, doctors, nurse) 
VALUES 
('2025', '77', 'health center', 100, 20, 40),
('2025', '77', 'health center', 100, 20, 40),
('2025', '77', 'polyclinic', 500, 20, 40),
('2025', '77', 'polyclinic', 800, 20, 40),
('2025', '77', 'polyclinic', 400, 20, 40),
('2025', '77', 'kid polyclinic', 100, 20, 40),
('2025', '77', 'hospital', 1000, 20, 40),
('2025', '77', 'hospital', 50, 20, 40),
('2025', '77', 'kid hospital', 150, 20, 40),
('2025', '67', 'health center', 100, 20, 40),
('2025', '67', 'polyclinic', 100, 20, 40),
('2025', '67', 'polyclinic', 100, 20, 40),
('2025', '67', 'kid polyclinic', 100, 20, 40),
('2025', '67', 'hospital', 100, 20, 40),
('2025', '87', 'health center', 100, 20, 40),
('2025', '87', 'polyclinic', 10, 20, 400),
('2024', '77', 'health center', 100, 20, 40),
('2024', '77', 'health center', 100, 20, 40),
('2024', '77', 'polyclinic', 500, 20, 40),
('2024', '77', 'polyclinic', 800, 20, 40),
('2024', '77', 'polyclinic', 400, 20, 40),
('2024', '77', 'kid polyclinic', 100, 20, 40),
('2024', '77', 'hospital', 1000, 20, 40),
('2024', '77', 'hospital', 50, 20, 40),
('2024', '77', 'kid hospital', 150, 20, 40),
('2024', '67', 'health center', 100, 20, 40),
('2024', '67', 'polyclinic', 100, 20, 40),
('2024', '67', 'polyclinic', 100, 20, 40),
('2024', '67', 'kid polyclinic', 100, 20, 40),
('2024', '67', 'hospital', 100, 20, 40),
('2024', '87', 'health center', 100, 20, 40),
('2024', '87', 'polyclinic', 10, 20, 400);
