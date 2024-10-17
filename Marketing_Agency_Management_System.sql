CREATE DATABASE Marketing_Agency_Management_System; 

USE Marketing_Agency_Management_System; 

-- Create tables & set data types, constraints, primary keys and foreign keys

CREATE TABLE departments (
    departmentID INT NOT NULL, 
    department VARCHAR(50) NOT NULL, 
    budget INT NOT NULL, 
    no_of_employees INT NOT NULL,
 CONSTRAINT 
  pk_departmentID 
 PRIMARY KEY (departmentID)
);

CREATE TABLE employees (
    employeeID INT NOT NULL, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    job_title VARCHAR(50),
    salary INT, 
    department INT, 
 CONSTRAINT 
  pk_employeeID 
 PRIMARY KEY (employeeID), 
   CONSTRAINT 
    fk_department 
   FOREIGN KEY (department) 
   REFERENCES departments (departmentID) 
);

ALTER TABLE employees
 DROP COLUMN salary; 

CREATE TABLE clients (
    clientID INT NOT NULL, 
    company_name VARCHAR(100) NOT NULL, 
    contact_name VARCHAR(50), 
    contact_email VARCHAR(100) NOT NULL, 
    city VARCHAR(50) NOT NULL, 
    industry VARCHAR(50) NOT NULL, 
 CONSTRAINT 
  pk_clientID
 PRIMARY KEY (clientID)
); 

CREATE TABLE campaigns (
    campaignID INT NOT NULL, 
    campaign_name VARCHAR(100) NOT NULL, 
    campaign_type VARCHAR(50) NOT NULL, 
    start_date DATE NOT NULL, 
    end_date DATE,
    budget INT NOT NULL,
    client INT, 
    c_department INT, 
 CONSTRAINT 
  pk_campaignID 
 PRIMARY KEY (campaignID), 
   CONSTRAINT 
    fk_client 
   FOREIGN KEY (client) 
   REFERENCES clients (clientID),
     CONSTRAINT 
      fk_c_department
	 FOREIGN KEY (c_department) 
     REFERENCES departments (departmentID)
);

CREATE TABLE consumers (
    consumerID INT NOT NULL, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    campaign INT, 
 CONSTRAINT 
  pk_consumerID 
 PRIMARY KEY (consumerID), 
   CONSTRAINT 
    fk_campaign 
   FOREIGN KEY (campaign) 
   REFERENCES campaigns (campaignID) 
); 

CREATE TABLE tasks (
    taskID INT NOT NULL, 
    t_campaign INT NOT NULL, 
    task_name VARCHAR(100) NOT NULL, 
    assigned_to INT, 
    due_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL, 
 CONSTRAINT
  pk_taskID 
 PRIMARY KEY (taskID), 
   CONSTRAINT 
    fk_t_campaign 
   FOREIGN KEY (t_campaign) 
   REFERENCES campaigns (campaignID), 
     CONSTRAINT 
      fk_assigned_to 
	 FOREIGN KEY (assigned_to) 
     REFERENCES employees (employeeID) 
); 
 
 ALTER TABLE tasks 
  MODIFY COLUMN t_campaign INT NULL; 
 
 CREATE TABLE expenses (
     expenseID INT NOT NULL, 
     e_campaign INT NOT NULL, 
     e_department INT NOT NULL, 
     expense_type VARCHAR(50) NOT NULL, 
     expense_amount INT NOT NULL, 
     expense_date DATE NOT NULL,
 CONSTRAINT 
  pk_expenseID 
 PRIMARY KEY (expenseID), 
   CONSTRAINT 
    fk_e_campaign 
   FOREIGN KEY (e_campaign) 
   REFERENCES campaigns (campaignID), 
     CONSTRAINT 
      fk_e_department 
	 FOREIGN KEY (e_department)
     REFERENCES departments (departmentID)
 ); 

ALTER TABLE expenses
 MODIFY COLUMN e_campaign INT NULL; 
 
ALTER TABLE expenses 
MODIFY COLUMN expense_amount FLOAT(2) NOT NULL; 

CREATE TABLE salaries (
    salaryID INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    salary INT NOT NULL,
    employee INT,
 CONSTRAINT
  pk_salaryID
 PRIMARY KEY (salaryID), 
   CONSTRAINT 
    fk_employeeID 
   FOREIGN KEY(employee)
   REFERENCES employees (employeeID) 
);

