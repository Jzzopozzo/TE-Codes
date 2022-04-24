create or replace function insert1(x integer,y varchar,z date,w varchar,v varchar) returns void as $$
 BEGIN
 
 	insert into borrower values(x,y,z,w,v);
 END;
$$ LANGUAGE plpgsql;
