-- LOGON LOGOFF TRIGGER
/*
CREATE TABLE sys_event_audit
    (
        Event VARCHAR2(30),
        logon_date DATE,
        logon_time VARCHAR2(30),
        logoff_date DATE,
        logoff_time VARCHAR2(30)
    );
*/    

DESCRIBE sys_event_audit;
-- LOGON TRIGGER
CREATE OR REPLACE TRIGGER tr_system_evnt_aduit
AFTER LOGON ON SCHEMA
BEGIN
    INSERT INTO sys_event_audit VALUES(
        ora_sysevent,
        sysdate,
        TO_CHAR(SYSDATE,'24HH:MI:SS'),
        NULL,
        NULL
    );
    COMMIT;
END;
/

-- LOGOFF TRIGGER
CREATE OR REPLACE TRIGGER tr_sys_lgoff_envn_audit 
BEFORE LOGOFF ON SCHEMA
BEGIN
    INSERT INTO sys_event_audit VALUES(
        ora_sysevent,
        NULL,
        NULL,
        sysdate,
        TO_CHAR(SYSDATE,'24hh:MI:SS')
        );
END;
/
SELECT * FROM SYS_EVENT_AUDIT;

SELECT DISTINCT OWNER FROM ALL_TRIGGERS;
SELECT TRIGGER_NAME,STATUS FROM ALL_TRIGGERS WHERE OWNER = 'SYSTEM';