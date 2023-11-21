--a
\echo "a. Details of 2 credit courses"
SELECT * FROM COURSE WHERE credits = 2;

--b
\echo "b. Name has substring ES"
SELECT * FROM STUDENT WHERE LOWER(name) LIKE '%es%';

--c
\echo "c. Male students"
SELECT * FROM STUDENT WHERE gender = 'M';

--d
\echo "d. Details of departments that offer more than 3 courses"
SELECT D.Dno, Dname from department d where D.Dno in (SELECT c.Dno from COURSE C GROUP BY C.Dno Having COUNT(C.Ccode) > 3);

--e
\echo "e. List students who got 'U' in more than 2 courses during single enrollment."
SELECT E.Rollno, S.name, COUNT(E.Ccode) FROM ENROLLS E INNER JOIN STUDENT S ON E.Rollno = S.Rollno Where E.grade = 'U' GROUP BY E.Rollno, S.Name HAVING COUNT(E.Ccode) > 2;

--f
\echo "f. Create a view that will keep track of the roll number, name and number of courses, a student has completed successfully"
CREATE OR REPLACE VIEW STUDATA AS
    SELECT
        E.ROLLNO,
        S.NAME,
        COUNT (E.CCODE) AS NumOfCourses
    FROM
        STUDENT S,
        ENROLLS E
    WHERE
        E.ROLLNO = S.ROLLNO
        AND E.GRADE <> 'U'
    GROUP BY
        E.ROLLNO, S.NAME;

SELECT * FROM STUDATA;


\echo ************ Create a Trigger That checks session ******************
CREATE OR REPLACE FUNCTION enrolls_insert_validation() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.SESS NOT IN ('APRIL 2023', 'NOV 2023') THEN
		RAISE EXCEPTION 'Enter valid a session \'APRIL 2023\', \'NOV 2023\'';
	END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_session_trigger
BEFORE INSERT ON ENROLLS
FOR EACH ROW
EXECUTE FUNCTION enrolls_insert_validation();
\echo Positive Test Insert:For Trigger That checks session ******************
INSERT INTO ENROLLS VALUES( 2023176001, 1020, 'APRIL 2023','O');
\echo Negative Test Insert:For Trigger That checks session ******************
INSERT INTO ENROLLS VALUES( 2023176001, 1020, 'DEC 2023','O');
