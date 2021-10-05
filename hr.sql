--employees 테이블 전체 내용 조회
SELECT * FROM employees;

--employees 테이블의 first_name, last_name, job_id만 조회
SELECT first_name, last_name, job_id from employees;

-- employee_id가 176인 사람의 LAST_NAME과 DEPARTMENT_ID 조회
select last_name, department_id from employees where employee_id=176;

-- salary가 12000이상 되는 직원들의 last name, salary 조회
select last_name, salary from employees where salary >= 12000;

-- salary가 5000~12000의 범위 이외인 사원들의 last_name, salary 조회
select last_name, salary from employees 
where salary<5000 or salary>12000;

select last_name, salary from employees 
where salary not between 5000 and 12000;

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 오름차순 조회
select last_name, department_id from employees 
where department_id in (20, 50) order by last_name, department_id;

--COMMISION_PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT조회
--단 Salary 내림차순, commission_pct 내림차순
select last_name, salary, commission_pct from employees 
where commission_pct>0 order by salary desc, commission_pct desc; 

--salary가 2500,3500, 7000이 아니며 job_id가 sa_Rep, st_clerk인 사원 조회
select * from employees where salary not in(2500,3500,7000) 
AND job_id in ('SA_REP', 'ST_CLERK'); 

--2008/02/20_2008/05/01 사이에 고용된 사원들의 last_name, employee_id, hire_date
--조회한다 hire_date 내림차순으로 조회
select last_name, employee_id, hire_date from employees 
where '2008-02-20'<=hire_date and hire_date<='2008-05-01'
order by hire_date desc;

select last_name, employee_id, hire_date from employees 
where hire_date between '2008-02-20' and '2008-05-01'
order by hire_date desc;


--2004년도에 고용된 모든 사람들의 last_name, hire_date 조회
--hire_date 오름차순 정렬
select last_name, hire_date from employees 
where '2004-01-01'<=hire_date and hire_date<='2004-12-31'
order by hire_date;

select last_name, hire_Date from employees
where hire_date between '2004-01-01' and ' 2004-12-31'
order by hire_Date asc;

select last_name, hire_date from employees 
where hire_date LIKE '04%'
order by hire_date;

--20번 및 50번 부서에서 근무하며, salary가 5000-12000 사이인 사원들의
--LAST_NAME 및 DEPARTMENT_ID 조회

select LAST_NAME, DEPARTMENT_ID from employees 
where department_id in (20,50) 
AND salary between 5000 and 12000;

-- LAST_NAME에 u가 포함되는 사원들의 사번 및 LAST_NAME 조회
select employee_id, last_name from employees
where last_name like '%u%';

-- LAST_NAME의 4번째 글자가 a인 사원들의 last_name 조회
select last_name from employees 
where last_name like '___a%';

-- LAST_NAME에 글자가 a 혹은 e 글자가 들어있는 사원들의 last_name 조회한 후
-- last_name 오름차순 조회
select last_name from employees
where last_name like '%a%' or last_name like '%e%'
order by last_name;

-- LAST_NAME에 글자가 a 와 e 글자가 들어있는 사원들의 last_name 조회한 후
-- last_name 오름차순 조회
select last_name from employees
where last_name like '%a%' and last_name like '%e%'
order by last_name;

select last_name from employees
where last_name like '%a%e%' or last_name like '%e%a%'
order by last_name;

--manager_id가 없는 사원들의 last_name, job_id 조회
select last_name, job_id from employees 
where manager_id is null;

--job_id가 ST_CLERK인 사원의 department_id 조회(단, 부서번호가 null인 것 제외)
select distinct department_id from employees 
where job_id = 'ST_CLERK' and department_id is not null;

-- commission_pct가 null이 아닌 사원들 중에서 commission = salary*commistion_pct를 구한후 
--employee_id, first_name, job_id, commission 조회

select employee_id, first_name, job_id, 
salary*commission_pct as commission 
from employees where commission_pct is not null;

SELECT LAST_NAME, SALARY, 
CASE WHEN SALARY BETWEEN 0 AND 1999 THEN 0
WHEN SALARY BETWEEN 2000 AND 3999 THEN 0.09
WHEN SALARY BETWEEN 4000 AND 5999 THEN 0.2
WHEN SALARY BETWEEN 6000 AND 7999 THEN 0.3
WHEN SALARY BETWEEN 8000 AND 9999 THEN 0.4
WHEN SALARY BETWEEN 10000 AND 11999 THEN 0.42
WHEN SALARY BETWEEN 12000 AND 13999 THEN 0.44
ELSE 0.45 END 
AS TAX_RATE FROM EMPLOYEES WHERE department_id=80;

SELECT LAST_NAME, SALARY, DECODE(TRUNC(SALARY/2000,0),
0,0.00,1,0.09,2,0.20,3,0.30,4,0.40,5,0.42,6,0.44,0.45) 
AS TAX_RATE FROM EMPLOYEES WHERE department_id=80;

--사원들의 최대 급여와 최소 급여의 차이를 조회
SELECT MAX(SALARY), MIN(SALARY),
MAX(SALARY)-MIN(SALARY) FROM EMPLOYEES;

--매니저로 근무하는 사원들의 총 수 조회(단, MANAGER_ID 중복 제거)
SELECT COUNT(DISTINCT MANAGER_ID) FROM EMPLOYEES;

--LAST_NAME에 U가 포함되는 사원들과 동일 부서에 근무하는 사원들의
--사번 및 LAST_NAME 조회

SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
(SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%');


CREATE TABLE INDEXTBL AS SELECT DISTINCT
FIRST_NAME, LAST_NAME, HIRE_DATE FROM employees;

--인덱스 생성 전 검새 방식 : FULL
SELECT * FROM INDEXTBL WHERE FIRST_NAME = 'Jack';

CREATE INDEX IDX_INDEXTBL_FIRSTNAME ON INDEXTBL(FIRST_NAME);

--인덱스 생성 후 검색 방식 : RANGE SCAN
SELECT * FROM INDEXTBL WHERE FIRST_NAME = 'Jack';




