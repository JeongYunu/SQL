--계정생성
create user webdb identified by webdb;

--권한부여
grant resource, connect to webdb;

--계정 비번 변경
-- alter user TNAME identified by PASSWORD;
--계정삭제
-- drop user TNAME cascade;




--table 생성
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);  

--컬럼 추가
alter table book add( pubs varchar2(50));

--컬럼 자료형 수정
alter table book modify( title varchar2(100));
--컬럼 이름 수정
alter table book rename column title to subject;

--컬럼 삭제
alter table book drop (author);

--테이블 이름 변경
rename book to article;

--테이블 삭제
drop table article;

--테이블의 모든 로우를 제거 -->DML delete문과 비교
--truncate table article;

--author테이블 생성
create table author (
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id) --중요
);

--book테이블 생성 PK/FK 지정
create table book (
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id) REFERENCES author(author_id)
);

--DML-INSERT
    --묵시적 방법(테이블 생성시 정의한 컬럼 순서대로 입력)
insert into author
values (1, '박경리', '토지 작가');

    --명시적 방법(컬럼 지정하고 순서대로 입력, 지정되지 않은 컬럼은 null 자동입력)
insert into author( author_id, author_name )
values(2, '이문열'); --primary key(author_id) 중복값 입력하면 오류

insert into author
values (3, '기안84', '웹툰 작가');

--DML-UPDATE
    --조건을 만족하는 레코드를 변경
        --컬럼 이름, 순서 지정하지 않음.
        --테이블 생성시 정의한 순서에 따라 값 지정.
update author
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 2; --where절이 생략되면 모든 레코드에 적용(주의)

update author
set author_name = '이문열',
    author_desc = '인기작가'
where author_id = 3;

--DML-DELETE
    --조건을 만족하는 레코드를 삭제
delete from author
where author_id = 1; --where절(조건)이 없으면 모든 데이터 삭제(주의)

--SEQUENCE(시퀀스)
    --연속적인 일렬번호 생성 -> PK에 주로 사용됨
    --시퀀스 생성
create sequence seq_author_id
increment by 1
start with 1
nocache;

    --시퀀스 사용
insert into author
values(seq_author_id.nextval, '박경리', '토지작가');

insert into author
values(seq_author_id.nextval, '이문열', '작가');

--시퀀스 조회
select *
from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회
select seq_author_id.nextval 
from dual;

--시퀀스 삭제
--drop sequence seq_author_id;

/*
백업
commit;
복구
rollback;
*/

select *
from author
order by author_id asc; 






