-- DEPARTMENT
INSERT INTO DEPARTMENT VALUES(1,'COMPUTER SCIENCE');
INSERT INTO DEPARTMENT VALUES(2,'MATHEMATICS');
INSERT INTO DEPARTMENT VALUES(3,'PHYSICS');
INSERT INTO DEPARTMENT VALUES(4,'CHEMISTRY');
INSERT INTO DEPARTMENT VALUES(5,'INFORMATION TECHNOLOGY');
INSERT INTO DEPARTMENT VALUES(6,'CIVIL');
INSERT INTO DEPARTMENT VALUES(7,'PRINTING AND PACKAGING');
INSERT INTO DEPARTMENT VALUES(8,'MECHATRONICS');
INSERT INTO DEPARTMENT VALUES(9,'ECE');
INSERT INTO DEPARTMENT VALUES(10,'EEE');


-- COURSE
INSERT INTO COURSE VALUES(1001, 'WEB PROGRAMMING', 2,1);
INSERT INTO COURSE VALUES(1002, 'COMPUTER GRAPHICS', 3,1);
INSERT INTO COURSE VALUES(1003, 'COMPUTER NETWORKS', 4,1);
INSERT INTO COURSE VALUES(1004, 'LINEAR ALGEBRA', 2,2);
INSERT INTO COURSE VALUES(1005, 'DISCRETE MATH', 3,2);
INSERT INTO COURSE VALUES(1006, 'STATISTICS', 2,2);
INSERT INTO COURSE VALUES(1007, 'THEORY OF RELATIVITY', 2,3);
INSERT INTO COURSE VALUES(1009, 'NUCLEAR PHYSICS', 3,3);
INSERT INTO COURSE VALUES(1020, 'LINEAR ALGEBRA', 2,3);

INSERT INTO COURSE VALUES(1010, 'INORGANIC CHEMISTRY', 4,4);
INSERT INTO COURSE VALUES(1011, 'ORGANIC CHEMISTRY', 3,4);
INSERT INTO COURSE VALUES(1012, 'THERMODYNAMICS', 2,4);
INSERT INTO COURSE VALUES(1021, 'LINEAR ALGEBRA', 2,4);

INSERT INTO COURSE VALUES(1016, 'STRUCTURAL ENGINEERING', 4,6);
INSERT INTO COURSE VALUES(1017, 'FLUID MECHANICS', 2,6);
INSERT INTO COURSE VALUES(1018, 'SOIL MECHANICS', 2,6);
INSERT INTO COURSE VALUES(1019, 'HIGHWAYS', 2,6);

INSERT INTO COURSE VALUES(1013, 'ARTIFICIAL INTELLIGENCE', 4,5);
INSERT INTO COURSE VALUES(1014, 'ADBMS', 2,5);
INSERT INTO COURSE VALUES(1015, 'ADS', 2,5);
INSERT INTO COURSE VALUES(1022, 'LINEAR ALGEBRA', 2,7);
INSERT INTO COURSE VALUES(1008, 'SEMICONDUCTOR DEVICES', 2,9);

-- BRANCH
INSERT INTO BRANCH VALUES(101,'COMPUTER SCIENCE', 1);
INSERT INTO BRANCH VALUES(102,'MATHEMATICS', 2);
INSERT INTO BRANCH VALUES(103,'PHYSICS', 3);
INSERT INTO BRANCH VALUES(104,'CHEMISTRY', 4);
INSERT INTO BRANCH VALUES(105,'INFORMATION TECHNOLOGY', 5);
INSERT INTO BRANCH VALUES(106,'CIVIL', 6);
INSERT INTO BRANCH VALUES(107,'IT AI', 5);
INSERT INTO BRANCH VALUES(108,'IT BIG DATA', 5);
INSERT INTO BRANCH VALUES(109,'IT DS', 5);
INSERT INTO BRANCH VALUES(110,'SOIL AND SURVEY', 6);


