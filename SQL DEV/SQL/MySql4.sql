create table Name (name varchar2(20));
create unique index name_index 
on  Name ( upper(name)) TABLESPACE USERS;
INSERT INTO name values('Sonu');
select * from name;
alter index name_index  rebuild
on Name (upper(name));


create user user_sonu identified by sonu;
connect user_sonu/sonu;
drop user cascade;
connect system/shaikh
