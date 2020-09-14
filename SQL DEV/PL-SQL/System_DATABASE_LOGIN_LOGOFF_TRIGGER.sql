CREATE TABLE database_event_audit
(
  user_name VARCHAR2(20),
  operation VARCHAR2(30),
  logindate date,
  logintime VARCHAR2(30),
  logoffdate DATE,
  logofftime VARCHAR2(30)
);
ALTER TABLE datebase_event_audit RENAME TO database_event_audit;
-- DATEBASE LEVEl LOGON TRIGGER
CREATE OR REPLACE TRIGGER db_logon_tr
AFTER LOGON ON DATABASE
BEGIN
   INSERT INTO database_event_audit VALUES(
   USER,
   ora_sysevent,
   sysdate,
   TO_CHAR(sysdate,'hh24:mi:ss'),
   NULL,
   NULL
   );
   COMMIT;
END;
/

-- DATEBASE LEVEl LOGOFF 
CREATE OR REPLACE TRIGGER db_logoff_tr
BEFORE LOGOFF ON DATABASE
BEGIN
  INSERT INTO database_event_audit VALUES(
  USER,
  ora_sysevent,
  NULL,
  NULL,
  sysdate,
  TO_CHAR(sysdate,'hh24:mi:ss')
  );
  COMMIT;
END;
/
SELECT * FROM database_event_audit;
REVOKE SELECT ON database_event_audit FROM HR;
DELETE FROM database_event_audit where USER_NAME ='SYS';