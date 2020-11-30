set @a =100;
set @b = 200;
set @c = @a+ @b;
set @d = @b-@a;
select @a, @b, @c, @d;

delimiter $$
create procedure add_sum ()
begin
	declare a int;
    declare b int;
    declare c int;
    set a = 500; set b= 300; set c = a+b;
    select a,b,c;
end $$
delimiter ;

call add_sum;
call add_sum;

delimiter $$
create procedure score()
begin
	declare d int;
    set d= 86;
    
    if d>= 90 
    then select 'a입니다';
    
	elseif d >= 80
    then select 'b입니다';
    
    elseif d>= 70
    then select 'c입니다';
    
    else
	select 'f입니다';
    
    end if;
end$$
delimiter ;

call score;

delimiter $$
create procedure rep()
begin
	declare i int;
    declare hap int;
    set i= 0; set hap = 0;
    
    myloop: loop
		if i > 100 
        then leave myloop;
        end if;
        
        set hap = hap +i;
        set i = i+1;
	end loop myloop;
	select hap;
end $$
delimiter ;

## 수정하려면 지워야한다##        
drop procedure if exists rep;

## 1~100까지의 합##
call rep;


# while 문으로 1~100합##
delimiter $$
create procedure rep()
begin
	declare i int;
    declare hap int;
    set i= 0; set hap = 0;
	while (i<= 100) do
        set hap = hap +i;
        set i = i+1;
	end while;
#	end loop myloop;
	select hap;
end $$
delimiter ;

call rep;

