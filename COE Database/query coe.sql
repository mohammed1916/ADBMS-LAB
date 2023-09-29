SELECT
    *
FROM
    DEPARTMENT D
WHERE
    D.DNO IN (
        SELECT
            B.DNO
        FROM
            BRANCH     B
        GROUP BY
            B.DNO
        HAVING
            COUNT (B.DNO) > 3
    );

SELECT
    *
FROM
    DEPARTMENT D
WHERE
    D.DNO IN (
        SELECT
            C.DNO
        FROM
            COURSE     C
        GROUP BY
            C.DNO
        HAVING
            COUNT (C.CCODE) > 6
    );

SELECT
    *
FROM
    COURSE        C
WHERE
    C.CCODE IN (
        SELECT
            B.CCODE
        FROM
            BRANCH_COURSE B
        GROUP BY
            B.CCODE
        HAVING
            COUNT (B.BCODE) > 3
    );

SELECT
    *
FROM
    STUDENT S
WHERE
    S.ROLLNO IN (
        SELECT
            E.ROLLNO
        FROM
            ENROLLS E
        WHERE
            E.GRADE = 'S'
        GROUP BY
            E.ROLLNO
        HAVING
            COUNT (E.GRADE) > 2
    );

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
        AND E.GRADE != 'U'
    GROUP BY
        E.ROLLNO, S.NAME;