  
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_id
from employees em,
     departments de
where em.department_id = de.department_id;


--모든 직원이름, 부서이름, 업무명을 출력하세요  Equi Join
select em.first_name,
       de.department_name,
       jo.job_title
from employees em,
     departments de,
     jobs jo
where em.department_id = de.department_id
and jo.job_id = em.job_id;
  
  
/* Outer Join ~ On */  
--Left Outer Join - Null을 포함하여 출력한다. 기준이 왼쪽테이블임
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em LEFT OUTER JOIN departments de
   ON em.department_id = de.department_id;
   

--Left Outer Join의 약식 코딩방법 / 왼쪽 기준이기때문에 Where 절 + 오른쪽컬럼에 (+)해줌
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em,
     departments de
where em.department_id = de.department_id(+);


--Right Outer Join - Null을 포함하여 출력한다. 기준이 오른쪽테이블임
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em Right outer join departments de
on em.department_id = de.department_id;


--Right Outer Join의 약식 코딩방법 / 오른쪽 기준이기때문에 Where 절 + 왼쪽컬럼에 (+)해줌
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em,
     departments de
where em.department_id(+) = de.department_id;


--Right Join -->> Left Join   기준이 되는 컬럼을 그냥 왼쪽에 두고 Left쓰는방법임 
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from departments de left outer join employees em
on em.department_id = de.department_id;


--Full Outer Join   양쪽 컬럼에 (+)(+) 사용불가!!!!!!
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;

--사용불가!
select em.employee_id,
       em.first_name,
       em.department_id,
       de.department_name
from employees em,
     departments de
where em.department_id(+) = de.department_id(+);


--Self Join 자신의 테이블을 다른변수명을 두어 똑같은테이블을 생성하는것
select em.employee_id,
       em.first_name,
       em.phone_number,
       em.manager_id,
       em.department_id,    
       ma.employee_id,
       ma.first_name,
       ma.phone_number
from employees em,
     employees ma
where em.manager_id = ma.employee_id;


--**잘못된 매칭방법임** 전혀상관없는 테이블의 컬럼을 매칭하면 안됌
select *
from employees em, locations lo
where em.salary = lo.location_id;

--모든 직원이름, 부서이름, 업무명 을 출력하세요
select em.first_name,
       de.department_name,
       jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;

/*OUTER Join*/
    --join 조건을 만족하지 않는 컬럼이 없는 경우 Null을 포함하여 결과를 생성
    --모든 행이 결과 테이블에 참여
    --NULL이 올 수 있는 쪽 조건에 (+)를 붙인다.
--종류
    --Left Outer Join: 왼쪽의 모든 튜플은 결과 테이블에 나타남
    --Right Outer Join: 오른쪽의 모든 튜플은 결과 테이블에 나타남
    --Full Outer Join: 양쪽 모두 결과 테이블에 참여

--Null을 포함 하지않음(106건)  
select e.department_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--Null을 포함(107건)
select e.department_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

--Null을 포함(107건) Left Outer Join
    --왼쪽 테이블의 모든 row를 결과에 나타냄
select e.department_id, e.first_name, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

--Null을 포함(
select e.department_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.department_id, e.first_name, d.department_name
from employees e  right outer join departments d
on e.department_id = d.department_id;