ALTER TABLE salaries 
 DROP COLUMN end_date; 
 
-- (To edit tables - ALTER TABLE table_name DROP/RENAME etc.) 

-- Populate tables with data 

-- insert data into departments 

INSERT INTO departments 
(departmentID, department, budget, no_of_employees) 
VALUES 
('1','Digital Marketing','500000','3'), 
('2','Social Media','250000','2'), 
('3','Public Relations','200000','4'), 
('4','Creative','750000','2'), 
('5','Strategy & Planning','400000','3'),
('6','Influencer & Affiliate Marketing','200000','2'),
('7','Analytics & Data','600000','2'), 
('8','Business Development & Sales','450000','3'),
('9','Legal','300000','1'),  
('10','Finance & Accounting','700000','2'), 
('11','Human Resources','200000','1');

SELECT * FROM departments; 

-- insert employees data 

INSERT INTO employees 
(employeeID, first_name, last_name, job_title, department) 
VALUES 
('1','Liam','Thompson','Digital Marketing Manager','1'), 
('2','Emma','Davis','PPC Specialist','1'), 
('3','Olivia','Martinez','SEO Specialist','1'), 
('4','Mason','Wilson','Content Creator','2'), 
('5','Ava','Clark','Social Media Manager','2'), 
('6','Isabella','Taylor','PR Manager','3'), 
('7','Lucas','White','PR Officer','3'), 
('8','Mia','Lewis','PR Officer','3'), 
('9','James','Walker','Communications Director','3'),  
('10','Benjamin','Hall','Creative Director','4'), 
('11','Charlotte','Young','Graphic Designer','4'), 
('12','Amelia','Scott','Marketing Strategist','5'), 
('13','Alexander','Green','Research Analyst','5'), 
('14','Harper','Adams','Research Analyst','5'), 
('15','William','Evans','Affiliate Marketing Specialist','6'), 
('16','Ella','Baker','Influencer Marketing Manager','6'), 
('17','Elijah','Phillips','Data Analyst','7'), 
('18','Grace','Ramirez','Marketing Analyst','7'), 
('19','Abigal','Mitchell','Business Development Manager','8'), 
('20','Sebastian','Turner','Sales Executive','8'),
('21','Lily','Parker','Leads Generator','8'), 
('22','Matthew','Collins','Legal Counsel','9'), 
('23','Chloe','Edwards','Accountant','10'), 
('24','Jackson','Stewart','Financial Analyst','10'), 
('25','Zoe','Rivera','HR Manager','11'); 

SELECT * FROM employees; 

-- insert clients data 

INSERT INTO clients 
(clientID, company_name, contact_name, contact_email, city, industry) 
VALUES 
('1','Vibrant Horizon Solutions','Stella','stellamorales@gmail.com','Los Angeles','Consulting'), 
('2','NextWave Innovations','Luke','lukejenkins@hotmail.co.uk','London', 'Tech'), 
('3','QuantumEdge Analytics','Brooklyn','brooklyn_rivera@gmail.com','New York', 'Data & AI'), 
('4','BlueArc Technologies','Connor','connor.perez@gmail.com','Los Angeles','Telecommunications'), 
('5','BrightPath Ventures','Aubrey','auberysanders@hotmail.co.uk','New York', 'Investment'); 

SELECT * FROM clients; 

-- insert campaign data 

INSERT INTO campaigns 
(campaignID, campaign_name, campaign_type, start_date, end_date, budget, client, c_department) 
VALUES 
('1','Empower Your Future','Email','2024-09-01','2024-12-01','10000','1','1'), 
('2','Code The Future','SEO','2024-06-30','2024-08-31','20000','2','1'), 
('3','Unlock Data Power','Social Media','2024-08-01','2024-10-31','40000','3','2'), 
('4','Empowering Connectivity','Public Relations','2024-07-01','2024-08-12','10000','4','3'), 
('5','Bright Tomorrow, Today','Affiliate Marketing','2024-09-01','2025-01-31','30000','5','6'); 

SELECT * FROM campaigns; 

-- insert consumers data

