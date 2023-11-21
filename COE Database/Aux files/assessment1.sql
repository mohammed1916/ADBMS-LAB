create table student(rollno integer,
					 name varchar(20),
					 dob date,
					 gender char(1),
					 doa date,
					 bcode integer,
					 constraint roll_pk primary key(rollno),
					 constraint checkGender check(gender in ('M', 'F', 'O')),
					 constraint checkDOA check(doa >dob)
					);
create table branch(bcode integer,
					bname varchar(20),
					dno integer,
				constraint bcode_pk primary key(bcode));
create table department(dno integer,
						dname varchar(20),
						constraint dno_pk primary key(dno));
create table course(ccode integer,cname varchar(20),credits integer,dno integer,constraint ccode_pk primary key(ccode),
					constraint dno_fk foreign key(dno) references department);
create table branch_course(bcode integer,
ccode integer,
semester integer,
constraint bcode_fk foreign key(bcode) references branch,
constraint ccode_fk foreign key(ccode) references course);
create table enrolls(rollno integer,
ccode integer,
sess varchar(10),
grade char(1),
constraint rollno_fk foreign key(rollno) references student,
constraint ccode_fk foreign key(ccode) references course,
constraint check_sess check(sess in('APRIL 2013','NOV 2013')),
constraint check_grade check(grade in ('S','A','B','C','D','E','U')));


alter table student add constraint bcode_fk foreign key(bcode) references branch;
alter table branch add constraint dno_fk foreign key(dno) references department;
select * from department;
insert into department values(1,'cs');
insert into department values(2,'electricals');
insert into department values(3,'ece block');
insert into department values(4,'mechanical');
insert into department values(5,'ist');

insert into branch values(20,'cse',1);
insert into branch values(21,'eee',2);
insert into branch values(22,'ece',3);
insert into branch values(23,'mech',4);
insert into branch values(24,'it',5);
update branch set dno=4 where bname='mech'
insert into student values(101,'rohith','2002-04-27','M','2023-01-30',24);
insert into student values(102,'ramani','2001-05-17','F','2023-01-29',21);
insert into student values(103,'ramanan','2003-02-14','M','2023-01-30',24);
insert into student values(104,'kumar','2001-04-20','M','2023-01-27',23);
insert into student values(105,'manimaran','2001-08-23','M','2023-01-30',20);

insert into course values(2023242,'adbms',4,5);
insert into course values(2023231,'heat transfer',4,4);
insert into course values(2023221,'dlp',3,3);
insert into course values(2023217,'high voltage lab',2,2);
insert into course values(2023202,'networks',3,1);
insert into course values(2023,'full stack',3,5);
insert into course values(2023,'english',3,5);
insert into course values(20231,'tamil',3,5);

select * from department;

insert into enrolls values(101,2023242,'NOV 2013','S');
insert into enrolls values(101,2023241,'NOV 2013','S');
insert into enrolls values(101,2023243,'NOV 2013','S');
insert into enrolls values(102,2023221,'NOV 2013','S');
insert into enrolls values(102,2023241,'NOV 2013','S');
insert into enrolls values(104,2023231,'NOV 2013','U');
insert into enrolls values(102,2023231,'NOV 2013','U');
insert into enrolls values(102,2023,'NOV 2013','U');
insert into enrolls values(102,20231,'NOV 2013','U');



insert into branch_course values(24,20231,1);
insert into branch_course values(23,20231,1);
insert into branch_course values(20,20231,1);
insert into branch_course values(21,20231,1);
insert into branch_course values(22,20231,1);
delete from branch_course where bcode=22 and ccode=20231;
select * from branch_course;
select * from enrolls;
1.
select * from course where credits=2;
2.
select *
FROM student
WHERE substring(name,position('an' in name),2)='an';
3.
select * from student where gender='F';
4.
select d.dno,dname from department d where d.dno in (select c.dno from course c group by c.dno having count(c.ccode)>3);
5.
select * from student s where s.rollno in(select e.rollno from enrolls e where e.grade='S' group by e.rollno having count(e.ccode)>2)
6.
select c.ccode,c.cname,c.credits,d.dno,d.dname from course c,department d  where c.dno=d.dno  and c.ccode in(select e.ccode from enrolls e,department d where e.grade='U' group by e.ccode order by count(d.dno));
7.
select * from course c where c.ccode in(select b.ccode from branch_course b group by b.ccode having count(b.ccode)>=3)
8.
create view student_data as select s.rollno,s.name,count(e.ccode) as Noofcourses from student s,enrolls e where e.rollno=s.rollno and e.grade!='U' group by s.rollno,s.name;

select * from student_data

