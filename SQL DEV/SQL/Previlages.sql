CREATE USER sonu IDENTIFIED BY sonu
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;
--SYSTEM PREVILAGES

GRANT CREATE USER TO sonu WITH ADMIN OPTION;
GRANT create synonym , create view , create sequence TO sonu;
GRANT create procedure to sonu;

GRANT all ON hr.author TO sonu WITH GRANT OPTION;
REVOKE ALL ON author FROM sonu;
