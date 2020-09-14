DESC BOOK;
DELETE FROM AUTHOR;
ALTER TABLE BOOK DROP CONSTRAINT book_ai_fk;
drop table book;

SELECT 
   constraint_name,
   constraint_type,
   delete_rule
   FROM USER_CONSTRAINTS
   WHERE table_name = 'book';
   
   
   CREATE TABLE book 
   (
     book_id NUMBER,
     book_name VARCHAR2(20),
     book_author_id  CONSTRAINT book_ai_fk REFERENCES author(author_id) 
     );
     
     select * from author;
     INSERT INTO author VALUES(2,'oracle_book');
     
     insert into book values (2,'java33',2);
     select * from book;
     delete from author where author_id = 1;