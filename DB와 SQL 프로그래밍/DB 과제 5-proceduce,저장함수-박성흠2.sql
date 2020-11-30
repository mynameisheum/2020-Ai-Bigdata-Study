use company;
show tables;

### 부서 이름을 입력 파라메터로 받아서, 그 부서에 근무하는 (소속된) 사원들의 급여의 평균을 
### 전달하는 저장 프로시저를 작성하시오.
delimiter $$
create procedure esalary_avg( in dn varchar(15), out sal_avg int)
begin
	select sum(salary) into sal_avg
    from employee, department
    where dname = dn and dnumber = dno;
end $$
delimiter ;

call esalary_avg('research',@sal_avg);
select @sal_avg;



drop procedure if exists esalary_avg;



### 위 프로시저를 호출하는 호출문 및 전달받은 결과 값을 출력하는 문장을 3개 이상 작성하시오.
call esalary_avg('research',@sal_avg);
select @sal_avg;

call esalary_avg('administration',@sal_avg);
select @sal_avg;

call esalary_avg('headquarters',@sal_avg);
select @sal_avg;



### 위 프로시저를 저장 함수로 바꾸서 작성하시오.
delimiter $$
create function esalary_avg(dn varchar(15))
				returns int
begin
	declare salary_avg int;
    select sum(salary) into salary_avg
    from employee, department
    where dn= dname and dnumber = dno;
    return salary_avg;
end $$
delimiter ;

select esalary_avg('research');
    
    
    




### 위 저장 함수를 호출하는 문장을 3개 이상 작성하시오.
select esalary_avg('administration');
select esalary_avg('research');
select esalary_avg('headquarters');



### 여기까지 작성하고 실습한 문장을 스크립트 파일에 저장하여 실습 결과 과제로 제출하시