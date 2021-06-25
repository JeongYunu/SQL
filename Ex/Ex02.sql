/*where절*/
--NULL
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

--예제) 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

--예제) 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name,
       manager_id
from employees
where commission_pct is null 
and manager_id is null;


--order by
select first_name,
       salary
from employees
order by salary desc; --내림차순

select first_name,
       salary
from employees
order by salary asc, first_name desc; --asc오름차순 (asc생략가능)

--select, from, where, order by 절 위치
select first_name,
       salary
from employees
where salary >= 9000
order by salary desc;

--예제) 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc;

--예제) 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name 
from employees
order by salary desc;

--예제) 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select *
from employees
order by department_id asc, salary desc;

/*단일행 함수*/
--가상의 테이블 dual
select initcap('aaaaaa')
from dual;

select email,
       initcap(email),
       department_id
from employees
where department_id = 100;

--lower(), upper()
select first_name,
       lower(first_name),
       upper(first_name)
from employees
where department_id = 100;

--substr(컬럼명, 시작위치, 글자수)
select substr('abcdefg', 3, 3)
from dual;

select first_name, 
       substr(first_name, 1, 3), --substr(컬럼명, 시자가위치, 글자수)
       substr(first_name, -3, 2) --음수도 가능 끝에서 3번째부터 2글자
from employees
where department_id = 100;

--LPAD/RPAD(컬럼명, 자리수, '채울문자') 
select first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
from employees;

--replace(컬럼명, 문자1, 문자2)
select first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, substr(first_name, 2, 3), '***') --함수안에 함수사용가능
from employees;

select first_name, 
       substr(first_name, 2, 3)
from employees;

/*숫자함수*/
--round(숫자, 출력을 원하는 자리수)
select round(123.345, 2) as r2,--소수점 2번째까지 반올림
       round(123.345, 0) as r0,
       round(123.345, -1) as "r-1"
from dual;

--trunc(숫자, 출력을 원하는 자리수)
select trunc(123.456, 2), --소수점 2번째이후로 버림
       trunc(123.956, 0),
       trunc(123.456, -1)
from dual;

--abs() 절대값
select abs(-5)
from dual;


/*날짜 함수*/
select sysdate --현재날짜
from dual; --가상테이블

--months_between(d1, d2)
select sysdate,
       hire_date,
       trunc (months_between(sysdate, hire_date), 0) --입사일부터 현재까지 개월수 출력 소수점버림
from employees
order by months_between(sysdate, hire_date) asc; --개월수 오름차순 정렬


/*변환함수*/
--to_char() 숫자를 문자열로
select first_name,
       salary*12,
       to_char(salary*12, '$999,999.00') 연봉
from employees
where department_id = 110;

select to_char(987654321, '999,999,999,999,999,999') 거래대금,
       to_char(9876, '99999'),
       to_char(9876, '099999'),
       to_char(9876, '$9999'),
       to_char(9876, '9999.99')
from dual;

--to_char() 날짜를 문자열로
select sysdate,
       to_char(sysdate, 'YYYY') 년,
       to_char(sysdate, 'YY') 년,
       to_char(sysdate, 'MM') 월,
       to_char(sysdate, 'MON') 월, --윈도우는 한글 유닉스는 영어
       to_char(sysdate, 'MONTH') 월,
       to_char(sysdate, 'DD') 일,
       to_char(sysdate, 'DAY') 요일, --윈도우는 한글 유닉스는 영어
       to_char(sysdate, 'HH') 시,
       to_char(sysdate, 'HH24') 시, --24시간 형식
       to_char(sysdate, 'MI') 분,
       to_char(sysdate, 'SS') 초,
       to_char(sysdate, 'YYYY-MM-DD') 년월일,
       to_char(sysdate, 'YYYY"년" MM"월" DD"일"') 년월일한글,
       to_char(sysdate, 'YY-MM-DD HH24:MI:SS') "년월일 시간"
from dual;

--nvl(컬럼명, null일때 값) nvl2(컬럼명, null아닐때 값, null일때 값)
select first_name,
       commission_pct,
       nvl(commission_pct, 0)
from employees;

select first_name,
       commission_pct,
       nvl2(commission_pct, 100, 50)
from employees;

select --first_name,
       avg(salary) --그룹함수 salary컬럼의 평균 값
from employees;
