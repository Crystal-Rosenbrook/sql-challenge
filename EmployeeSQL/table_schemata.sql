CREATE TABLE "Departments" (
    "dept_no" VARCHAR(15)   NOT NULL,
    "dept_name" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR(15)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(55)   NOT NULL,
    "last_name" VARCHAR(55)   NOT NULL,
    "sex" VARCHAR(15)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(15)   NOT NULL,
    "emp_no" int   NOT NULL,
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(15)   NOT NULL,
);

CREATE TABLE "Salaries" (
    "salary" money   NOT NULL,
    "emp_no" int   NOT NULL,
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(15)   NOT NULL,
    "title" VARCHAR(55)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Dept_Manager"
	ADD COLUMN dept_mgr_id SERIAL PRIMARY KEY;
	
ALTER TABLE "Dept_Emp"
	ADD COLUMN dept_emp_id SERIAL PRIMARY KEY;

ALTER TABLE "Salaries"
	ADD COLUMN salary_id SERIAL PRIMARY KEY;    

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");