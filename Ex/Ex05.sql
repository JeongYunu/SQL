/*
-EQUI Join --> null 포함되지 않는다
-OUTER Join(left right full) --> null 포함시켜야 할떄
 (+)<--dhfkzmf
-Self Join
*/

select emp.employee_id,
       emp.first_name,
       emp.manager_id,
       mana.first_name
from employees emp, employees mana
where emp.manager_id = mana.employee_id;

/*
SubQuery
*/
--Den의 급여
select salary
from employees
where first_name = 'Den';

--Den보다 급여가 많은사람은?
select first_name,
       salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den');
                
--예제) 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);
                
/*다중행 SubQuery*/
--부서번호 110인 직원의 급여 리스트를 구한다. -Shelley 12008, William 8300
select first_name,
       salary
from employees
where department_id = 110;

-- 급여가 12008, 8300인 직원리스트를 구한다
select first_name,
       salary
from employees
where salary = 12008
or salary = 8300;

select first_name,
       salary
from employees
where salary in (12008, 8300);

--두식을 조합한다
select first_name,
       salary
from employees
where salary in (select salary
                from employees
                where department_id = 110);
                
--예제) 각 부서별로 최고급여를 받는 사원을 출력하세요
--마케팅 유재석 10000, 배송 정우성 20000, 관리 이효리 30000
--1. 그룹별 최고급여를 구한다
select department_id,
       max(salary)
from employees
group by department_id;

--2. 사원테이블에서 그룹번호와 급여가 같은 직원의 정보를 구한다.
select first_name,
       salary
from employees
where (department_id, salary) in(select department_id,
                                 max(salary)
                                 from employees
                                 group by department_id);
       
--예제) 부서번호가 110인 직원의 급여 보다 큰 모든 직원의
-- 사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

--1. 부서번호가 110인 직원 리스트 12008, 8300
select salary
from employees
where department_id = 110;

--2. 부서번호가 110인 직원급여(12008, 8300) 보다 급여가 큰 직원리스트(사번, 이름, 급여)를 구하시오
select employee_id,
       first_name,
       salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 110); 
                    
--예제)
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1. 각부서별 최고 급여 리스트 구하기
select department_id,
       max(salary)
from employees
group by department_id;
       
--2. 직원테이블 부서코드, 급여가 동시에 같은 직원 리스트 출력하기
select first_name,
       department_id,
       salary
from employees
where (department_id, salary) in (select department_id,
                                  max(salary)
                                  from employees
                                  group by department_id);
  
--예제(Join)
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1. 각부서별 최고 급여 테이블 s
select department_id,
       max(salary)
from employees
group by department_id;


--2. 직원 테이블과 조인한다 e
    -- e.부서번호 = s.부서번호  e.급여 = s.급여(최고급여)
select e.employee_id,
       e.first_name,
       e.department_id, 
       e.salary,
       s.department_id, --추가된 컬럼
       s.mSalary        --추가된 컬럼
from employees e, (select department_id,
                    max(salary) mSalary
                    from employees
                    group by department_id) s
where e.department_id = s.department_id
and e.salary = s.mSalary;
       
/**********************
rownum
**********************/
--예) 급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
select rownum,
       employee_id,
       first_name,
       salary
from employees
where rownum >= 1
and rownum <= 5;

--급여를 내림차순으로 정렬먼저 하고 rownum
select rownum,
       ot.employee_id,
       ot.first_name,
       ot.salary
from (select employee_id,
             first_name,
             salary
      from employees
      order by salary desc) ot
where rownum >= 1 --rownum >= 2 --> 데이터가 없다
and rownum <= 5;

--정렬을하고 rownum하고 where절을 한다.
--(1)
select ort.rn,
       ort.employee_id,
       ort.first_name,
       ort.salary
from (select rownum rn,
             ot.employee_id,
             ot.first_name,
             ot.salary
      from (select  employee_id,
                    first_name,
                    salary
            from employees
            order by salary desc) ot) ort
where rn >=2
and rn <=5;

--예제) 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select oht.rn, 
       oht.first_name,
       oht.salary,
       oht.hire_date
from (select rownum rn,
             ht.first_name,
             ht.salary,
             ht.hire_date
      from (select first_name,
                   salary,
                   hire_date
           from employees
           where hire_date >= '07/01/01'
           and hire_date <= '07/12/31') ht
           order by salary desc) oht
where oht.rn >= 3
and oht.rn <= 7;










