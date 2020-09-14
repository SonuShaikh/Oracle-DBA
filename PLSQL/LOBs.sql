--LOB's
CREATE TABLE job_resume(
    job_id NUMBER,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    details CLOB
);
INSERT INTO job_resume VALUES (1,'SONU','shaikh','Articles are words that define a noun as specific or unspecific. Consider the following examples:

After the long day, the cup of tea tasted particularly good.
By using the article the, weve shown that it was one specific day that was long and one specific cup of tea that tasted good.
After a long day, a cup of tea tastes particularly good.
By using the article a, we’ve created a general statement, implying that any cup of tea would taste good after any long day.

Confused about articles?
Grammarly provides suggestions as you write.
GET GRAMMARLY');

SELECT * FROM job_resume;

CREATE TABLE job_resume2(
    job_id NUMBER,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    profile_picture BLOB
);
SELECT * FROM job_resume2;
CREATE DIRECTORY my_pictures  AS 'D:\';

INSERT INTO job_resume2 VALUES(1,'Sonu','shaikh',BFILENAME('my_pictures','Sonu.JPG'));


DECLARE
    scr BFILE := BFILENAME ('my_pictures','Sonu.JPG');
    dest BLOB;
BEGIN
    
    INSERT INTO job_resume2 VALUES(1,'Sonu','shaikh',EMPTY_BLOB());
        RETURNING profile_picture INTO dest;
        
        DBMS_LOG.OPEN(scr,DBMS_LOG.LOB_READONLY);
        DBMS_LOB.LoadFile(dest,src,DBMS_LOB.GETLENGTH(src));
        DMBS_LOG.CLOSE(scr);
        
        COMMIT;
END;
/



















