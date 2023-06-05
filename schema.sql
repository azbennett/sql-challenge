------------------------------------------------------------------------------------------
----- https://app.quickdatabasediagrams.com/#/d/L1QEKH ----
------------------------------------------------------------------------------------------

DROP TABLE Titles;

CREATE TABLE Titles (
  title_id VARCHAR(5) NOT NULL PRIMARY KEY,
  title VARCHAR(20) NOT NULL
);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Titles FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\titles.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Titles;
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE Employees;

CREATE TABLE Employees (
  emp_no INT NOT NULL PRIMARY KEY,
  emp_title VARCHAR(5) NOT NULL,
  birthdate DATE NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Employees FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\employees.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Employees;


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE Salaries;

CREATE TABLE Salaries (
  emp_no INT NOT NULL PRIMARY KEY,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Salaries FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\salaries.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Salaries;


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE Departments;

CREATE TABLE Departments (
  dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(20) NOT NULL
);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Departments FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\departments.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Departments;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE Department_mgr;

CREATE TABLE Department_mgr (
  dept_no VARCHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
  PRIMARY KEY (dept_no, emp_no)

);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Department_mgr FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\dept_manager.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Department_mgr;



------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE Employee_Dept_ID;

CREATE TABLE Employee_Dept_ID (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

--This is the fast way to import the CSV files into the tables --- may not work on all systems depending on windows security policy settings
--COPY Employee_Dept_ID FROM 'C:\Users\sbenn\Desktop\ASU\Classwork\git\sql-challenge\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
--good
--SELECT * FROM Employee_Dept_ID;


