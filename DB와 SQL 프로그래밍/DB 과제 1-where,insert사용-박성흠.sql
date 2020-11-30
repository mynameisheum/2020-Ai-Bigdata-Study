show databases;
use company;

use company;
set sql_safe_updates = 0;
show tables;

### dept_locations 테이블에 애트리뷰트 phone을 추가하기
select * from dept_locations;
alter table dept_locations add column phone char(15);
select * from dept_locations;

### dept_locations 테이블에 있는 5개 튜플의 phone 애트리뷰트 값을 임의의 값으로 수정한 후 결과 확인하기 
update dept_locations set phone = '010-1234-5678' where dnumber = 1;
update dept_locations set phone = '010-2234-5678' where dnumber = 2;
update dept_locations set phone = '010-3234-5678' where dnumber = 3;
update dept_locations set phone = '010-4234-5678' where dnumber = 4;
update dept_locations set phone = '010-5234-5678' where dnumber = 5;
select * from dept_locations;

### project 테이블에 금액 이라는 이름의 애트리뷰트를 추가하기. 데이터 타입은 int로 할 것.
alter  table project add column count int;
select*from project;



### project 테이블에 있는 6개 튜플의 금액 애트리뷰트 값을 임의의 값으로 수정하기.
update project set count = 10000 where pnumber = 1;
update project set count = 20000 where pnumber = 2;
update project set count = 30000 where pnumber = 3;
update project set count = 40000 where pnumber = 10;
update project set count = 50000 where pnumber = 20;
update project set count = 60000 where pnumber = 30;
select * from project;

### department 테이블에 아래 2개의 튜플을 추가하기
insert into department values('영업부', 7, '333445555', '1990-01-01');
insert into department values('비서실', 8, '999887777', '2010-01-01');
select * from department;

### dept_locations 테이블에 7번 부서의 위치 3개를 추가하기. 애트리뷰트 값은 임의로 부여함.
select * from dept_locations;
insert into dept_locations values(7,'hi','010-2222-3333');
insert into dept_locations values(7,'ji','010-4444-5555');
insert into dept_locations values(7,'ki','010-6666-7777');

select * from dept_locations;


### employee 테이블에 7번 부서에 근무하는 사원 3명을 추가하기. 애트리뷰트 값은 임의로 부여함.
insert into employee values
('qqqq','z','wwww','121212121','1995-10-09','112 ffef sfa,tr','m','50000','111223333',1);
insert into employee values
('qqww','n','eeee','131312121','1995-09-09','113 ffef sfa,tr','m','50100','111223334',1);
insert into employee values
('qwqw','m','rrrr','151512121','1995-08-09','114 ffef sfa,tr','m','50200','111223335',1);

update employee set dno = 7 where fname = 'qqqq' and ssn = '121212121';
update employee set dno = 7 where fname = 'qqww' and ssn= '131312121';
update employee set dno = 7 where fname = 'qwqw' and ssn = '151512121';

show indexes from employee;
desc employee;
select * from employee;

### works_on 테이블에 튜플 5개를 추가함. 애트리뷰트 값은 참조 무결성 조건을 만족하는 임의의 값을 부여함.
select * from works_on;
desc works_on;
insert into works_on values('121212121',10,15);
insert into works_on values('131312121',10,15);
insert into works_on values('151512121',10,15);


select * from works_on;


### 30000 이상의 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, minit, lname, bdate from employee where salary >= 30000;
select * from employee;

###  5번 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, minit, lname, bdate 
from employee
where dno = 5 and salary >= 30000;

### 'Research' 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn fname, minit, lname, bdate
from department, employee
where dname='research' and dnumber=dno and salary >= 30000; 

update employee
set dno = '1'
where ssn = '888665555';

select* from employee;

### 'Research' 부서에 근무하는 사람들의 ssn과 그 사람이 참여하는 프로젝트 번호를 검색하기.
select ssn, pnumber
from employee, department, project, works_on
where dname = 'research' and dnumber = dno and ssn =  essn and pno = pnumber;

### 'Research' 부서에 근무하는 사람들의 이름과 그 사람이 참여하는 프로젝트의 이름을 검색하기.
select fname,minit,lname, pname
from employee, department, project, works_on
where dname = 'research' and dnumber = dno and ssn = essn and pno = pnumber;

### department 테이블에서 '영업부'의 부서번호, 관리자 사원번호(mgr_ssn)를 검색하기.
select * from department;
select dnumber, mgr_ssn
from department;

### '영업부'가 위치한 위치의 위치(dlocation)과 전화번호(phone)을 검색하기.
select dlocation, phone
from dept_locations;

### 사원의 이름(fname, lname)과 그 사원의 감독자(멘토)의 이름(fname, lname)을 검색하기.
select a.fname,a.lname,b.fname,b.lname
from employee as a, employee as b
where a.super_ssn = b.ssn and a.dno != b.dno;

### 사원의 소속부서와 그 사원의 감독자(멘토)의 소속부서가 서로 다른 사원의 이름과 감독자(멘토)의 이름을 검색하기
select  a.fname, a.lname, b.fname, b.lname
from employee as a, employee as b
where a.super_ssn = b.ssn;


### 위 질의에 해당하는 select문을 작성하여 실행하여 원하는 결과가 나오는 올바른 질의인지 확인함. 
### 모든 실습을 완료하면, 실습한 질의들을 스크립트 파일에 저장하여 실습 결과 과제로 제출함

### 수고하셨습니다.
