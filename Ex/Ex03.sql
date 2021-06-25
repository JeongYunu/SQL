/*그룹함수*/
select trunc(avg(salary), 0) --평균구하고 소수점 버리기
from employees;

--단일행 함수
select first_name, 
       round(salary, -4)
from employees;

--그룹함수 --> 오류발생(반드시 이유를 확인할것)
select first_name,
       avg(salary)
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select count(*), --row갯수(null포함)
       count(first_name), --컬럼명사용시 null을 제외한 count
       count(commission_pct) --컬럼명사용시 null을 제외한 count
from employees;

  --조건절 추가
select count(*)
from employees
where salary > 16000;

--그룹함수 sum()
select sum(salary),
       count(*) --천체 데이터를 하나로 표현할경우 같이 사용가능
from employees;

--그룹함수 avg() null일때 0으로 변환해서 사용
select count(*),
       sum(commission_pct), --전체 합계(107)
       count(commission_pct), --값이있는 전체 직원(35)
       
       avg(commission_pct), --null을 제외한 평균
       sum(commission_pct)/count(*), --전체 커미션합계 / row개수(107개)
       
       avg(nvl(commission_pct, 0)), --null을 0으로 변환해서 평균에 개입
       sum(commission_pct)/count(commission_pct) --전체 커미션합계 / 커미션 row개수(null제외)
from employees;

--그룹함수 max() min()
select max(salary),
       min(salary)
from employees;

/*group by 절*/
--전체부서, 급여출력, 부서id 오름차순
select department_id,
       salary
from employees
order by department_id asc;

--부서번호, 부서별 급여평균
select department_id,
       trunc(avg(salary), 0) --급여평균값에서 소수점 버림
from employees
group by department_id --id별로 그룹화
order by department_id asc; --id 오름차순 정렬

--group by 절 사용시 주의
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id;

--select절에는 group by에 참여한 컬럼만 사용할수있다
select department_id,
       --job_id, --여러컬럼을 동시사용할수없다. group by에 참여한 컬럼만 사용가능
       count(*),
       sum(salary)
from employees
group by department_id;

--group by 를 더 세분화
select department_id,
       job_id,
       avg(salary)
from employees
group by department_id, job_id
order by department_id asc;

--예제) 
/* 부서별로 부서 번호와, 인원수, 급여 합계를 출력하세요*/
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id
order by department_id asc;

/* 연봉의 합계가 20000 이상인 부서의 부서 번호와, 인원수, 급여 합계를 출력하세요*/
select department_id,
       count(*),
       sum(salary)
from employees
--where sum(salary) >= 20000 --where절에는 그룹함수를 사용할수없다
group by department_id
/*group by안에서 사용할수있는 having, group by에 
참여한 컬럼만 작성가능 group by 하위에 작성해야함*/
having sum(salary) >= 20000;

select department_id,
       count(*),
       sum(salary)
from employees
where department_id = 100
group by department_id;

/*
-select문 이해도-
select문
    select절
    from절
    where절
    group by절
    having절
    order by절
*/

--case ~end 문
/*
case when 조건 then 출력1
     when 조건 then 출력2 <- 필요시 추가
     else 출력3
end  "컬럼명"
*/
select employee_id,
       job_id,
       salary,
       case
         when job_id = 'AC_ACCOUNT' then salary+salary*0.1
         when job_id = 'SA_REP' then salary+salary*0.2
         when job_id = 'ST_CLERK' then salary+salary*0.3
         else salary
       end as rSalary
from employees;

--decode()
select employee_id,
       job_id,
       salary,
       decode(
            job_id, 'AC_ACCOUNT', salary+salary*0.1,
                    'SA_REP', salary+salary*0.2,
                    'ST_CLERK', salary+salary*0.3,
            salary
       ) as rSalary
from employees;
