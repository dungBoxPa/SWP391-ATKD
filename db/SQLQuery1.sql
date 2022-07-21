--drop database SWP391_Project_New

create database SWP391_Project_Lastest
go 
use SWP391_Project_Lastest
go

create table Role (
	role_id int identity(1, 1) primary key,
	role_name nvarchar(20) not null
)

create table Account (
	account_id int identity(1,1) PRIMARY KEY,
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	gender bit not null,
	email nvarchar(max) not null,
	password nvarchar(max) not null,
	dob date not null,
	phone_number nvarchar(12) not null,
	address nvarchar(max) null,
	img nvarchar(max) null,
	role_id int foreign key references Role(role_id)
)

create table Class(
	class_id int identity(1,1) PRIMARY KEY,
	class_name nvarchar(20) not null,
	grade int not null,
	class_description text not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id)
)

create table Kindergartner(
	kinder_id int identity(1,1) PRIMARY KEY,
	parent_id int FOREIGN KEY REFERENCES Account(account_id),
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	dob date not null,
	gender bit not null,
	img nvarchar(max) null
)

create table Study_Record (
	study_record_id int identity(1, 1) primary key,
	class_id int foreign key references Class(class_id),
	kinder_id int foreign key references Kindergartner(kinder_id),
	study_year int not null
)

create table Attendance(
	student_id int FOREIGN KEY REFERENCES kindergartner(kinder_id),
	check_date date not null,
	status int not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	PRIMARY KEY(student_id, check_date)
)

create table Teacher_achivement(
	achivement_id int identity PRIMARY KEY,
	content text not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id)
)

create table Teacher_record(
	record_id int identity(1,1) PRIMARY KEY,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	description text not null
)

create table Criteria(
	criteria_id int identity(1,1) PRIMARY KEY,
	content nvarchar(max)
)

create table Record(
	record_id int identity(1,1) PRIMARY KEY,
	student_id int FOREIGN KEY REFERENCES Kindergartner(kinder_id),
	note text null,
	criteria_id int FOREIGN KEY REFERENCES Criteria(criteria_id),
	semester nvarchar(30) not null,
)

create table Activity(
	activity_id int identity(1,1) PRIMARY KEY,
	act_description text not null,
	act_name nvarchar(50)
)

create table Slot(
	slot_id int identity(1,1) PRIMARY KEY,
	start_hour float not null,
	end_hour float not null
)

create table Schedule(
	schedule_id int identity(1,1),
	class_id int FOREIGN KEY REFERENCES Class(class_id),
	activity_id int FOREIGN KEY REFERENCES Activity(activity_id),
	slot_id int foreign key references Slot(slot_id),
	schedule_date date not null
)

create table Feedback(
	feedback_id int identity(1,1) PRIMARY KEY,
	kid_id int FOREIGN KEY REFERENCES Kindergartner(kinder_id),
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	fb_content nvarchar(max) null,
	rating float null,
	fb_date date null
)
select * from Account where role_id =3
----------------------------------------------------------------------------------------
insert into Role values 
('admin'), ('parent'), ('teacher')

