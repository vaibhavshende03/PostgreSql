--Ex 1
CREATE TABLE Science_class(Enrollment_no int, Name varchar,Science_mark int);
--Ex 2
--insert data
INSERT into science_class VALUES (1,'Popeye',33),
(2,'Olive',54),
(3,'Brutus',98);
--copy data
copy science_class from 'D:\2023\DBMS\PostgreSql\SQL Masterclass_ SQL for Data Analytics\Data\Student.csv' DELIMITER ',' CSV HEADER;
--Ex 3
SELECT * from science_class;
select name from science_class where science_mark>60;
select * FROM science_class where science_mark>35 and science_mark<60;
select * from science_class where science_mark<=35 or science_mark>60;
select * from science_class where science_mark not between 35 and 60;
--Ex4
update science_class set science_mark=45 WHERE name='Popeye';
DELETE from science_class where name='Robb';
alter table science_class rename name to student_name;
--Ex 5
drop table science_class