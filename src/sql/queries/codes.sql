CREATE TABLE project_232.visitors (
 v_ssn INT PRIMARY KEY,
 v_name VARCHAR(255),
 v_surname VARCHAR(255)
);
CREATE TABLE project_232.v_phone_no (
id INT AUTO_INCREMENT,
 v_phone_no VARCHAR(255),
 v_ssn INT,
 PRIMARY KEY (id),
 FOREIGN KEY (v_ssn) REFERENCES project_232.visitors(v_ssn)
);
CREATE TABLE project_232.v_address (
id INT AUTO_INCREMENT,
 v_zip VARCHAR(255),
 v_city VARCHAR(255),
 v_ssn INT,
 PRIMARY KEY (id),
 FOREIGN KEY (v_ssn) REFERENCES project_232.visitors(v_ssn)
);
CREATE TABLE prisoners (
 p_ssn INT,
 p_name VARCHAR(255),
 p_surname VARCHAR(255),
 PRIMARY KEY (p_ssn)
);
CREATE TABLE sentences (
 sentence_id INT,
 sentence_name VARCHAR(255),
 PRIMARY KEY (sentence_id)
);
 
CREATE TABLE blocks (
 block_id INT,
 block_name VARCHAR(255),
 PRIMARY KEY (block_id)
);
CREATE TABLE employees (
 emp_ssn INT,
 emp_name VARCHAR(255),
 emp_surname VARCHAR(255),
 PRIMARY KEY (emp_ssn)
);
CREATE TABLE project_232.emp_address (
id INT AUTO_INCREMENT,
 emp_zip VARCHAR(255),
 emp_city VARCHAR(255),
 emp_ssn INT,
 PRIMARY KEY (id),
 FOREIGN KEY (emp_ssn) REFERENCES project_232.employee(emp_ssn)
);
CREATE TABLE project_232.emp_phone_no (
id INT AUTO_INCREMENT,
 emp_phone_no VARCHAR(255),
 emp_ssn INT,
 PRIMARY KEY (id),
 FOREIGN KEY (emp_ssn) REFERENCES project_232.employee(emp_ssn)
);

-- relationships
CREATE TABLE visits (
 id INT AUTO_INCREMENT,
 visitor_ssn INT,
 prisoner_ssn INT,
 visit_date DATE,
 PRIMARY KEY (id),
 FOREIGN KEY (visitor_ssn) REFERENCES project_232.visitors(v_ssn),
 FOREIGN KEY (prisoner_ssn) REFERENCES project_232.prisoners(p_ssn)
);
CREATE TABLE be_judged (
 id INT AUTO_INCREMENT,
 prisoner_ssn INT,
 sentence_id INT,
 judgement_date DATE,
 PRIMARY KEY (id),
 FOREIGN KEY (prisoner_ssn) REFERENCES project_232.prisoners(p_ssn),
 FOREIGN KEY (sentence_id) REFERENCES project_232.sentences(sentence_id)
);
CREATE TABLE stays (
 id INT AUTO_INCREMENT,
 prisoner_ssn INT,
 block_id INT,
 stay_start_date DATE,
 stay_end_date DATE,
 PRIMARY KEY (id),
 UNIQUE KEY(prisoner_ssn),
 FOREIGN KEY (prisoner_ssn) REFERENCES project_232.prisoners(p_ssn),
 FOREIGN KEY (block_id) REFERENCES project_232.blocks(block_id)
);
CREATE TABLE project_232.guards (
	id INT AUTO_INCREMENT,
    emp_ssn INT,
    block_id INT,
    guard_start_date DATE,
    guard_end_date DATE,
    PRIMARY KEY (id),
    UNIQUE KEY(emp_ssn),
    FOREIGN KEY (emp_ssn) REFERENCES project_232.employees(emp_ssn),
    FOREIGN KEY (block_id) REFERENCES project_232.blocks(block_id)
);
-- views
CREATE VIEW project_232.composite_view AS 
SELECT visitors.v_ssn, visitors.v_name, visitors.v_surname,
       v_phone_no.v_phone_no, v_address.v_zip, v_address.v_city
FROM project_232.visitors
LEFT JOIN project_232.v_phone_no ON visitors.v_ssn = v_phone_no.v_ssn
LEFT JOIN project_232.v_address ON visitors.v_ssn = v_address.v_ssn;

CREATE VIEW project_232.employee_view AS
SELECT e.emp_ssn, e.emp_name, e.emp_surname, a.emp_zip, a.emp_city, p.emp_phone_no
FROM project_232.employee e
JOIN project_232.emp_address a ON e.emp_ssn = a.emp_ssn
JOIN project_232.emp_phone_no p ON e.emp_ssn = p.emp_ssn;

CREATE VIEW project_232.prisoner_view AS
SELECT 
    p.p_ssn AS prisoner_ssn,
    p.p_name AS prisoner_name,
    p.p_surname AS prisoner_surname,
    j.sentence_id,
    s.sentence_name,
    st.block_id,
    b.block_name,
    st.stay_start_date,
    st.stay_end_date
FROM prisoners p
JOIN be_judged j ON p.p_ssn = j.prisoner_ssn
JOIN sentences s ON j.sentence_id = s.sentence_id
JOIN stays st ON p.p_ssn = st.prisoner_ssn
JOIN blocks b ON st.block_id = b.block_id;

CREATE VIEW project_232.employee_compound_view AS
SELECT 
    e.emp_ssn,
    e.emp_name,
    e.emp_surname,
    a.emp_zip,
    a.emp_city,
    p.emp_phone_no,
    g.block_id AS guarding_block,
    g.guard_start_date,
    g.guard_end_date
FROM project_232.employees e
JOIN project_232.emp_address a ON e.emp_ssn = a.emp_ssn
JOIN project_232.emp_phone_no p ON e.emp_ssn = p.emp_ssn
LEFT JOIN project_232.guards g ON e.emp_ssn = g.emp_ssn;

CREATE VIEW project_232.visitor_visit_prisoner_view AS
SELECT 
    v.v_ssn AS visitor_ssn,
    v.v_name AS visitor_name,
    v.v_surname AS visitor_surname,
    vi.prisoner_ssn,
    p.p_name AS prisoner_name,
    p.p_surname AS prisoner_surname,
    vi.visit_date
FROM project_232.visitors v
JOIN visits vi ON v.v_ssn = vi.visitor_ssn
JOIN prisoners p ON vi.prisoner_ssn = p.p_ssn;





