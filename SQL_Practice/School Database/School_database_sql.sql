CREATE DATABASE school_db;
USE school_db;

create table teachers 
(teacher_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender enum('male','female'),
email varchar(50) unique,
phone int not null,
hire_date date,
salary decimal(10,2),
specialization varchar(50)
);

insert into teachers values
(11,'ritu','singh','female','ritu@gmail.com',708765489,'2024-12-23',60000,'drawing'),
(12,'komal','rawat','female','komal321@yahoo.com',657938432,'2025-12-23',70000,'Science'),
(13,'prince','kumar','male','prince34@gmail.com',443569783,'2026-09-21',55000,'electronics'),
(14,'nidhi','kumari','female','nidhi143p@gmail.com',54673589,'2025-10-30',48000,'math'),
(15,'raju','rawat','male','rajuk@yahoo.com',456978324,'2003-12-22',78000,'IT'),
(16,'golu','sah','male','golu25544@gmail.com',65789345,'2024-09-22',56000,'IT'),
(17,'shubh','gaur','male','shubhgar@gmail.com',567890123,'2024-10-10',89000,'sst'),
(18,'shivani','nagar','female','shivinagar@yahoo.com',452341234,'2024-12-29',67000,'hindi'),
(19,'shambhu','mithila','female','shambhu@g,gmail.com',543217654,'2026-01-23',89000,'sanskrit'),
(20,'vipin','singh','male','vipinsingh@gmail.com',546677975,'2025-10-29',67000,'PT'),
(21,'aman','mali','male','mali@yahoo.com',345345576,'2025-10-21',34500,'PT'),
(22,'abhishek','yadav','male','abhiyadav@gmail.com',345671234,'2026-12-25',56000,'electronics'),
(23,'muskan','rathore','female','muski@yahoo.com',656577687,'2026-02-23',65000,'english'),
(24,'khushi','kumari','female','khushi@gmail.com',432123432,'2026-10-21',56700,'english'),
(25,'shakti','chuhan','male','shakti@yahoo.com',789078678,'2025-12-02',70000,'hindi'),
(26,'saurav','giri','male','suji@gmail.com',45345674,'2025-12-03',78900,'electronics');

select * from teachers;

create table class 
(class_id int primary key auto_increment,
class_name varchar(20) not null,
section char(1),
room_no varchar(10),
class_teacher_id int,
foreign key (class_teacher_id) references teachers(teacher_id)
);

insert into class values
(101,'electronics','A',01,13),
(102,'math','B',24,14),
(103,'science','C',12,12),
(104,'electronics','D',01,26),
(105,'hindi','F',87,25),
(106,'english','G',21,23),
(107,'english','G',21,24),
(108,'PT','V',24,20),
(109,'PT','V',24,21),
(110,'IT','M',30,15),
(111,'IT','M',30,16),
(112,'sanskrit','Y',44,19),
(113,'drawing','O',50,11),
(114,'sst','R',51,17),
(115,'electronics','A',01,26),
(116,'hindi','F',87,26);

select * from class;


create table student
(student_id int primary key,
first_name varchar(50) not null,
last_name varchar(50),
gender enum('male','female'),
dob date,
email varchar(20) unique,
phone varchar(10),
city varchar(20),
admission_year date,
class_id int,
foreign key student(class_id) references class(class_id)
);


