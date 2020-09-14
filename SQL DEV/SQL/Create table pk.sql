CREATE TABLE STUDENT (
    Name_Name VARCHAR2(30),
    Last_Name VARCHAR2(30),
    Phone_Number NUMBER(10),
    City_Name VARCHAR2(30)
    );
    INSERT INTO STUDENT 
    values('Shahabaj','Khan',9623858600,'Aurangabad');
    
    INSERT INTO STUDENT 
    VALUES ('&NAME_NAME','&LAST_NAME',&PHONE_NUMBER,'&CITY_NAME');
    
    SELECT * FROM STUDENT;
    DELETE FROM STUDENT;
    SELECT Name_Name ||' '||Last_Name ||' Has a Phone Number '|| Phone_Number as Full_Name FROM STUDENT;
    
    SELECT DISTINCT NAME_NAME,LAST_NAME FROM STUDENT;
    
    CREATE TABLE FRIENDS (
      First_Name VARCHAR2(10),
      MIddle_Name varchar2(10),
      Last_Name varchar2(10)
      );
      INSERT INTO FRIENDS VALUES('&First_Name','&Middle_Name','&Last_Name');
      select * from FRIENDS;
      select Distinct First_Name,MIddle_name,Last_Name from FRIENDS;
      delete from FRIENDs;
      
      select upper('hello world') from dual;
      
      CREATE TABLE example (
       Name varchar2(20)
       );
       insert into example values(upper('&Name'));
       select *from example;
       insert into example values(lower('&name'));
       insert into example values(initcap('&name'));
       select concat(concat('sonu',' '),'shaikh') as full_name from dual;
       
       
       
      CREATE TABLE STUDENT(       
         rollno NUMBER ,
         name VARCHAR2(20),
         surname  VARCHAR2(20));
         
       
       
      DESC STUDENT;
      SELECT * FROM STUDENT;
      DELETE FROM STUDENT WHERE NAME_NAME = 'Shahabaj';
      INSERT INTO STUDENT VALUES('&Shahabaj','&Shaikh',&9623858600,'&Aurangabad');
      update student 
      set phone_number = 9975872833 where name_name = 'Shahabaj';
      COMMIT;


DROP TABLE STUDENT;
CREATE TABLE STUDENT(
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    roll_no NUMBER CONSTRAINT std_rollno_pk PRIMARY KEY
    );
    INSERT INTO STUDENT VALUES('SONU','SHIAKH',2);
    ALTER TABLE STUDENT DISABLE CONSTRAINT std_rollno_pk ;
    SELECT * FROM STUDENT;
    ALTER TABLE STUDENT ENABLE CONSTRAINT  std_rollno_pk;
    delete from student;
    
    DROP TABLE STUDENT;
    
    CREATE TABLE STUDENT 
    (
     first_name VARCHAR2(10),
     last_name VARCHAR2(10),
     phone_no NUMBER,
     std_id NUMBER,
     CONSTRAINT std_composite_pk PRIMARY KEY( phone_no,std_id)
     );
     INSERT INTO STUDENT VALUES('sonu','shaikh',9089,1);
     ALTER TABLE STUDENT DROP CONSTRAINT std_composite_pk;

  CREATE TAble author
  (
     author_id NUMBER(3) CONSTRAINT athr_ai_pk PRIMARY KEY,
     author_name VARCHAR2(20)
     );
create table book
( 
    book_id NUMBER(3),
    book_name VARCHAR2(20),
    book_author_id NUMBER(3) CONSTRAINT book_ai_rk REFERENCES author(author_id)
    );
    insert into author values (1,'sonu');
    insert into author values(2,'Shaikh');

    insert into book values (3,'JAVASCRIPTS',2);
    ALTER TABLE book DROP constraint book_ai_rk;
    ALTER TABLE book ADD CONSTRAINT book_ai_rk  FOREIGN KEY(book_author_id) REFERENCES author(author_id) ;
    delete from book;
    select * from author;
    select * from book;
    
      delete from author where author_id = 1;















      