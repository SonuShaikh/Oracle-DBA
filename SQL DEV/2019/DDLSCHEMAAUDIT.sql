--DDL EXAMPLE WITH SCHEMA AUDITING.
CREATE TABLE schema_audit
(
    ddl_date DATE,
    ddl_user VARCHAR2(30),
    object_creted VARCHAR(30),
    obj_name VARCHAR(30),
    ddl_operation VARCHAR(30)
);

-- TRIGGER
CREATE OR REPLACE TRIGGER ddl_audit_sch_tr
AFTER DDL ON DATABASE
BEGIN
    INSERT INTO schema_audit VALUES(
        sysdate,
        sys_context('USERENV','CURRENT_USER'),
        ora_dict_obj_type,
        ora_dict_obj_name,
        ora_sysevent
        );
END;
/

SELECT * FROM schema_audit;

CREATE OR REPLACE TRIGGER ddl_audit_db_tr
AFTER DDL ON DATABASE
DECLARE
    v_user  VARCHAR(30);
BEGIN
    SELECT USER INTO v_user FROM DUAL; 
    INSERT INTO database_audit VALUES
    (
     sysdate,
     v_user,--sys_context('USEREVN','CURRENT_USER'),
     ora_dict_obj_type,
     ora_dict_obj_name,
     ora_sysevent
     );
END;
/

SELECT * FROM schema_audit;
DELETE FROM schema_audit WHERE ddl_user = 'HR';
SELECT * FROM database_audit;


CREATE TABLE database_audit AS SELECT * FROM schema_audit WHERE 1 = 2;













