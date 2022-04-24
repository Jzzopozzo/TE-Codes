create or replace function calculate(x integer,y date) returns void as $$

 declare
 Dt_I date;
 u integer;
 fine integer;
 BEGIN
 
 	execute 'select dateofissue from borrower where rollin=$1' into Dt_I using x;
 	raise notice 'ISSUE_DATE=%',Dt_I;
 	u=date_part('day',y::timestamp-Dt_I::timestamp);
 	raise notice 'Days=%',u;
 	if u>20 then 
 	fine=u*5;
 	insert into fine values(x,y,fine);
 	
 END;
$$ LANGUAGE plpgsql;
