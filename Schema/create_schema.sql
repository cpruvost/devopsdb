alter session set container = MyPDB;
set serverout on;
DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'FLYWAY';

    IF cnt = 1 THEN
        BEGIN
            dbms_output.Put_line('User Flyway Already Exists');   
        END;
    ELSE
        BEGIN
		    CREATE USER quizflyway IDENTIFIED BY quizflyway CONTAINER=CURRENT;
			grant connect, resource to quizflyway;
			alter user quizflyway quota unlimited on users;
			alter user quizflyway quota unlimited on system;
			grant create view to quizflyway;
			alter user quizflyway enable editions;
			GRANT CREATE ANY EDITION, DROP ANY EDITION to quizflyway;
			CREATE EDITION V1;
			CREATE EDITION V1POINT1;
			CREATE EDITION V1POINT2;
			grant use on edition V1 to quizflyway;
			grant use on edition V1POINT1 to quizflyway;
			grant use on edition V1POINT2 to quizflyway;
			
			dbms_output.Put_line('User Flyway OK');
        END;   
    END IF;
 
END;
/