insert into student values
(1004,'shambhavi',null,'female','2002-09-12','shambhvii@gmail.com',4323432341,'delhi','2018-12-12',102),
(1203,'mohit','sikr','male','2004-12-30','sikr@yahoo.com',546789234,'delhi','2020-12-22',101),
(1020,'roshan','singh','male','2004-11-20','singr@gmail.com',4534534523,'U.P','2022-12-21',103),
(1223,'gautam','goel','male','2003-10-19','goe@yahoo.com',4512345678,'haryana','2024-12-23',104),
(2311,'arpit',null,'male','2004-12-23','arit@gmail.com',6565767878,'U.P','2023-10-21',105),
(1211,'avinash','sah','male','2004-12-23','aviii@gmail.com',3234510023,'bihar','2022-11-09',106),
(1422,'simran','gaur','female','2010-10-03','simi@yahoo.com',4389098908,'himachal','2020-09-09',107),
(2124,'khushi','singh','female','2006-09-10','khshi@gmail.com',5678787867,'M.P','2010-12-02',108),
(2227,'neha','gupta','female','2013-11-12','gutaneha@gmail.com',2132323454,'bihar','2023-11-12',109),
(4356,'nikhil','jain','male','2010-12-31','jinn@yahoo.com',6565767897,'bihar','2024-10-11',110),
(4540,'utsav','guliya','male','2023-10-12','utavg@yahoo.com',678909876,'haryana','2022-12-23',111),
(3431,'abhishhek','kumar','male','2004-10-21','kumaabhi@gmail.com',433222442,'M.P','2019-03-23',112),
(6522,'rounak',null,'male','2003-10-12','rk@yahoo.com',456788777,'U.P','2020-05-06',113),
(7682,'mansi','goel','female','2003-12-14','mansoell@gmail.com',434567890,'rajasthan','2023-07-06',114),
(7673,'nidhi','kumari','female','2002-12-12','kuminii@yahoo.com',6543456789,'oddisha','2023-08-22',116),
(5678,'payal',null,'female','2011-11-12','paal@yahoo.com',4345555456,'M.P','2022-09-09',115);

select * from student;

create table subjects 
(sub_id int primary key,
sub_name varchar(50) not null,
teacher_id int,
foreign key subjects(teacher_id) references teachers(teacher_id)
);


insert into subjects values
(1050,'english',23),
(1051,'english',24),
(1052,'sanskrit',19),
(1053,'electronics',13 ),
(1054,'electronics',22),
(1055,'electronics',26 ),
(1056,'hindi',25),
(1057,'hindi',18),
(1058,'science',12),
(1059,'PT',20),
(1060,'PT',21),
(1061,'IT',15),
(1062,'IT',16),
(1063,'drawing',11),
(1064,'sst',17),
(1065,'math',14),
(1066,'science',12);

select* from subjects;


create table exam
(exam_id int primary key,
student_id int,
sub_id int,
exam_type enum('unit test','mid term','final'),
marks decimal(5,2),

foreign key (student_id) references student(student_id),
foreign key (sub_id) references subjects(sub_id)
);


insert into exam values
(2211,1002,1050,'unit test',50),
(2212,1003,1051,'final',150.32),
(2213,1004,1052,'mid term',49.64),
(2214,1010,1053,'mid term',64),
(2215,1011,1054,'final',455.64),
(2216,1020,1055,'mid term',75.64),
(2217,1022,1056,'unit test',67),
(2218,1023,1057,'unit test',64),
(2219,1024,1058,'final',456.4),
(2220,1026,1059,'mid term',95.64),
(2221,1027,1060,'final',455.64),
(2222,1030,1061,'mid term',56.55),
(2223,1031,1062,'mid term',56.8),
(2224,1042,1063,'final',456.4),
(2225,1043,1064,'unit test',44),
(2226,1111,1065,'unit test',94);

select * from exam;



create table attendence 
(a_id int primary key,
student_id int,
status enum('present','absent','late'),
foreign key attendence(student_id) references student(student_id)
);



insert into attendence values
(01,1002,'present'),
(02,1003,'absent'),
(03,1004,'late'),
(04,1010,'late'),
(05,1011,'late'),
(06,1020,'present'),
(07,1022,'present'),
(08,1023,'absent'),
(09,1024,'present'),
(10,1026,'late'),
(11,1027,'late'),
(12,1030,'absent'),
(13,1031,'late'),
(14,1042,'present'),
(15,1043,'present'),
(16,1111,'late');

select * from attendence;








     
     
	
       









