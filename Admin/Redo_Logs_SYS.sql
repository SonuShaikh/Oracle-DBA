-- Redo Logs 
-- Data Dictionary Table to view Redo Logs

SELECT * FROM V$LOGFILE ORDER BY GROUP#;
SELECT * FROM V$LOG;
SELECT * FROM V$LOG_HISTORY;

-- ADD Member to Redo Logs groups

ALTER DATABASE ADD LOGFILE MEMBER 'C:\app\redo_demo\REDO01b.LOG' TO GROUP 1 ;

ALTER DATABASE ADD LOGFILE MEMBER 'C:\app\redo_demo\REDO02b.LOG' TO GROUP 2;

ALTER DATABASE ADD LOGFILE MEMBER 'C:\app\redo_demo\REDO03b.LOG' TO GROUP 3;

-- SHOW CURRENT REDO LOG FILES 

SELECT * FROM V$LOGFILE ORDER BY GROUP#;
SELECT * FROM V$LOG;

SELECT L.group#, L.bytes/1024/1024 AS file_size, L.Status, LF.Member, LF.type FROM V$LOGFILE LF, V$LOG L
WHERE LF.Group# = L.group#
ORDER BY  1 ;


--SWITCH LOGFILES  
ALTER SYSTEM SWITCH LOGFILE;

-- DROP LOGFILE MEMBER
ALTER DATABASE DROP LOGFILE MEMBER  'C:\app\redo_demo\REDO01b';

--DROP ENTIRED LOGFILE GROUP
ALTER DATABASE DROP LOGFILE GROUP 3;

--CREATE REDO LOGFILE GROUP
ALTER DATABASE ADD LOGFILE GROUP 3
(
'C:\app\redo_demo\redo03a.log',
'C:\app\redo_demo\redo03b.log',
'C:\app\redo_demo\redo03c.log'
) SIZE 10M;


-- **** ARCHIVAL CONCEPT ***

-- View the ARchive Log move
ARCHIVE LOG LIST;

--Enable Archive Mode
--First, shutdonw the database

SHUTDOWN IMMEDIATE;

-- START DATABASE IN MOUNT STATE

STARTUP MOUNT;

-- Change the databse to archive log mode

ALTER DATABASE ARCHIVELOG;

-- Bring the database back online

ALTER DATABASE OPEN;






















































