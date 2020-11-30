## 저장 프로그램과 커서의 기능을 araboza!##
use company;
show tables;
select* from works_info;
select* from employee;

drop procedure if exists getdnum;
## 숫자로 받고 숫자로 출력##
delimiter $$
create procedure getdnum (in pid int, out dn int)
begin
	select dnum into dn
    from project
    where pnumber = pid;
end $$
delimiter ;

call getdnum(1,@dd);
select @dd;
call getdnum(10,@dd);
select @dd;
call getdnum(30,@dd);
select @dd;

select * from project;

##프로젝트 번호를 받으면 프로젝트 이름string을 받는 procedure##
select* from project;
drop procedure if exists getpname;

delimiter $$
create procedure getpname (in pid int, out pn varchar(15))
begin
	select pname into pn
    from project
    where pnumber =pid;
end $$
delimiter ;

## 출력은 항상 골뱅이 붙이고##
call getpname(2,@pp);
select @pp;
call getpname(1,@pp1);
select @pp1;


## 이번엔 입력을 str으로 출력도 str로 할거얌##
select * from employee;
drop procedure if exists getename;
delimiter $$
create procedure getename(in sn char(9), out fn varchar(15), out ln varchar(15))
begin
	select fname, lname into fn, ln
    from employee
    where ssn = sn;
end $$
delimiter ;

call getename('333445555', @fn,@ln);
select @fn, @ln;

call getename(666884444, @fn,@ln);
select @fn,@ln;

##if 영어가 아니라 한글을때##
call getename(987987987,@fn,@ln);
select @fn,@ln;

drop procedure if exists getename2;
delimiter $$
create procedure getename2(in sn char(9),
						out fn varchar(15) character set 'utf8' collate 'utf8_bin',
						out ln varchar(15) character set 'utf8' collate 'utf8_bin')
begin
	select fname, lname into fn, ln
    from employee
    where ssn = sn;
end $$
delimiter ;    

call getename2('453453453',@fn,@ln);
select @fn,@ln;

##아쉽지만 나는 한글로 저장해놓은게 없어서..##
select*from employee;

call getename2('222334444',@fn,@ln);
select @fn,@ln;    
    
##이제는 저장함수를 만들어볼거야##
## 함수는 입력용 파라미터만, 그리고 return값 무조건 2번##
## 호출할때는 다른 select문으로 호출##
## 마찬 가지로 한굴로 출력하려면 character set 'utf8' collate 'utf8_bin' 써야함##

drop function if exists getenamefunc;
delimiter $$
create function getenamefunc(sn char(9))
		returns varchar(15) char set 'utf8' collate 'utf8_bin'
begin
	declare ln varchar(15) char set 'utf8' collate 'utf8_bin';
    select lname into ln
    from employee
    where ssn = sn;
    return ln;
end $$
delimiter ;

## 마찬가지로도 내가 그게 없다..한글로 된 list가..##
select getenamefunc('123456789');
select getenamefunc('987654321');
select getenamefunc('222334444');
    
## 커서의 사용##
## 튜풀의 집합으로 출력되면 변수에 저장할수 없으니까 커서를 사용##
drop procedure if exists getsalaryssn;
delimiter $$
create procedure getsalaryssn(in sn char(9), out inc_sal int)
begin
	declare sal int;
    select salary into sal
    from employee
    where ssn = sn;
    set inc_sal = 1.1*sal;
end $$
delimiter ;
    
call getsalaryssn(123456789, @incsall);
select @incsall;
call getsalaryssn(987987987, @incsall);
select @incsall;
select * from employee;
    
    
## 이번엔 한 부서에 대해 전체적으로 인상된 salary가격을 procedure해볼게##
## 이거야 말로 한개만 출력이 아니라 여러개 출력이니까 커서가 필요하겠지?##
drop procedure if exists getsalarydno;
delimiter $$
create procedure getsalarydno(in dn int, out inc_sal int)
begin
	declare sal int;
    select salary into sal
    from employee
    where dno = dn;
    set inc_sal = 1.1*sal;
end $$
delimiter ;    
    
call getsalarydno (5,@inc_salary);
 
## 위에 오류났을거야 call로 불렀을때##
## 이젠 진짜 해볼게##
## 한 부서number을 입력하면##
## 월급은 여러사람이지만 합계로 넘길땐 한자리만 필요하니까##
## 반복여부를 표시해주는 불리언 변수를 하나 생성, true가 되면 끝나는거지##
## 커서가 마지막 까지 가고나서 반복할게 없을때##
## total_sal은 계속 더해줘야 하니까 변수 하나 만들어주고##
##cnt는 가지고 올때마다 1씩 증가하면 사원의 수를 설명할수 잇겟지##
## fetch로 커서 하나씩 가져오는거지##
## endofrow까지오면 반복문 중지##
## 만약 loop를 안빠져나갓다는것은성공적으로 저장했다는거지 하나씩##
drop procedure if exists getsalarydnocur;
delimiter $$
create procedure getsalarydnocur(in dn int, out total_sal int, out cnt int)
begin
	declare sal int;
	declare endofrow boolean default false;
    declare cur1 cursor for
		select salary from employee where dno = dn;
    declare continue handler for not found set endofrow = true;
    
    set total_sal = 0;
    set cnt = 0;
    
    open cur1;
    
    cursor_loop: loop
		fetch cur1 into sal;
        
        if endofrow 
			then leave cursor_loop;
        end if;
        
        set total_sal =  total_sal +sal;
        set cnt = cnt +1;
        
	end loop cursor_loop;       
    
    close cur1;
end $$
delimiter ; 
    
call getsalarydnocur(5,@total_salary,@cnt);
select @total_salary, @cnt;

select * from employee
order by dno asc;
    
    
    
    
    