INSERT INTO consumers 
(consumerID, first_name, last_name, campaign) 
VALUES 
('1','Asher','Carter','1'), 
('2','Violet','Campbell','1'),
('3','Hunter','Ramirez','3'),
('4','Eleanor','Scott','2'),
('5','Aaron','Fisher','5'),
('6','Addison','Webb','4'),
('7','Adam','Sanders','2'),
('8','Natalie','Kelly','1'),
('9','Jason','Elliott','3'),
('10','Hazel','Murray','4'),
('11','Miles','Porter','3'),
('12','Samantha','Jenkins','2'),
('13','Declan','Butler','4'),
('14','Leah','Gray','2'),
('15','Anthony','Diaz','5'),
('16','Paisley','Kelly','5'),
('17','Thomas','Shaw','4'),
('18','Aurora','Lewis','2'),
('19','Ezra','Bennett','3'),
('20','Bella','Evans','4'); 

SELECT * FROM consumers; 

-- insert tasks data

INSERT INTO tasks 
(taskID, t_campaign, task_name, assigned_to, due_date, status) 
VALUES 
('1','1','Email Content Strategy','1','2024-08-10','Completed'), 
('2','1','A/B Subject Line Testing','3','2024-08-26','Active'), 
('3','1','Email Visuals','11','2024-08-12','Overdue'), 
('4','2','Keyword Search','3','2024-06-12','Completed'), 
('5','2','Backlink Strategy','1','2024-06-20','Completed'), 
('6','2','SEO Content','3','2024-06-25','Completed'),
('7','2','SEO Performance','2','2024-09-07','Active'), 
('8','3','Social Media Content Calendar','5','2024-07-14','Completed'), 
('9','3','Infographics','11','2024-07-21','Completed'), 
('10','3','Social Media Content','4','2024-07-31','Completed'),
('11','3','Paid Social Media Ads','2','2024-07-31','Completed'), 
('12','4','PR Objectives','13','2024-06-01','Completed'), 
('13','4','Press Materials','8','2024-06-20','Completed'), 
('14','4','Media Contact List','6','2024-06-25','Completed'), 
('15','4','Media Outlets Pitch','7','2024-06-25','Completed'), 
('16','4','Organise Press Events','9','2024-06-25','Completed'),
('17','5','Recruit Affiliates','15','2024-08-01','Completed'), 
('18','5','Identify Influencers','16','2024-08-21','Active'), 
('19','5','Affiliate Promotional Content','4','2024-08-25','Active'),
('20','4','Data Report','17','2024-08-16','Overdue'),
('21','4','Data Visualisation','18','2024-08-21','Active'); 

SELECT * FROM tasks; 

-- insert expenses data

INSERT INTO expenses 
(expenseID, e_campaign, e_department, expense_type, expense_amount, expense_date) 
VALUES 
('1','1','1',' Mailchimp Subscription','274.90','2024-08-01'), 
('2','1','4','Multimedia Production','500.00','2024-08-01'),
('3','4','3','Venue Hire','5000.00','2024-07-21'),
('4','4','3','Press Materials','1000.00','2024-06-12'),
('5','3','2','Social Media Ads','500.00','2024-07-31'),
('6','3','2','Canva Teams','270.00','2024-04-01');

SELECT * FROM expenses; 

-- insert salaries data 

INSERT INTO salaries 
(salaryID, start_date, salary, employee) 
VALUES 
('1','2024-04-01','55000','1'), 
('2','2012-04-02','60000','2'), 
('3','2019-06-03','75000','3'), 
('4','2020-11-23','45000','4'), 
('5','2019-06-03','50000','5'), 
('6','2017-08-28','35000','6'), 
('7','2010-12-13','100000','7'), 
('8','2020-03-01','37000','8'), 
('9','2021-04-30','45000','9'), 
('10','2019-07-01','60000','10'), 
('11','2020-07-31','55000','11'), 
('12','2022-04-01','50000','12'), 
('13','2023-06-01','45000','13'), 
('14','2023-12-01','47000','14'), 
('15','2023-04-30','45000','15'), 
('16','2021-07-01','40000','16'), 
('17','2020-03-31','42000','17'), 
('18','2022-06-12','37000','18'), 
('19','2020-05-24','50000','19'), 
('20','2019-03-31','65000','20'), 
('21','2022-07-31','42000','21'), 
('22','2021-09-01','60000','22'), 
('23','2022-09-30','45000','23'), 
('24','2021-01-14','60000','24'), 
('25','2022-03-01','50000','25'); 
 
SELECT * FROM salaries;  

-- using any type of joins, create a view to combine multiple tables in a logical way 

-- employee_salaries view using INNER JOIN 

CREATE VIEW employee_salaries AS
SELECT employeeID, first_name, last_name, salary 
 FROM employees 
