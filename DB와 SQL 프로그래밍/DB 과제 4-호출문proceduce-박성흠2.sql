

#### 아래 예제 프로그램을 작성하고 실행하기
set @a = 500; 
set @b =300; 
set @c = @a - @b;
select @a, @b, @c;

drop procedure if exists minus_proc;

delimiter $$
create procedure minus_proc ( )
begin
    declare x int;  declare y int; declare z int;
    set x = 50; set y = 35; set z = x - y; 
    select x, y, z; 
end $$
delimiter ;

call minus_proc;
call minus_proc;

select @a, @b, @c;
select x, y, z;
select @x, @y, @z;

drop procedure if exists minus_proc2;
delimiter $$
create procedure minus_proc2 (IN s int, IN t int)
begin
    declare u int;  
    set u = s - t;  
    select s, t, u; 
end $$
delimiter ;

call minus_proc2(200, 150);
call minus_proc2(5000, 2550);
call minus_proc2(30, 10);

call minus_proc;
call minus_proc;

### 아래 프로시저는 두개의 값과 연산자를 파라메타로 전달 받아서, 그 두개의 값에 대해 해당
### 연산을 실행하는 프로시저이다. 빈 줄을 채워서 프로시저를 완성하시오.

drop procedure if exists oper_proc;
delimiter $$
create procedure oper_proc (IN s int, IN op char, IN t int)
begin
      declare u int;  
      case
	when op = '+' then set u = s + t;
	when op = '-' then set u = s - t;
	when op = '*' then set u = s * t;
	when op = '/' then set u = s / t;
	else set u = -10000;
     end case;
     select s, op, t, '=', u;
end $$
delimiter ;

call oper_proc (100, '+', 50);
call oper_proc (250, '-', 120);
call oper_proc (10, '*', 5);
call oper_proc (400, '/', 80);  

### 임의의 호출문을 4개 이상 작성하여 실행하기 
call oper_proc (150, '*', 50);
call oper_proc (110, '-', 120);
call oper_proc (10, '*', 0.1);
call oper_proc (400, '/', 3);  



## 개인 연습장##
drop procedure plus;

delimiter $$
create procedure plus( in a int, in b int)
begin
	declare c int;
    set c = a+b;
	select a,b,c;
end $$
delimiter ;

call plus(10,3);

delimiter $$
create procedure sum_until(in a int, in b int)
begin
	declare c int;
	declare d int;
	declare e int;
    set c=0;
    set d=0;
	while (a>b) do
        set d=a;
        set c = c+d;
        set e = c;
        set a = a+1;
	end while;
    select e;
end$$
delimiter ;
drop procedure if exists sum_until;
call sum_until(1,3);

### 여기까지 모든 문장의 실습을 완료하면, 이 문장들을 스크립트 파일에 저장하여 실습 결과 과제로 
### 제출하세요.

### 수고하셨습니다.