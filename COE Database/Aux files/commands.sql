\i 'A:/Dev/plsql/ADBMS-LAB/COE\ DATABASE/Aux\ files/assessment1.sql'

\o 'A:/Dev/plsql/ADBMS-LAB/COE\ DATABASE/assessment/gen.xml' -f 'A:/Dev/plsql/ADBMS-LAB/COE\ DATABASE/assessment/gen.sql'





































--4
SELECT D.Dno, D.Dname, COUNT(C.Dno)
FROM DEPARTMENT D
INNER JOIN COURSE C 
ON D.Dno = C.Dno 
GROUP BY C.Dno, D.Dno, C.Ccode
;

--6
--SELECT C.Cname  AS COURSE_WITH_MAX_FAILURE FROM COURSE C WHERE C.Dno = ( SELECT Dno FROM( SELECT Dno, COUNT(*) AS Failures FROM Enrolls WHERE GRADE = 'U' GROUP BY Dno ORDER BY Failures DESC LIMIT 1) AS MaximumFailures);
SELECT C.Cname  AS COURSE_WITH_MAX_FAILURE FROM COURSE C WHERE C.ccode = ( SELECT ccode FROM( SELECT ccode, COUNT(*) AS Failures FROM Enrolls WHERE GRADE = 'U' GROUP BY ccode ORDER BY Failures DESC LIMIT 1));


--7
--SELECT BC.Ccode, C.Cname, COUNT(BC.Bcode) AS CommonBranches FROM Branch_Course BC INNER JOIN COURSE C ON BC.Ccode = C.Ccode GROUP BY BC.Ccode, C.Cname HAVING COUNT(BC.Bcode) > 3;

SELECT * from COURSE C WHERE C.Ccode in (SELECT B.Ccode from branch_course b GROUP BY B.Ccode HAVING COUNT(B.Ccode)>=3);