INNER JOIN salaries 
  ON employeeID = employee; 

SELECT * FROM employee_salaries; 

-- employee_assignments view using LEFT JOIN 

CREATE VIEW employee_assignments AS 
SELECT employeeID, first_name, last_name, task_name, status
 FROM employees 
LEFT JOIN tasks 
  ON employeeID = assigned_to; 
  
SELECT * FROM employee_assignments; 

-- returns employees currently not assigned to a task 

SELECT first_name, last_name, task_name, status 
 FROM employee_assignments 
  WHERE status IS NULL; 
  
-- create stored function 

-- Function that caluclates a 10% bonus amount for employees

DELIMITER //
CREATE FUNCTION bonus(employeeID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE emp_salary DECIMAL(10, 2);
    DECLARE bonus DECIMAL(10, 2);
    SELECT salary INTO emp_salary
    FROM salaries
    WHERE employee = employeeID
    ORDER BY start_date DESC
    LIMIT 1;
    SET bonus = emp_salary * 0.10;
    RETURN IFNULL(bonus, 0);
END //
DELIMITER ;
SELECT bonus(3) AS bonus_amount;

-- create subquery 

-- An example query to find employees who joined the agency before 2020 and have a salary under £50000
SELECT
    e.employeeID,
    e.first_name,
    e.last_name,
    s.salary,
    s.start_date
FROM
    employees e
JOIN
    salaries s ON e.employeeID = s.employee
WHERE
    s.start_date 
IN 
( SELECT s.start_date 
  FROM salaries 
  WHERE s.start_date < '2020-01-01') 
AND
    s.salary 
IN 
( SELECT s.salary 
  FROM salaries 
  WHERE s.salary < 50000);

-- create a stored procedure 

-- Procedure that reutrns results for department expenses equal to or over £1000

DELIMITER //
CREATE PROCEDURE highest_department_expenses()
BEGIN
	SELECT *
    FROM expenses
    WHERE expense_amount >= 1000;
END //
DELIMITER ;
CALL highest_department_expenses();

-- create a trigger 

-- Trigger that updates department budget based on expenses update

DELIMITER //
CREATE TRIGGER expense_update2
	AFTER INSERT ON expenses
    FOR EACH ROW
BEGIN
    UPDATE departments
	SET budget = budget - NEW.expense_amount
    WHERE departmentID = NEW.e_department;
END //
DELIMITER ;
INSERT INTO expenses (expenseID, e_campaign, e_department, expense_type, expense_amount, expense_date)
VALUES (8, 1, 2, 'Team Party', 5000.99, '2024-08-01');
SELECT * FROM Departments;

-- create an event 

-- Event that increases employee salary by 5% if under £35000

DELIMITER //
CREATE EVENT IF NOT EXISTS update_salaries
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	UPDATE salaries
	SET salary = salary * 1.05
    WHERE salary <= 35000;
END //
DELIMITER ;

SELECT * FROM salaries; 

-- Create a view that uses at least 3-4 base tables + a query that uses the view to produce a logically arranged result set for analysis.

CREATE VIEW employee_task_overview AS
SELECT 
    e.employeeID, 
    e.first_name, 
    e.last_name, 
    d.department, 
    t.task_name, 
    t.due_date, 
    t.status 
FROM
    employees e 
INNER JOIN 
    departments d
ON  e.department = departmentID 
INNER JOIN 
    tasks t 
ON e.employeeID = t.assigned_to; 

SELECT * FROM employee_task_overview; 

-- WHERE & ORDER BY query 

SELECT 
    * 
FROM 
    employee_task_overview
WHERE 
    status = 'Active' 
ORDER BY due_date ASC; 

-- create a query using GROUP BY and HAVING 

SELECT 
     e.e_department DepartmentID, 
     d.department, 
     SUM(expense_amount) Total_Expenses
FROM 
    expenses e
INNER JOIN 
    departments d
 ON e_department = departmentID
GROUP BY e.e_department 
HAVING SUM(expense_amount) < 1000; 

-- Example query with GROUP BY and HAVING, to calculate the average salary for each department and only show departments where the average salary is greater than £50000

SELECT
    d.department,
    AVG(s.salary) AS avg_salary
FROM
    departments d
JOIN
    employees e ON d.departmentID = e.department
JOIN
    salaries s ON e.employeeID = s.employee
GROUP BY
    d.department
HAVING
    avg_salary > 50000;











