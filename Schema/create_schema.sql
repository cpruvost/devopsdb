set serverout on;
DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'QUIZFLYWAY';

    IF cnt = 1 THEN
	    start deleter_ddl.sql;
	
        dbms_output.Put_line('User QUIZFLYWAY Already Exists');   
    ELSE
		start create_ddl.sql
		
		dbms_output.Put_line('User QUIZFLYWAY OK');   
    END IF;
END;
/


