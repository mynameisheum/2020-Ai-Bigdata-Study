use company;
show tables;
select * from department;
select dname as dept_name, mgr_ssn as manager_ssn from department;
select dept_name, manager_ssn from department;
### 테이블 자체의 attribute는 바뀐게 아님 5번줄은 오류가 뜰거임###

select * 
from department as d;

select distinct salary from employee where dno = 5
union
select distinct salary from employee where dno = 4;

select* from employee;

select *
from employee
where minit is not null
order by fname desc, lname desc;

select* from works_on;
select ssn
from works_on, employee
where ssn = essn and pno != 2;
select* from employee;


#####################################

select fname, lname 
from employee, department
where dname = 'research' and dnumber = dno;

select fname,lname
from employee
where dno in (select dnumber
				from department
				where dname = 'research');

select fname, lname
from employee
where exists (select *
				from department
                where dname = 'research' and dno = dnumber); 
                
select * from works_on;

select ssn from employee where ssn not in (select essn
										from works_on as b
                                        where b.pno = 2);
                                        
select ssn from employee e
where not exists ( select *
					from works_on w
                    where w.pno = 2 and w.essn = e.ssn);
                    
select * from dependent;

select fname, lname, dependent_name 
from employee, dependent
where ssn = essn;

## 부양 가족이 있는사람##
select fname, lname
from employee
where ssn in (select essn
				from dependent);
                
## 상관질의로 부양가족이 없는사람##
select fname, lname from employee where not exists ( select *
													from dependent
                                                    where essn=ssn);
                                                    
select * from works_on;

select fname, lname, address from employee, department
where dname = 'research' and dno = dnumber;

select fname, lname, address
from employee join department on dno=dnumber
where dname = 'research';

select fname, lname
from employee, works_on, project
where pname = 'productX' and pnumber = pno and essn= ssn;

select fname, lname
from (employee join works_on on essn=ssn) join project on pnumber = pno
where pname = 'productX';

select dname, dlocation
from department as d1, dept_locations as d2
where d1.dnumber = d2.dnumber;

select dname, dlocation
from department as d1 join dept_locations as d2 on d1.dnumber = d2.dnumber
where d1.dname = 'research';

## 오키. 이래서 이름 같을떈 natural join을 쓰는구만##
select dname, dlocation 
from department natural join dept_locations;

select fname, lname, dependent_name, relationship
from employee, dependent
where ssn = essn;

select fname, lname, dependent_name, relationship
from employee left join dependent on ssn = essn;

select * from employee;
 
select sum(salary), max(salary), min(salary), avg(salary)
from employee;

select sum(salary), max(salary), min(salary), avg(salary)
from employee
where dno >= 3; 

## select 에도 attribute넣어줘야 구분 가능해짐##
select dno, sum(salary), max(salary), min(salary), avg(salary)
from employee
group by  dno; 

select dname, count(*), sum(salary), avg(salary)
from employee, department 
where dno= dnumber
group by  dname;
 
 ## 사원이 참여하고 있는 프로젝트의 갯수, 총 참여한 시간##
 select * from works_on;
 select essn, count(*), sum(hours)
 from works_on
 group by essn;
 
 select * from works_on;
 select essn, count(*), sum(hours)
 from works_on
 group by essn 
 having count(*) >= 3;
 
 ## 각 프로젝트 별로 참여하고 있는 시간이 몇이고 얼마나 참가했는가##
 select pno, count(*), sum(hours)
 from works_on
 group by pno;
 
 select pno, count(*), sum(hours)
 from works_on
 group by pno
 having count(*) >= 3;
 
 ## 가상의 뷰를 만들어 볼게##
 create view works_on1
 as select fname, lname, pname,hours
	from employee,project, works_on
	where ssn = essn and pnumber = pno;
    
drop view works_on1;
drop view works_on3;
select * 
from works_on1;

## 가상의 뷰를 table처럼 사용할수 있는 거지##
select * 
from works_on1 
where pname = 'productx';

## 기본적으로 view는 select의 편의를 위해 사용되는것,생성은 힘듬##
select pname, count(*), sum(hours) 
from works_on1
group by pname;


