--1 Details of 2 credit courses
SELECT * FROM COURSE WHERE credits = 2;

--2 Name has substring AN
SELECT * FROM STUDENT WHERE name LIKE '%AN%';

--3
SELECT * FROM STUDENT WHERE gender = 'F';

--SELECT * FROM DEPARTMENT D WHERE D.Dno IN (SELECT * FROM COURSE WHERE D.Dno = COURSE.Dno GROUP BY D.Dno HAVING COUNT(D.Dno) >3);
--SELECT * FROM DEPARTMENT HAVING COUNT(SELECT * FROM COURSE WHERE DEPRATMENT.Dno = COURSE.Dno) > 3;

--4
--SELECT * FROM DEPARTMENT INNER JOIN COURSE ON DEPARTMENT.Dno = COURSE.Dno GROUP BY COURSE.Dno HAVING COUNT(COURSE.Ccode) > 3;

SELECT D.Dno, Dname from department d where D.Dno in (SELECT c.Dno from COURSE C GROUP BY C.Dno Having COUNT(C.Ccode) > 3);
--5
SELECT E.Rollno, S.name, COUNT(E.Ccode) FROM ENROLLS E INNER JOIN STUDENT S ON E.Rollno = S.Rollno Where E.grade = 'S' GROUP BY E.Rollno, S.Name HAVING COUNT(E.Ccode) > 2;


--6
SELECT C.Cname  AS COURSE_WITH_MAX_FAILURE FROM COURSE C WHERE C.Dno = ( SELECT Dno FROM( SELECT Dno, COUNT(*) AS Failures FROM Enrolls WHERE GRADE = 'U' GROUP BY Dno ORDER BY Failures DESC LIMIT 1) AS MaximumFailures);

--7 
--SELECT BC.Ccode, C.Cname, COUNT(BC.Bcode) AS CommonBranches FROM Branch_Course BC INNER JOIN COURSE C ON BC.Ccode = C.Ccode GROUP BY BC.Ccode, C.Cname HAVING COUNT(BC.Bcode) > 3;

SELECT * from COURSE C WHERE C.Ccode in (SELECT B.Ccode from branch_course b GROUP BY B.Ccode HAVING COUNT(B.Ccode)>=3);
--8
CREATE VIEW STUDATA AS
    SELECT
        E.ROLLNO,
        S.NAME,
        COUNT (E.CCODE) AS CC
    FROM
        STUDENT S,
        ENROLLS E
    WHERE
        E.ROLLNO = S.ROLLNO
        AND E.GRADE <> 'U'
    GROUP BY
        E.ROLLNO, S.NAME;

<<<<<<< HEAD
SELECT * FROM STUDATA;
=======
SELECT * FROM STUDATA;
>>>>>>> c858f98 (coe updated)
