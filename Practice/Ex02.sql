/************************************
* 05일차 수업 SubQuery
************************************/
-- 'Den' 보다 월급을 많이 받는 사람의 월급은?
select  salary
from employees
where first_name = 'Den'; -- 11000

select  first_name, salary
from employees
where salary >= (select  salary
				 from employees
				 where first_name = 'Den');
                 
select  min(salary)
from employees;

select  first_name,
		salary,
        employee_id
from employees
where salary = (select  min(salary)
				from employees);
                
select  avg(salary)
from employees;

select  first_name,
		salary,
		employee_id
from employees
where salary < (select  avg(salary)
				from employees);
						
/*
부서번호가 110인 직원이의 급여와 같은 월급을 받는 모든 직원의 사번, 이름, 급여를 출력하세요
*/

select salary
from employees
where department_id = 110;

select  employee_id,
		first_name,
        salary
from employees
where salary = (select salary
				from employees
				where department_id = 110); -- 값이 2개라 출력할 수 없음
                
select  employee_id,
		first_name,
        salary
from employees
where salary in (select salary
				 from employees
				 where department_id = 110); -- where in으로 여러개 값 받을 수 있음
                
select  employee_id,
		first_name,
        salary
from employees
where salary = 12008.00
or salary = 8300.00;

select  department_id,
		max(salary)
from employees
group by department_id;

select  department_id,
		first_name,
		salary
from employees
where (department_id, salary) in (select  department_id, max(salary)
								  from employees
								  group by department_id);
                                  
select  max(salary), min(salary), department_id
from employees
group by department_id;

select  first_name, salary, department_id
from employees
where (salary, department_id) in (select  max(salary), department_id
													from employees
													group by department_id);
                                                    
select  first_name, salary, department_id
from employees
where (salary, department_id) in (select  min(salary), department_id
													from employees
													group by department_id);
                                                    
select  max(salary), department_id
from employees
group by department_id;

select  department_id, employee_id, first_name, salary
from employees
where (salary, department_id) in (select  max(salary), department_id
								  from employees
								  group by department_id);
                                  
select  *
from employees e,  (select  department_id, max(salary) maxSalary
					from employees
					group by department_id) s
where e.department_id = s.department_id
and e.salary = s.maxSalary
;

-- --------------------------------------
# limit
-- --------------------------------------
select *
from employees
order by employee_id asc
limit 4;

select *
from employees
order by employee_id asc
limit 5 offset 0;

select first_name, salary, hire_date
from employees
where hire_date between '07/01/01' and '07/12/31'
order by salary desc
limit 2, 5
;