-- BRANCH_COURSE
INSERT INTO BRANCH_COURSE VALUES(101,1001,'APRIL 2023' );
INSERT INTO BRANCH_COURSE VALUES(101,1002,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(102,1002,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(103,1002,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(102,1004,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(101,1003,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(102,1005,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(102,1006,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(103,1007,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(103,1008,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(103,1009,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(104,1010,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(104,1011,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(104,1012,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(105,1001,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(105,1002,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(105,1003,'NOV 2023');
INSERT INTO BRANCH_COURSE VALUES(106,1013,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(106,1014,'APRIL 2023');
INSERT INTO BRANCH_COURSE VALUES(106,1015,'NOV 2023');

-- STUDENT
INSERT INTO STUDENT VALUES( 2023176001, 'Mohammed Abdullah', '2000-04-03' ,'M' , '2023-04-24', 101);
INSERT INTO STUDENT VALUES( 2023176003, 'Sai Kiran',         '2000-01-13' ,'M' , '2023-04-02', 101);
INSERT INTO STUDENT VALUES( 2023176002, 'Johnson',		     '2000-08-21' ,'M' , '2023-04-02', 101);
INSERT INTO STUDENT VALUES( 2023176004, 'ANDREW',            '2000-04-03' ,'M' , '2023-04-24', 101);
INSERT INTO STUDENT VALUES( 2023176005, 'Sai Krishna',       '2000-04-03' ,'M' , '2023-04-24', 101);
INSERT INTO STUDENT VALUES( 2023176006, 'Esha',			 	 '2000-06-05' ,'M' , '2023-04-24',106);
INSERT INTO STUDENT VALUES( 2023176007, 'Tahir Ahmed',       '2000-06-12' ,'M' , '2023-04-24', 102);
INSERT INTO STUDENT VALUES( 2023176008, 'Hassn Khalid',      '2000-09-03' ,'M' , '2023-04-24', 102);
INSERT INTO STUDENT VALUES( 2023176009, 'Rajesh Kumar',      '2000-06-13' ,'M' , '2023-04-24', 102);
INSERT INTO STUDENT VALUES( 2023176010, 'Sri Krishna',       '2000-04-03' ,'M' , '2023-04-24', 102);
INSERT INTO STUDENT VALUES( 2023176011, 'Rohit',             '2000-05-14' ,'M' , '2023-04-24', 103);
INSERT INTO STUDENT VALUES( 2023176012, 'Eshan',			 '2000-06-05' ,'M' , '2023-04-24',106);
INSERT INTO STUDENT VALUES( 2023176013, 'Rajesh',            '2000-01-29' ,'M' , '2023-04-24', 103);
INSERT INTO STUDENT VALUES( 2023176014, 'Rakesh',            '2000-07-16' ,'M' , '2023-04-24', 103);
INSERT INTO STUDENT VALUES( 2023176015, 'Muthu Annamalai',   '2000-06-05' ,'M' , '2023-04-24', 103);
INSERT INTO STUDENT VALUES( 2023176016, 'Emma Johnson',      '2000-04-03' ,'F' , '2023-04-24', 104);
INSERT INTO STUDENT VALUES( 2023176017, 'ANNAMALAI',         '2000-04-03' ,'M' , '2023-04-24', 104);
INSERT INTO STUDENT VALUES( 2023176018, 'Olivia Brown',      '2000-04-03' ,'M' , '2023-04-24', 104);
INSERT INTO STUDENT VALUES( 2023176019, 'Liam Davis',        '2000-05-11' ,'M' , '2023-04-20', 105);
INSERT INTO STUDENT VALUES( 2023176020, 'Sophia Wilson',     '2000-06-12' ,'F' , '2023-04-24', 105);
INSERT INTO STUDENT VALUES( 2023176021, 'Noah Anderson',     '2000-09-03' ,'M' , '2023-04-24', 105);
INSERT INTO STUDENT VALUES( 2023176022, 'Mia Martinez',      '2000-06-13' ,'F' , '2023-04-24', 105);
INSERT INTO STUDENT VALUES( 2023176023, 'Ethan Taylor',      '2000-04-03' ,'M' , '2023-04-24', 105);
INSERT INTO STUDENT VALUES( 2023176024, 'Aiden Harris',      '2000-05-14' ,'M' , '2023-04-24', 106);
INSERT INTO STUDENT VALUES( 2023176025, 'William Brown',     '2000-03-10' ,'M' , '2023-04-24', 106);
INSERT INTO STUDENT VALUES( 2023176026, 'James Anderson',    '2000-01-29' ,'M' , '2023-04-24', 106);
INSERT INTO STUDENT VALUES( 2023176027, 'Ava Martinez',      '2000-07-16' ,'F' , '2023-04-24', 106);
INSERT INTO STUDENT VALUES( 2023176028, 'Daniel Clark',      '2000-06-05' ,'M' , '2023-04-24',106);
INSERT INTO STUDENT VALUES( 2023176029, 'Rahul',             '2000-03-15' ,'M' , '2023-04-24', 103);
INSERT INTO STUDENT VALUES( 2023176030, 'Vijay Kumar',       '2000-05-23' ,'M' , '2023-04-20', 102);

-- ENROLLS
INSERT INTO ENROLLS VALUES( 2023176001, 1001, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176001, 1002, 'NOV 2023','A');
INSERT INTO ENROLLS VALUES( 2023176001, 1003, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176002, 1001, 'APRIL 2023','U');
INSERT INTO ENROLLS VALUES( 2023176002, 1002, 'NOV 2023','U');
INSERT INTO ENROLLS VALUES( 2023176002, 1003, 'APRIL 2023','U');
INSERT INTO ENROLLS VALUES( 2023176003, 1001, 'APRIL 2023','A');
INSERT INTO ENROLLS VALUES( 2023176003, 1002, 'NOV 2023','U');
INSERT INTO ENROLLS VALUES( 2023176003, 1003, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176004, 1001, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176004, 1002, 'NOV 2023','U');
INSERT INTO ENROLLS VALUES( 2023176004, 1003, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176005, 1001, 'APRIL 2023','A');
INSERT INTO ENROLLS VALUES( 2023176005, 1002, 'NOV 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176005, 1003, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176006, 1004, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176006, 1005, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176006, 1006, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176007, 1004, 'APRIL 2023','O');
INSERT INTO ENROLLS VALUES( 2023176007, 1005, 'NOV 2023','B');
INSERT INTO ENROLLS VALUES( 2023176007, 1006, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176008, 1004, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176008, 1005, 'NOV 2023','O');
INSERT INTO ENROLLS VALUES( 2023176008, 1006, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176009, 1004, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176009, 1005, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176009, 1006, 'APRIL 2023','A');
INSERT INTO ENROLLS VALUES( 2023176010, 1004, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176010, 1005, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176010, 1006, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176011, 1007, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176011, 1008, 'NOV 2023','B');
INSERT INTO ENROLLS VALUES( 2023176011, 1009, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176012, 1007, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176012, 1008, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176012, 1009, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176013, 1007, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176013, 1008, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176013, 1009, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176014, 1007, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176014, 1008, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176014, 1009, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176015, 1007, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176015, 1008, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176015, 1009, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176016, 1010, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176016, 1011, 'NOV 2023','A');
INSERT INTO ENROLLS VALUES( 2023176016, 1012, 'APRIL 2023','O');
INSERT INTO ENROLLS VALUES( 2023176017, 1010, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176017, 1011, 'NOV 2023','O');
INSERT INTO ENROLLS VALUES( 2023176017, 1012, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176018, 1010, 'APRIL 2023','A');
INSERT INTO ENROLLS VALUES( 2023176018, 1011, 'NOV 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176018, 1012, 'APRIL 2023','U');
INSERT INTO ENROLLS VALUES( 2023176019, 1001, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176019, 1002, 'NOV 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176019, 1003, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176020, 1001, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176020, 1002, 'NOV 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176020, 1003, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176021, 1001, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176021, 1002, 'NOV 2023','U');
INSERT INTO ENROLLS VALUES( 2023176021, 1003, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176022, 1001, 'APRIL 2023','U');
INSERT INTO ENROLLS VALUES( 2023176022, 1002, 'NOV 2023','B');
INSERT INTO ENROLLS VALUES( 2023176022, 1003, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176023, 1001, 'APRIL 2023','A+');
INSERT INTO ENROLLS VALUES( 2023176023, 1002, 'NOV 2023','B');
INSERT INTO ENROLLS VALUES( 2023176023, 1003, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176024, 1013, 'APRIL 2023','A');
INSERT INTO ENROLLS VALUES( 2023176024, 1014, 'APRIL 2023','U');
INSERT INTO ENROLLS VALUES( 2023176024, 1015, 'NOV 2023','U');
INSERT INTO ENROLLS VALUES( 2023176025, 1013, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176025, 1014, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176025, 1015, 'NOV 2023','B');
INSERT INTO ENROLLS VALUES( 2023176026, 1013, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176026, 1014, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176026, 1015, 'NOV 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176027, 1013, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176027, 1014, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176027, 1015, 'NOV 2023','A');
INSERT INTO ENROLLS VALUES( 2023176028, 1013, 'APRIL 2023','B');
INSERT INTO ENROLLS VALUES( 2023176028, 1014, 'APRIL 2023','B+');
INSERT INTO ENROLLS VALUES( 2023176028, 1015, 'NOV 2023','U');
