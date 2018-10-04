set serverout on;
alter session set container = MYPDB;
DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'QUIZFLYWAY';

    IF cnt = 1 THEN
	    @delete_ddl.sql;
	
        dbms_output.put_line('User QUIZFLYWAY Already Exists');   
    ELSE
		@create_ddl.sql
		
		dbms_output.put_line('User QUIZFLYWAY Is There');   
    END IF;
END;
/


