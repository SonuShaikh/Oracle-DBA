-- ** BACKUP AND RECOVERY ** --
--**COLD BACKUP**

--STEP-1 COPY FILES
-- Data files location
SELECT FILE_NAME FROM DBA_DATA_FILES;

-- CONTROL FILES LOCATION
SELECT NAME FROM V$CONTROLFILE;

-- ARCHIVE LOG LOCATION IF ITS ENABLED
ARCHIVE LOG LIST;

--OR
SELECT DEST_NAME, STATUS FROM V$ARCHIVE_DEST; --OR

SHOW PARAMETER DB_RECOVERY_FILE_DEST;

--STEP-2 � SHUTDOWN THE DATABASE 
SHUTDOWN TRANSACTIONAL;

-- BACKUP THE DATA FILE USING OS UTILITY

--STEP-3 BRING THE DATABASE ONLINE
STARTUP;



--** HOT BACKUP **
-- 1 CHECK THE DATABASE IS IN ARCHIVE MODE
ARCHIVE LOG LIST;

-- 2 IDENTIFIED THE DATA FILE LOCATION LIKE CONTROL FILE, DATAFILE, ARCHIVE

-- DATAFILE
SELECT FILE_NAME FROM DBA_DATA_FILES;

--CONTROL FILE
SELECT NAME FROM V$CONTROLFILE;

-- FIND THE SEQUENCE NUMBER
SELECT GROUP#, SEQUENCE#, STATUS FROM V$LOG;

-- 4 PUT DATABASE IN BACKUP MODE
ALTER DATABASE BEGIN BACKUP;

-- 5 COPY DATABASE USING OS UTILITY

-- 6 BRING DATABAE OUT OF BACKUP MODE
ALTER DATABASE END BACKUP;

-- 7 ARCHVIE THE CURRENT LOG 
ALTER SYSTEM ARCHIVE LOG CURRENT;

-- 8 FIND CURRENT MAX SEQUENCE NUMBER
SELECT GROUP#, SEQUENCE#, STATUS FROM V$LOG;

-- 9 BACKUP THE CURRENT CONTROL FILE
ALTER DATABASE BACKUP CONTROLFILE  TO 'D:\ORACLE_BACKUP\HOTBACKUP\CONTROL01.BK';

-- 10 BACKUP THE CURRENT ARCHIVE LOG FILE USING OS UTILITY
ARCHIVE LOG LIST;

SHOW PARAMETER DB_RECOVERY_FILE_DEST;


-- ** RECOVER CONTROL FILE FROM MEDIA FAILURE **

-- STEP 1 - SHUTDOWN THE DATABASE
SHUTDOWN ABORT;

-- STEP 2 - COPY THE BACKUP FILE TO PRO LOCATION USING OS UTILITY AND RENAME IT TO CONTROL01.CTL

-- STEP 3 - OPEN THE DATABASE IN MOUT FOR RECOVERY
STARTUP MOUNT;

-- STEP 4 - START RECVOERY 
RECOVER DATABASE USING BACKUP CONTROLFILE UNTIL CANCEL;
  
    -- PROVIDE THE VALID REDO LOG FILE OR AUTO OPTION

--STEP 5 - AFTER REDO FILE APPLIED OPEN DATABASE AND RESET THE LOGS
ALTER DATABASE OPEN RESETLOGS;

--*** RECOVER DATA FILE FROM MEDIA FAILURE ***

-- STEP 1 SHUTDOWN THE DATABASE
SHUTDOWN ABORT;

-- STEP 2 COPY BACKUP COPY TO PROD LOATION

-- STEP 3 OPENT DATABASE IN MOUNT MODE
STARTUP MOUNT;

-- STEP 4 RECOVER DATABASE
RECOVER TABLESPACE USERS;

-- STEP 5 OPEN THE DATABASE
ALTER DATABASE OPEN;


-- ** RECOVER NON-SYSTEM FILES**


CREATE TABLE SONU_HOME ( 
HOME_NAME VARCHAR2(30), 
PRICE NUMBER
) TABLESPACE USERS;


INSERT INTO SONU_HOME VALUES ('ABAD', 1000);

SELECT * FROM SONU_HOME;

ALTER TABLESPACE USERS OFFLINE;

COMMIT;

RECOVER TABLESPACE USERS;










