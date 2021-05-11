---- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no,e.last_name,e.first_name,e.sex,s.salary from employees e
inner join salaries s on e.emp_no=s.emp_no order by e.emp_no;

---2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name,last_name,hire_date from employees where extract ( year from hire_date)=1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


select d.dept_no,d.emp_no,dp.dept_name,e.last_name,e.first_name from dept_manager d 
join employees e ON d.emp_no=e.emp_no
join departments dp ON d.dept_no=dp.dept_no order by d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,dp.dept_name from employees e 
left join dept_emp d ON e.emp_no=d.emp_no
left  join departments dp on d.dept_no=dp.dept_no order by e.emp_no;


----5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name,last_name,sex from employees where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name

select e.emp_no,e.last_name,e.first_name,dp.dept_name from employees e 
left join dept_emp d ON e.emp_no=d.emp_no
left  join departments dp on d.dept_no=dp.dept_no where d.dept_no='d007' order by e.emp_no

---7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,dp.dept_name from employees e 
left join dept_emp d ON e.emp_no=d.emp_no
left  join departments dp on d.dept_no=dp.dept_no where (d.dept_no='d007' or d.dept_no='d005' ) order by e.emp_no;

----8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name,count(last_name) as count from employees group by last_name order by count desc;