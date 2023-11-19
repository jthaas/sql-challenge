DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (dept_no varchar(15) primary key not null, dept_name varchar(20) not null);

select * from departments;


CREATE TABLE titles (title_id varchar(20) primary key not null, title varchar(20) not null);

select * from titles;


CREATE TABLE employees (emp_no int primary key not null, emp_title_id varchar(20) not null, birth_date date not null, 
						first_name varchar(20) not null, last_name varchar(20) not null, sex varchar(10) not null, 
						hire_date date not null, Foreign key (emp_title_id) References titles(title_id));

select * from employees;


CREATE TABLE dept_emp (emp_no int not null, dept_no varchar(15) not null, 
					   Foreign key (emp_no) References employees(emp_no),  
					   Foreign key (dept_no) References departments(dept_no));

select * from dept_emp;

CREATE TABLE dept_manager (dept_no varchar(15) not null, emp_no int not null,
						  Foreign key (dept_no) References departments(dept_no),
						  Foreign key (emp_no) References employees(emp_no));

select * from dept_manager;



CREATE TABLE salaries (emp_no int not null, salary int not null,
					  Foreign key(emp_no) References employees(emp_no));

select * from salaries;




-- When importing the data you must use the correct order 1.Departments 2. Titles 3. Employees , 4. dept _emp 5. dept_manager 6. salaries