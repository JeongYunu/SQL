--select절 from절

--모든 컬럼들 조회하기
select * 
from employees;

select * 
from departments;

--원하는 컬럼만 조회하기
select employee_id, first_name, first_name, last_name
from employees;

--출력할때 컬럼에 별명 사용하기/원컬럼은 변하지않음
select employee_id as empNO, --as키워드 는 대문자로만 표기 됨
       first_name "F-name", --as는 누락해도 상관없음
       salary "상 금" --공백이나 특수기호는 ""로 감싸야함
from employees;

--예제
select first_name 이름,
       phone_number 전화번호,
       hire_date 입사일,
       salary 급여
from employees;

select employee_id 사원번호,
       first_name 성,
       last_name 이름,
       salary 연봉,
       phone_number 전화번호,
       email 이메일,
       hire_date 입사일
from employees;

--연결 연산자(concatenation)로 컬럼들 붙이기
select first_name, last_name
from employees;

select first_name || last_name --2컬럼을 하나의 컬럼으로
from employees;

select first_name ||''|| last_name --||은 더하기 역할 자바로치면 "first_name" + "" + "last_name"
from employees;

select first_name ||'-'|| last_name --따옴표안에 문자를 출력할수있다
from employees;

select first_name ||' hire date is '|| hire_date as 입사일 --as생략가능
from employees;

--산술 연산자 사용하기
select first_name, 
       salary
from employees;

select first_name,
       salary,
       salary*12 -- 사칙연산 모두 가능
from employees;

select first_name,
       salary,
       salary*12,
       (salary+300)*12
from employees;

select job_id
       --job_id*12 숫자만 가능
from employees;

select first_name || '-' || last_name 성명,
       salary 급여,
       (salary*12) 연봉,
       salary*12+5000 연봉2,
       phone_number 전화번호
from employees;

--where절
select first_name,
       department_id
from employees
where department_id = 10;

--비교연산자 예제
select first_name
from employees
where salary >= 15000;

select first_name,
       hire_date
from employees
where hire_date >= '07/01/01';

select salary
from employees
where first_name = 'Lex';

select first_name,
       salary
from employees
where salary >= 14000 
and salary <= 17000;

--예제
select first_name,
       salary
from employees
where salary <= 14000 
or salary >= 17000;

select first_name,
       hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--where절 between연산자로 특정구간 값 출력하기
select first_name,
       salary
from employees
where salary between 14000 and 17000; --작은값을 앞에 큰값을 뒤에 두값을 모두 포함하는 결과를 출력

--IN 연산자로 여러 조건을 검사하기
select first_name, 
       last_name, 
       salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name, 
       last_name, 
       salary
from employees
where first_name = 'Neena' 
or first_name = 'Lex'
or first_name = 'John';

--in연산자 예제
select first_name,
       salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select first_name,
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

--Like 연산자로 비슷한것들 모두 찾기
select first_name,
       last_name,
       salary
from employees
where first_name like 'L%';

--Like연산자 예제
select first_name,
       salary
from employees
where first_name like '%am%'; --이름에 am 을 포함한

select first_name,
       salary
from employees
where first_name like '_a%'; --이름의 두번째 글자가 a 일경우 출력

select first_name
from employees
where first_name like '___a%'; --이름의 네번째 글자가 a 일경우 출력

select first_name
from employees
where first_name like '__a_'; --이름이 4글자인 사원중 끝에서 두번째 글자가 a 일경우 출력
