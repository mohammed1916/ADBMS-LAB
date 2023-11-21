SELECT * FROM DEPARTMENT for xml path('Department'),root('DepartmentDetails');
SELECT * FROM BRANCH for xml path('Branch'),root('BranchDetails');
SELECT * FROM COURSE for xml path('Course'),root('CourseDetails');
SELECT * FROM BRANCH_COURSE for xml path('Branch_Course'),root('Branch_CourseDetails');
SELECT * FROM STUDENT for xml path('Student'),root('StudentDetails');
SELECT * FROM ENROLLS for xml path('Enrolls'),root('EnrollsDetails');