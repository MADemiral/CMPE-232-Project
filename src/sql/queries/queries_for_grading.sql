-- random table for alter and drop
CREATE TABLE bos (
 bos_id INT,
 bos_name VARCHAR(255),
 PRIMARY KEY (bos_id)
 );

-- Alter
ALTER TABLE project_232.bos
ADD COLUMN v_gender VARCHAR(10);

-- Drop
DROP TABLE project_232.bos;

-- Insert
INSERT INTO project_232.bos (bos_id, bos_name, v_gender) VALUES
(1, 'John', 'M'),
(2, 'Jane', 'F'),
(3, 'Bob', 'M');

-- Delete
DELETE FROM project_232.bos WHERE bos_id = 1;

-- Update
UPDATE project_232.bos SET bos_name = 'UpdatedName' WHERE bos_id = 3;

-- JOIN (2)
SELECT * FROM project_232.visitors
INNER JOIN project_232.v_phone_no ON visitors.v_ssn = v_phone_no.v_ssn;

-- JOIN (3)
SELECT * FROM project_232.visitors
INNER JOIN project_232.v_phone_no ON visitors.v_ssn = v_phone_no.v_ssn
INNER JOIN project_232.v_address ON visitors.v_ssn = v_address.v_ssn;

-- JOIN (Outer)
SELECT * FROM project_232.visitors
LEFT JOIN project_232.v_phone_no ON visitors.v_ssn = v_phone_no.v_ssn;

-- Single-row Subquery
SELECT v_name FROM project_232.visitors WHERE v_ssn = (SELECT MAX(v_ssn) FROM project_232.visitors);

-- Multiple-row Subquery -- Düzelticls
SELECT v_ssn, v_name, v_surname, v_phone_no FROM project_232.visitors, v_phone_no WHERE visitors.v_ssn IN (SELECT v_ssn FROM project_232.v_phone_no ); 

-- WHERE AND/OR 
SELECT * FROM project_232.v_address WHERE v_city = 'Ankara' AND (v_zip = '06600' OR v_zip = '06400');

-- AVG 
SELECT AVG(Year(guards.guard_start_date)) FROM project_232.guards;

-- COUNT
SELECT COUNT(*) FROM project_232.prisoners;

-- SUM databasede yok
SELECT SUM(emp_salary) FROM project_232.employees;

-- ORDER BY ASC/DESC
SELECT * FROM project_232.visitors ORDER BY v_name ASC;

-- GROUP BY
SELECT block_id, COUNT(*) FROM project_232.stays GROUP BY block_id;

-- HAVING
SELECT block_id, COUNT(*) FROM project_232.stays GROUP BY block_id HAVING COUNT(*) > 1;

-- EXISTS/NOT EXISTS
SELECT * FROM project_232.prisoners WHERE EXISTS (SELECT * FROM project_232.stays WHERE stays.prisoner_ssn = prisoners.p_ssn);

-- LIKE
SELECT * FROM project_232.visitors WHERE v_name LIKE 'J%';

-- DISTINCT düzeltileck
SELECT DISTINCT v_city FROM project_232.v_address;

-- IS NULL 
SELECT * FROM project_232.v_address WHERE v_zip IS  NOT NULL;

-- IN/NOT IN
SELECT * FROM project_232.v_address WHERE v_city IN ('Ankara', 'Istanbul');

-- BETWEEN AND
SELECT * FROM project_232.visitors WHERE v_ssn BETWEEN 111111111 AND 555555555;

-- MIN/MAX
SELECT MIN(stay_start_date), MAX(stay_end_date) FROM project_232.stays;

-- SOME (Düzeltilcek)
SELECT * FROM project_232.guards WHERE guards.guard_start_date > SOME (SELECT guard_start_date FROM project_232.guards where guard_start_date > (SELECT AVG(Year(guards.guard_start_date)) FROM project_232.guards));

-- ALL (düzeltilcek)
SELECT * FROM project_232.guards WHERE guards.guard_end_date > ALL (SELECT guard_start_date FROM project_232.guards where guard_start_date > (SELECT AVG(Year(guards.guard_start_date)) FROM project_232.guards));

-- CASE-WHEN
SELECT v_ssn, 
       CASE WHEN v_city = 'Ankara' THEN 'Iç Anadolu' 
            WHEN v_city = 'Istanbul' THEN 'Marmara' 
            ELSE 'Turkiyeli' END AS region
FROM project_232.v_address;

-- Unique Constraint ekleme yapılcak
ALTER TABLE project_232.bos ADD CONSTRAINT bos_c UNIQUE (bos_name);

-- Subquery in the FROM
SELECT v_ssn FROM (SELECT * FROM project_232.v_address WHERE v_city = 'Ankara') AS AnkaraVisitors;

-- String Operations
SELECT CONCAT(v_name, ' ', v_surname) AS full_name FROM project_232.visitors;

-- Union/Except/Intersect
SELECT v_name FROM project_232.visitors
UNION
SELECT emp_name FROM project_232.employees;


