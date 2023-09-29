-- DEPARTMENT
CREATE TABLE DEPARTMENT (
    DNO INTEGER,
    DNAME VARCHAR (30)
);

ALTER TABLE DEPARTMENT ADD PRIMARY KEY (DNO);

-- BRANCH
CREATE TABLE BRANCH (
 -- create a column with BCODE having number starting from 101
    BCODE INTEGER,
    BNAME VARCHAR (25),
    DNO INTEGER
);

ALTER TABLE BRANCH ADD PRIMARY KEY (BCODE);

ALTER TABLE BRANCH ADD FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO);

-- COURSE
CREATE TABLE COURSE (
 -- create a column with CCODE having number starting from 1001
    CCODE INTEGER,
    CNAME VARCHAR (35),
    CREDITS INTEGER,
    DNO INTEGER
);

ALTER TABLE COURSE ADD PRIMARY KEY (CCODE);

ALTER TABLE COURSE ADD FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO);

-- BRANCH_COURSE
CREATE TABLE BRANCH_COURSE (
    BCODE INTEGER,
    CCODE INTEGER,
    SEMESTER VARCHAR (35)
);

ALTER TABLE BRANCH_COURSE ADD PRIMARY KEY (BCODE, CCODE);

ALTER TABLE BRANCH_COURSE ADD FOREIGN KEY (BCODE) REFERENCES BRANCH (BCODE);

ALTER TABLE BRANCH_COURSE ADD FOREIGN KEY (CCODE) REFERENCES COURSE (CCODE);

-- STUDENT
CREATE TABLE STUDENT (
    ROLLNO INTEGER,
    NAME VARCHAR (30),
    DOB DATE,
    GENDER CHAR(2),
    DOA DATE,
    BCODE INTEGER
);

ALTER TABLE STUDENT ADD PRIMARY KEY (ROLLNO);

ALTER TABLE STUDENT ADD FOREIGN KEY (BCODE) REFERENCES BRANCH (BCODE);

ALTER TABLE STUDENT ADD CONSTRAINT CHK CHECK (GENDER IN ('M', 'F'));

-- Because ENROLLS has contraint of regulations starting from 2013
-- ALTER TABLE STUDENT ADD CONSTRAINT CHK2 CHECK (DOA < '2016-04-31');

-- ENROLLS
CREATE TABLE ENROLLS (
    ROLLNO INTEGER,
    CCODE INTEGER,
    SESS VARCHAR (35),
    GRADE CHAR (2)
);

ALTER TABLE ENROLLS ADD PRIMARY KEY (ROLLNO, CCODE, SESS);

ALTER TABLE ENROLLS ADD FOREIGN KEY (ROLLNO) REFERENCES STUDENT (ROLLNO);

ALTER TABLE ENROLLS ADD FOREIGN KEY (CCODE) REFERENCES COURSE (CCODE);

ALTER TABLE ENROLLS ADD CONSTRAINT CHK3 CHECK (GRADE IN 'S', 'A', 'B', 'C', 'D', 'E', 'U'));

ALTER TABLE ENROLLS ADD CONSTRAINT CHK4 CHECK (SESS IN ('APRIL 2013', 'NOV 2013'));