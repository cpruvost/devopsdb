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
        dbms_output.Put_line('User Flyway Already Exists');   
    ELSE
		EXECUTE IMMEDIATE 'CREATE USER quizflyway IDENTIFIED BY Alpha_2014_ CONTAINER=CURRENT';
		EXECUTE IMMEDIATE 'grant connect, resource to quizflyway';
		EXECUTE IMMEDIATE 'alter user quizflyway quota unlimited on users';
		EXECUTE IMMEDIATE 'alter user quizflyway quota unlimited on system';
		EXECUTE IMMEDIATE 'grant create view to quizflyway';
		EXECUTE IMMEDIATE 'alter user quizflyway enable editions';
		EXECUTE IMMEDIATE 'GRANT CREATE ANY EDITION, DROP ANY EDITION to quizflyway';
		EXECUTE IMMEDIATE 'CREATE EDITION V1';
		EXECUTE IMMEDIATE 'CREATE EDITION V1POINT1';
		EXECUTE IMMEDIATE 'CREATE EDITION V1POINT2';
		EXECUTE IMMEDIATE 'grant use on edition V1 to quizflyway';
		EXECUTE IMMEDIATE 'grant use on edition V1POINT1 to quizflyway';
		EXECUTE IMMEDIATE 'grant use on edition V1POINT2 to quizflyway';
		
		dbms_output.Put_line('User Flyway OK');   
    END IF;
END;
/


