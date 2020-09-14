create table stud1
( Name VARCHAR2(20),
  RollNo NUMBER,
  Div VARCHAR2(20)
  );
  INSERT INTO stud1 VALUES('Sonu',1,'A');
  alter table stud1 MODIFY( Div CHAR(1));
  INSERT INTO stud1 VALUES('Monu',2,'A');
  INSERT INTO stud1 VALUES('Sony',1,'B');
  INSERT INTO stud1 VALUES('Zamir',4,'B');
  INSERT INTO stud1 VALUES('Mayur',1,'c');
  
  
  SELECT * FROM STUD1;
  CREATE TABLE STUD2 As select name,div from stud1;
  desc stud2;
  select * from stud2;
  
  
  create table STUD3 nologging as 
  select * from stud1;
  desc stud3;
  select * from stud3;
  alter table stud1 add( PhoneNO long);
  create table stud4 as select Name, PhoneNO from stud1;
  alter table stud1 drop unused columns;

create table STUDENTS 
(
   Name VARCHAR2(20),
   RollNo NUMBER,
   IDNO NUMBER,
   CONSTRAINT STUDENTS_IOT_PK primary key (Name,RollNo)
) ORGANIZATION INDEX;
DESC STUDENTS;
INSERT INTO STUDENTS VALUES('Togu',6,111);
create or replace view vw_stud as 
select * from students;
select * from vw_stud;
 select * from students;



create or replace view vw_STudent_sorted as 
select * from students 
order by Rollno;


select * from students;
select * from vw_student_sorted;

create or replace view vw_student as 
select * from students
WITH READ ONLY;
SELECT * FROM vw_student;
update vw_student set rollno = 2 where rollno = 2;






















