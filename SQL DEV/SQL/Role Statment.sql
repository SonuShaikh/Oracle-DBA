-- ROLE
show user;
-- query1: create a role with not identified clause
CREATE ROLE demo1 NOT IDENTIFIED;
-- Query2: create a role with identified by clase
CREATE ROLE demo2 IDENTIFIED BY sonu;
-- Query3: create a role with identifed externally clause
CREATE ROLE demo3 IDENTIFIED EXTERNALLY;
-- Query4: create a groble role
CREATE ROLE demo4 IDENTIFIED GLOBALLY;
-- Query5: Grant a system privilage to role demo1
GRANT create table TO demo1;
--Query6:grant object privilage to the role demo1
GRANT select ON hr.author TO demo1;
--Query7:grant role to another role
GRANT demo1 TO demo2;
--Query8:grant role to user
GRANT demo1 TO sonu;
--Query9:grant role demo2(with password) to user;
GRANT demo2 TO sonu;
--Query10:How to enable role using set role statment
SET ROLE demo2 IDENTIFIED BY sonu;