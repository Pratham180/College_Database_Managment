INFORMATION Query
----------------------------------------------------------------------------------
1.)
select Student.Student_Name, Address.Address_ID, Address.Contact_Number
from Student
left join Address_Student
on Student.Student_ID= Address_Student.Student_ID
left join Address
on Address.Address_ID=Address_Student.Address_ID;
------------------------------------------------------------------------
2.)
select Module.Module_ID,Module.Module_Name, Teacher.Teacher_FirstName
from Module
join Module_Teacher
on Module_Teacher.Module_ID=Module.Module_ID
join Teacher
on Module_Teacher.Teacher_ID=Teacher.Teacher_ID
where Module_Teacher.Teacher_ID in (
 SELECT Teacher_ID
    FROM Module_Teacher
    GROUP BY Teacher_ID
    HAVING COUNT(*) > 1
);
------------------------------------------------------------
3.)
select Teacher.Teacher_FirstName, Teacher.Teacher_LastName, Teacher_Position.Salary
from Teacher
left join Teacher_Position
on Teacher.Teacher_PositionID = Teacher_Position.Teacher_PositionID
where Salary>50000 and (Teacher_FirstName like '%s%' or Teacher_LastName like '%s%');
---------------------------------------------------------------------------------------------
4.)
select Module.Module_Id, Module.Module_Name, Student_Specification.Specification_Name
from Module
left join Module_Specification
on Module.Module_ID=Module_Specification.Module_ID
left join Student_Specification
on Student_Specification.Specification_ID=Module_Specification.Specification_ID
where Specification_Name='Multimedia';
--------------------------------------------------------------------------------------------------------
5.)
select Teacher.Teacher_FirstName, Teacher.Teacher_LastName, Address.Contact_Number, Teacher_Position.Teacher_Position
from Teacher_Position
join Teacher
on Teacher_Position.Teacher_PositionID=Teacher.Teacher_PositionID
join Address_Teacher
on Teacher.Teacher_ID=Address_Teacher.Teacher_ID
join Address
on Address.Address_ID=Address_Teacher.Address_ID
where Teacher_Position='Module Head';
--------------------------------------------------------------------------------------------------
6.)
select Student.Student_Name, Student_Specification.Specification_Name
from Student
left join Student_Specification
on Student.Specification_ID=Student_Specification.Specification_ID
where Specification_Name='Networking';
-------------------------------------------------------------------------------------------------
7.)
select Teacher.Teacher_FirstName, Teacher.Teacher_LastName, Teacher.Teacher_Fax, Module.Module_Name
from Teacher
left join Module_Teacher
on Teacher.Teacher_ID=Module_Teacher.Teacher_ID
left join Module
on Module.Module_ID= Module_Teacher.Module_ID
where Module_Name='Database';
------------------------------------------------------------------------------------------------
8.)
select Student_Specification.Specification_ID, Student_Specification.Specification_Name, Student_Course.Course_Name
from Student_Specification
join Student
on Student_Specification.Specification_ID=Student.Specification_ID
join Student_Course
on Student.Course_ID=Student_Course.Course_ID
where Course_Name='BIT';
----------------------------------------------------------------------------------------------
9.)
select Module.Module_ID, Module.Module_Name, Student_Class.Class_Name
from Module
join Module_Class
on Module.Module_ID=Module_Class.Module_ID
join Student_Class
on Module_Class.Class_ID=Student_Class.Class_ID
where Class_Name='CLASS3';
---------------------------------------------------------------------------------------------
10.)
Select Teacher.Teacher_FirstName, Address.Address_ID, Address.Province, Address.City, Address.Street, Address.House_Number
from Teacher
join Address_Teacher
on Teacher.Teacher_ID=Address_Teacher.Teacher_ID
join Address
on Address_Teacher.Address_ID=Address.Address_ID
where Teacher_FirstName like '%a';
---------------------------------------------------------------------------------------------------
Transaction Query********************************************************************************
-----------------------------------------------------------------------------------------------------
1.)
select Student.Student_name, Student_Course.Course_Name, Fees, Fees-((10/100)*Fees) as Discounted_Fee
from Student
join Student_Course
on Student.Course_ID=Student_Course.Course_ID
where Course_Name='Computting';
---------------------------------------------------------------------------------------------------
2.)
Select Address_ID, Province, City, House_Number, Fax, COALESCE(Contact_Number,1234567890)
as "Contact Details" from Address;
--------------------------------------------------------------------------------------------
3.)
select Student_Name, Registration_Date, ROUND((CURRENT_DATE - Registration_Date)/7) as "No. of Weeks" 
from Student;
--------------------------------------------------------------------------------------------
4.)
select Teacher.Teacher_FirstName, Teacher.Teacher_LastName, Teacher_Position.Salary
from Teacher
left join Teacher_Position
on Teacher.Teacher_PositionID=Teacher_Position.Teacher_PositionID
where  Salary IN (
    SELECT Salary
    FROM Teacher_Position
    GROUP BY Salary
    HAVING COUNT(*) > 1);
-------------------------------------------------------------------------------------------
5.)
select Student.Student_Name, Student_Course.Course_Name, Student_Marks_Obtained.Marks_Obtained
from Student
join Student_Course
on Student.Course_ID=Student_Course.Course_ID
join Student_Marks_Obtained
on Student.Student_ID=Student_Marks_Obtained.Student_ID
where Marks_Obtained=(select Max(Marks_Obtained) from Student_Marks_Obtained);
-----------------------------------------------------------------------------------------
6.)
select Teacher.Teacher_FirstName, Teacher.Teacher_LastName, Teacher_Position.Teacher_Position
from Teacher
left join Teacher_Position
on Teacher.Teacher_PositionID=Teacher_Position.Teacher_PositionID
where Teacher_Position='Course Leader';