insert into Account values
('Admin', 'Admin', 1, 'admin@gmail.com','1234', '1980/12/07', '0387458346', 'New York', null, 1),
('Peter', 'Crouch', 1, 'peter@gmail.com','1234', '1980/12/07', '0387458346', 'New York', 'https://www.transfermarkt.com/peter-crouch/profil/spieler/4072', 2),
('Maria', 'Gonzales', 0, 'maria@gmail.com','1234', '1978/04/23', '0912345678', 'St. Saint German', 'https://cdn1.sportngin.com/attachments/photo/4194-168917380/IMG_5401.jpg', 2),
('James', 'Bonds', 1, 'james@gmail.com','1234', '1988/01/13', '08563490812', 'Brucia Dortmun', 'https://ichef.bbci.co.uk/news/640/cpsprodpb/A37B/production/_121215814_craigepa.jpg', 2),
('Cristiano', 'Ronaldo', 1, 'ronaldo@gmail.com','1234', '1990/9/12', '0387458346', 'New York', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/200px-Cristiano_Ronaldo_2018.jpg', 2),
('Lionel', 'Messi', 1, 'messi@gmail.com','1234', '1991/05/25', '0387458346', 'New York', 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg', 2),
('Jeff', 'John', 1, 'jeff@gmail.com','1234', '1889/12/12', '0387458346', 'Brokelyn', 'https://d2favcmz4lf91v.cloudfront.net/wp-content/uploads/2016/04/jeff_john.jpg', 3),
('Jonah', 'Hex', 1, 'jonah@gmail.com','1234', '1890/01/14', '0123456789', 'Russia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Josh_Brolin_Berlin_2016.jpg/250px-Josh_Brolin_Berlin_2016.jpg', 3),
('Macey', 'Albert', 0, 'macey@gmail.com', '1234', '1985/11/02', '0813601669', 'Canada', null, 3)
insert into Account values
('Clark', 'Kent', 1, 'clark@gmail.com', '1234', '1985/11/11', '0813701669', 'New York', null, 2),
('Lewis', 'Lennor', 1, 'lewis@gmail.com', '1234', '1977/10/10', '0883701669', 'New York', null, 2),
('Catherine', 'Parr', 0, 'cath@gmail.com', '1234', '1980/09/09', '0893701669', 'London', null, 2)
insert into Account values
('Asiyah', 'McGee', 0, 'asiyah@gmail.com', '1234', '1985/11/11', '0813701668', 'New Jersey', null, 2),
('Sulayman', 'Shannon', 0, 'sulayman@gmail.com', '1234', '1985/01/02', '0813703668', 'New Jersey', null, 2),
('Fearne', 'Sykes', 1, 'fearne@gmail.com', '1234', '1985/01/01', '0813711668', 'California', null, 2),
('Charlotte', 'McGregor', 0, 'charlotte@gmail.com', '1234', '1985/01/03', '0813702668', 'Brooklyn', null, 2),
('Josiah', 'Cervantes', 1, 'josiah@gmail.com', '1234', '1985/01/04', '0913701668', 'Washington DC', null, 2),
('Gethin', 'Lowery', 1, 'gethin@gmail.com', '1234', '1985/01/05', '0814701668', 'Beijing', null, 2),
('Lana', 'Richards', 0, 'lana@gmail.com', '1234', '1985/01/06', '0813701768', 'Alabama', null, 2)

insert into class values('SE1608',2,'It was great',7)
insert into class values('SE1609',3,'It was great',8)
insert into class values('SE1610',3,'It was great',9)

insert into kindergartner values(1, 'Peter', 'Senior',  '2020/04/12',1,'https://kidsactivitiesblog--o--com.follycdn.com/wp-content/uploads/2020/11/Activities-for-Kindergarten-best-things-for-Kindergartners-to-do-from-Kids-Activities-Blog-1024x1024.jpg');
insert into kindergartner values(2, 'Jimmy', 'Olsen',  '2020/01/13',1,'https://media.istockphoto.com/photos/exited-kindergartner-on-his-first-day-of-school-picture-id607493732');
insert into kindergartner values(3, 'James', 'Bonds,Jr',  '2020/05/24',1,'https://assets.babycenter.com/ims/2015/04/187185569_4x3.jpg');
insert into kindergartner values(3, 'James', 'Oliver',  '2020/02/15',1,'https://c.stocksy.com/a/Wiq400/z9/1155960.jpg');
insert into kindergartner values(4, 'Cristiano', 'Ronaldo, Jr', '2020/12/08',1,'https://www.parentmap.com/sites/default/files/styles/1180x660_scaled_cropped/public/2020-08/iStock-1204260068.jpg?itok=XtyKtZ9T');
insert into kindergartner values(5, 'Thiago', 'Messi',  '2002/04/12',1,'https://resources.finalsite.net/images/f_auto,q_auto,t_image_size_2/v1614275984/catawbaschoolsnet/wvmaws8mqbbjqs9zwfav/kindergarten-boy-hands-paint.jpg');
insert into kindergartner values
(6, 'Jon', 'Kent', '2020/06/06', 1,null),
(6, 'Connor', 'Kent', '2020/07/07',1,null),
(7, 'Jasmin', 'Lennor', '2020/05/05',0,null),
(7, 'Shane', 'Lennor', '2020/06/05',1,null),
(8, 'Landon', 'Parr', '2020/05/06',1,null),
(8, 'Bruce', 'Parr', '2020/07/03',1,null)
insert into kindergartner values
(9, 'Jonathan', 'McGee', '2020/01/01', 1,null),
(9, 'Alyx', 'McGee', '2020/01/02', 0,null),
(9, 'Sana', 'McGee', '2020/01/03', 0,null),
(10, 'Farah', 'Shannon', '2020/01/04', 1,null),
(10, 'Skye', 'Shannon', '2020/01/05', 1,null),
(10, 'Cally', 'Shannon', '2020/01/06', 0,null),
(11, 'Michele', 'Sykes', '2020/01/07', 0,null),
(11, 'Parker', 'Sykes', '2020/01/08', 1,null),
(12, 'Nour', 'McGregor', '2020/01/09', 1,null),
(12, 'Felix', 'McGregor', '2020/01/10', 1,null),
(13, 'Imaan', 'Cervantes', '2020/01/11', 0,null),
(13, 'Ada', 'Cervantes', '2020/01/12', 0,null),
(13, 'Kayden', 'Cervantes', '2020/02/01', 1,null),
(14, 'Corey', 'Lowery', '2020/02/02', 0,null),
(14, 'Tanvir', 'Lowery', '2020/02/03', 1,null),
(15, 'Ceri', 'Lowery', '2020/02/04', 0,null),
(15, 'Avi', 'Richards', '2020/02/05', 1,null),
(15, 'Diya', 'Richards', '2020/02/06', 1,null)

insert into slot(start_hour, end_hour) values
(7, 8), (8, 9), (9, 10), (10, 11), (11, 12), (12, 13), (13, 14), (14, 15), (15, 16), (16, 17);

insert into Activity values
('Have breakfast', 'Breakfast'), ('Do workout', 'Physical Education'), ('Study', 'Study'), ('Lunch', 'Lunch'),
('Drawing', 'Drawing'), ('Singing', 'Singing')

insert into Schedule values
(1, 1, 1, '2022-06-22'),
(1, 2, 2, '2022-06-22'),
(1, 3, 3, '2022-06-22'),
(1, 4, 4, '2022-06-22'),
(1, 4, 5, '2022-06-22'),
(1, 5, 6, '2022-06-22'),
(1, 6, 7, '2022-06-22'),

(1, 1, 1, '2022-06-23'),
(1, 2, 2, '2022-06-23'),
(1, 3, 3, '2022-06-23'),
(1, 4, 4, '2022-06-23'),
(1, 4, 5, '2022-06-23'),
(1, 5, 6, '2022-06-23'),
(1, 6, 7, '2022-06-23'),

(1, 1, 1, '2022-06-24'),
(1, 2, 2, '2022-06-24'),
(1, 3, 3, '2022-06-24'),
(1, 4, 4, '2022-06-24'),
(1, 4, 5, '2022-06-24'),
(1, 5, 6, '2022-06-24'),
(1, 6, 7, '2022-06-24'),

(1, 1, 1, '2022-06-25'),
(1, 2, 2, '2022-06-25'),
(1, 3, 3, '2022-06-25'),
(1, 4, 4, '2022-06-25'),
(1, 4, 5, '2022-06-25'),
(1, 5, 6, '2022-06-25'),
(1, 6, 7, '2022-06-25'),

(1, 1, 1, '2022-06-26'),
(1, 2, 2, '2022-06-26'),
(1, 3, 3, '2022-06-26'),
(1, 4, 4, '2022-06-26'),
(1, 4, 5, '2022-06-26'),
(1, 5, 6, '2022-06-26'),
(1, 6, 7, '2022-06-26'),

(2, 1, 1, '2022-06-22'),
(2, 2, 2, '2022-06-22'),
(2, 3, 3, '2022-06-22'),
(2, 4, 4, '2022-06-22'),
(2, 4, 5, '2022-06-22'),
(2, 5, 6, '2022-06-22'),
(2, 6, 7, '2022-06-22'),

(2, 1, 1, '2022-06-23'),
(2, 2, 2, '2022-06-23'),
(2, 3, 3, '2022-06-23'),
(2, 4, 4, '2022-06-23'),
(2, 4, 5, '2022-06-23'),
(2, 5, 6, '2022-06-23'),
(2, 6, 7, '2022-06-23'),

(2, 1, 1, '2022-06-24'),
(2, 2, 2, '2022-06-24'),
(2, 3, 3, '2022-06-24'),
(2, 4, 4, '2022-06-24'),
(2, 4, 5, '2022-06-24'),
(2, 5, 6, '2022-06-24'),
(2, 6, 7, '2022-06-24'),

(2, 1, 1, '2022-06-25'),
(2, 2, 2, '2022-06-25'),
(2, 3, 3, '2022-06-25'),
(2, 4, 4, '2022-06-25'),
(2, 4, 5, '2022-06-25'),
(2, 5, 6, '2022-06-25'),
(2, 6, 7, '2022-06-25'),

(2, 1, 1, '2022-06-26'),
(2, 2, 2, '2022-06-26'),
(2, 3, 3, '2022-06-26'),
(2, 4, 4, '2022-06-26'),
(2, 4, 5, '2022-06-26'),
(2, 5, 6, '2022-06-26'),
(2, 6, 7, '2022-06-26');

insert into Study_Record values (1,1,2022)
insert into Study_Record values (1,2,2022)
insert into Study_Record values (1,3,2022)
insert into Study_Record values (1,4,2022)
insert into Study_Record values (1,5,2022)
insert into Study_Record values (1,6,2022)
insert into Study_Record values (1,7,2022)
insert into Study_Record values (1,8,2022)
insert into Study_Record values (1,9,2022)
insert into Study_Record values (1,10,2022)

insert into Study_Record values (2,11,2022)
insert into Study_Record values (2,12,2022)
insert into Study_Record values (2,13,2022)
insert into Study_Record values (2,13,2022)
insert into Study_Record values (2,14,2022)
insert into Study_Record values (2,15,2022)
insert into Study_Record values (2,16,2022)
insert into Study_Record values (2,17,2022)
insert into Study_Record values (2,18,2022)
insert into Study_Record values (2,19,2022)
insert into Study_Record values (2,20,2022)

insert into Study_Record values (3,21,2022)
insert into Study_Record values (3,22,2022)
insert into Study_Record values (3,23,2022)
insert into Study_Record values (3,24,2022)
insert into Study_Record values (3,25,2022)
insert into Study_Record values (3,26,2022)
insert into Study_Record values (3,27,2022)
insert into Study_Record values (3,28,2022)
insert into Study_Record values (3,29,2022)
insert into Study_Record values (3,30,2022)

