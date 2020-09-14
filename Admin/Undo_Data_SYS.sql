--CREATE Small UNDO TABLESPACE WITH SMALL FILE
CREATE SMALLFILE UNDO TABLESPACE undotbls02
DATAFILE
    'C:\app\tbsp_demo\undotbls_df1.dbf' SIZE 100M,
    'C:\app\tbsp_demo\undotbls_df2.dbf' SIZE 200M
AUTOEXTEND ON NEXT 500M
MAXSIZE UNLIMITED
RETENTION NOGUARANTEE;

--CREATE Big UNDO TABLESPACE WITH SMALL FILE
CREATE BIGFILE UNDO TABLESPACE undotbls03
DATAFILE
    'C:\app\tbsp_demo\undotbls_df3.dfb' SIZE 1G
AUTOEXTEND ON NEXT 500
MAXSIZE UNLIMITED
RETENTION GUARANTEE;

-- Display Undo tablespace

SELECT file_name,tablespace_name, bytes/1024/1024 File_Size, status,online_status FROM DBA_DATA_FILES WHERE tablespace_name LIKE '%UNDO%';


SELECT tablespace_name, contents, status, retention, bigfile FROM DBA_TABLESPACES;

-- Add datafile to Undo tablespace

ALTER  TABLESPACE undotbls02 
ADD DATAFILE
    'C:\app\tbsp_demo\undotbls_df5.dbf' SIZE 100 M
AUTOEXTEND ON NEXT 500M
MAXSIZE UNLIMITED
RETENTION NOGUARANTEE;

-- Switching Undo tablespace
ALTER SYSTEM SET undo_tablespace = 'undotbls02' ;
ALTER SYSTEM SET undo_tablespace = 'undotbs1';

-- TAKING DATABASE ONLINE OFFLINE

ALTER TABLESPACE undotbls03 OFFLINE;

ALTER TABLESPACE undotbls02 ONLINE;

-- RENAMING DATAFILE

ALTER DATABASE RENAME
FILE
     'C:\APP\TBSP_DEMO\UNDOTBLS_DF3.DFB'
TO
     'C:\app\tbsp_demo\undotbls_df3.dbf'
;

-- Set Undo retention in seconds

SET UNDO_RETENTION = 900;

-- Update undo retension in seconds

ALTER SYSTEM SET UNDO_RETENTION = 950;


-- UPDATATING UNDO RETENTION PROPERTY

ALTER TABLESPACE undotbls03 RETENTION GUARANTEE;

ALTER TABLESPACE undotbls03 RETENTION NOGUARANTEE;

-- Undo data dictionary table to display the online undo tablespaces

SELECT * FROM DBA_ROLLBACK_SEGS;

-- Dispay the attribute of Undo Tablespace

SHOW PARAMETERS UNDO;

-- DROP DATAFILE
-- Drop Single Datafile

ALTER TABLESPACE undotbls02 DROP DATAFILE  'C:\APP\TBSP_DEMO\UNDOTBLS_DF2.DBF' INCLUDING CONTENTS;

-- Deleting entire tablespace not os files

DROP TABLESPACE undotbls02;

-- Deleting entire tablespace including fils

DROP TABLESPACE undotbls03 INCLUDING CONTENTS AND DATAFILES;
    