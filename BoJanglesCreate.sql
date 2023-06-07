CREATE TABLE bojanglesdb_clients ( [Client_ID] INT PRIMARY KEY, [LName] NVARCHAR(7),
[Fname] NVARCHAR(8),
[Address] NVARCHAR(30), [City] NVARCHAR(13), [Zip_Code] INT,
[Phone] NVARCHAR(14)
);

CREATE TABLE janglesdb_pets ( [Pet_ID] INT PRIMARY KEY, [Name] NVARCHAR(8), [Species] NVARCHAR(3), [Breed] NVARCHAR(16), [Color] NVARCHAR(7), [Weight] INT,
[Age] INT,
[Gender] NVARCHAR(1),
[Neutered] NVARCHAR(3),
[Client_ID] INT FOREIGN KEY REFERENCES bj_clients(Client_ID)
);

CREATE TABLE bj_employeebackground ( [SSN] NVARCHAR(11) PRIMARY KEY, [Degree_Obtained] NVARCHAR(14), [Grad_Date] DATETIME,
[Years_of_Exp] INT,
[School] NVARCHAR(15),
[Cert_Date] DATETIME,
[References] NVARCHAR(12), [Emercengy_Contact_Person] NVARCHAR(14)
);

CREATE TABLE bj_employees ( [Employee_ID] INT PRIMARY KEY, [Fname] NVARCHAR(7),
[Lname] NVARCHAR(10), [SSN] NVARCHAR(11), [Status] NVARCHAR(9), [Title] NVARCHAR(7), [Start_Date] DATETIME
FOREIGN KEY (SSN) REFERENCES bj_employeebackground(SSN) );

CREATE TABLE bj_employeesalary ( [Account] INT PRIMARY KEY, [Bank_Name] NVARCHAR(8), [Employee_ID] INT,
[Sick_Days] INT,
[Days_Absent] INT,
[Salary] INT,
[Federal_Deduction] NUMERIC(3, 2), [State_Deduction] NUMERIC(3, 2), [Med_Deduction] NUMERIC(3, 2), [Dental_Deduction] NUMERIC(3, 2), [Disabilitiy_Deduction] NUMERIC(3, 2), [Life_Ins_Deduction] NUMERIC(3, 2)
FOREIGN KEY (Employee_ID) REFERENCES bj_employees(Employee_ID) );

CREATE TABLE bj_employeecontact ( [Phone] NVARCHAR(12) PRIMARY KEY, [Employee_ID] INT,
[Fname] NVARCHAR(7),
[Lname] NVARCHAR(10), [Street] NVARCHAR(17), [City] NVARCHAR(9), [Zip] INT
FOREIGN KEY (Employee_ID) REFERENCES bj_employees(Employee_ID) );
CREATE TABLE bj_appointments ( [Appointment_ID] INT PRIMARY KEY, [Walk_In] NVARCHAR(3), [Vaccination] NVARCHAR(3),
[Date] DATE );

CREATE TABLE bj_services (
[Service_Code] NVARCHAR(3) PRIMARY KEY, [Description] NVARCHAR(41),
[Fee] NUMERIC(3, 1)
);

CREATE TABLE bj_appointmentdetail ( [Appointment_Detail] NUMERIC(3, 1) PRIMARY KEY, [Appointment_ID] INT FOREIGN KEY REFERENCES
bj_appointments(Appointment_ID),
[Service_Code] NVARCHAR(3) FOREIGN KEY REFERENCES
bj_services(Service_Code) );

CREATE TABLE bj_cases (
[Case_ID] INT PRIMARY KEY,
[Pet_ID] INT FOREIGN KEY REFERENCES janglesdb_pets(Pet_ID), [Employee_ID] INT FOREIGN KEY REFERENCES bj_employees(Employee_ID), [Appointment_ID] INT FOREIGN KEY REFERENCES
bj_appointments(Appointment_ID), [StartTime] TIME,
[EndTime] TIME
);

INSERT INTO bj_clients VALUES
(1,N'Vonda',N'Kathy',N'9505 Pereza Via',N'Lexington, NE',68850,N'(858) 780-9237'), 
(2,N'Leyla',N'Cortney',N'8515 Costa Verde Blvd',N'Lexington, NE',68850,N'(858) 352-6837'),
(3,N'Watters',N'Maria',N'9645 Genesee Ave',N'Lexington, NE',68850,N'(858) 453-9199'),
(4,N'Colling',N'Solymar',N'8662 Lake Ashmere Dr',N'Lexington, NE',68850,N'(619) 461-0745'),
(5,N'Ogden',N'Gay',N'8333 Clairemont Mesa Blvd #200',N'Lexington, NE',68850,N'(442) 749-8438'),
(6,N'Jericho',N'Euan',N'8737 Lake Murray Blvd',N'Lexington, NE',68850,N'(619) 713-0942'),
(7,N'Drew',N'Charlton',N'10724 Cariuto Ct',N'Lexington, NE',68850,N'(858) 598-5938'),
(8,N'Monroe',N'Freda',N'1111 Reed Ave',N'Lexington, NE',68850,N'(858) 352-6160'),
(9,N'Osorio',N'Henrique',N'10754 Glendover Ln',N'Lexington, NE',68850,N'(858) 578-0994'),
(10,N'Tyrina',N'Maria',N'10840 Las Mayas Via',N'Lexington, NE',68850,N'(858) 672-4176');

INSERT INTO janglesdb_pets VALUES 
(1,N'Pluto',N'Dog',N'Goldendoodle',N'Brown',40,1,N'M',N'Yes',4),
(2,N'Milo',N'Cat',N'Scottish Fold',N'White',15,6,N'M',N'Yes',3), 
(3,N'Denver',N'Dog',N'Golden Retriever',N'Golden',60,9,N'F',N'No',7), 
(4,N'Levi',N'Dog',N'Poodle',N'White',14,4,N'F',N'Yes',1), 
(5,N'Finn',N'Cat',N'Siamese Cat',N'Gray',15,7,N'M',N'No',2), 
(6,N'Ace',N'Dog',N'Chihuahua',N'White',5,7,N'M',N'No',2), 
(7,N'Butters',N'Dog',N'Rotweiller',N'Black',130,10,N'F',N'Yes',9), 
(8,N'Bacon',N'Dog',N'German Shepherd',N'Black',50,12,N'F',N'Yes',4), 
(9,N'Comet',N'Cat',N'Maine Coon',N'Cream',10,14,N'F',N'Yes',4), 
(10,N'Teddy',N'Dog',N'French Bulldog',N'Tan',25,6,N'M',N'Yes',8), 
(11,N'Charlie',N'Dog',N'French Bulldog',N'Brindle',30,4,N'M',N'Yes',5), 
(12,N'Clifford',N'Dog',N'Siberian Husky',N'Black',52,11,N'M',N'Yes',6), 
(13,N'Fendi',N'Dog',N'Maltipoo',N'White',17,8,N'F',N'Yes',10), 
(14,N'Dallas',N'Cat',N'Scottish Fold',N'Black',12,9,N'M',N'Yes',10), 
(15,N'Archie',N'Dog',N'German Shepherd',N'Black',80,10,N'M',N'Yes',3);

INSERT INTO bj_employeebackground VALUES 
(N'623-87-8957',N'Accounting','2010-05-19 00:00:00',8,NULL,NULL,NULL,NULL), 
(N'349-84-8975',N'Business Admin','2015-12-20 00:00:00',5,NULL,NULL,NULL,NULL), 
(N'541-87-6523',NULL,NULL,11,N'Jonas Institute','2009-04-22 00:00:00',NULL,NULL), 
(N'748-36-8974',NULL,NULL,10,N'Collins School','2010-02-01 00:00:00',NULL,NULL),
(N'246-82-7531',NULL,NULL,9,N'Jonas Institute','2013-07-25 00:00:00',NULL,NULL), 
(N'235-45-0325',NULL,NULL,1,N'Collins School','2019-11-15 00:00:00',NULL,NULL), 
(N'698-85-5486',NULL,NULL,15,N'Collins School','2004-09-12 00:00:00',NULL,NULL),
(N'963-85-4257',NULL,NULL,4,N'Collins School','2016-03-13 00:00:00',NULL,NULL), 
(N'354-89-7895',NULL,NULL,2,N'Jonas Institute','2017-10-10 00:00:00',NULL,NULL), 
(N'365-21-5477',NULL,NULL,4,N'Jonas Institute','2014-05-06 00:00:00',NULL,NULL), 
(N'210-54-2509',NULL,NULL,NULL,NULL,NULL,N'988-962-7852',N'Maria Conaway'),
(N'587-69-5103',NULL,NULL,NULL,NULL,NULL,N'987-870-1260',N'Helen Shayahan');

INSERT INTO bj_employees VALUES 
(101,N'Daniel',N'Montgomery',N'623-87-8957',N'Full-Time',N'Office','2016-04-01 00:00:00'), 
(102,N'Dorla',N'Bice',N'349-84-8975',N'Full-Time',N'Office','2016-10-01 00:00:00'), 
(103,N'Aja',N'Vega',N'541-87-6523',N'Full-Time',N'Groomer','2017-03-01 00:00:00'), 
(104,N'Joel',N'Henly',N'748-36-8974',N'Full-Time',N'Groomer','2020-05-01 00:00:00'), 
(105,N'Vicky',N'Journey',N'246-82-7531',N'Full-Time',N'Groomer','2018-09-01 00:00:00'), 
(106,N'Deborah',N'Vassar',N'235-45-0325',N'Full-Time',N'Groomer','2020-04-01 00:00:00'), 
(107,N'Sandra',N'Mercer',N'698-85-5486',N'Full-Time',N'Groomer','2016-04-01 00:00:00'), 
(108,N'Kelly',N'Diamond',N'963-85-4257',N'Full-Time',N'Groomer','2019-05-01 00:00:00'), 
(109,N'Mario',N'Goran',N'354-89-7895',N'Full-Time',N'Groomer','2019-11-01 00:00:00'), 
(110,N'James',N'Delano',N'365-21-5477',N'Full-Time',N'Groomer','2019-06-01 00:00:00'), 
(111,N'Becky',N'Chileno',N'210-54-2509',N'Part-Time',N'Cleaner','2017-03-01 00:00:00'), 
(112,N'Estelle',N'Ligon',N'587-69-5103',N'Part-Time',N'Cleaner','2017-10-01 00:00:00');

INSERT INTO bj_employeesalary VALUES 
(8259878,N'Marcy',101,9,0,72000,0.22,0.07,0.04,0.02,0.02,0.01), 
(5879625,N'Coldwell',102,3,4,75000,0.22,0.07,0.04,0.02,0.02,0.01), 
(9686588,N'Coldwell',103,14,6,62000,0.2,0.06,0.04,0.02,0.02,0.01), 
(6955444,N'Marcy',104,6,1,59000,0.18,0.05,0.04,0.02,0.02,0.01), 
(4879036,N'Coldwell',105,4,3,57000,0.18,0.05,0.04,0.02,0.02,0.01), 
(4879658,N'Marcy',106,11,3,46000,0.16,0.03,0.04,0.02,0.02,0.01), 
(5679160,N'Coldwell',107,1,1,66000,0.2,0.06,0.04,0.02,0.02,0.01), 
(1694987,N'Coldwell',108,0,4,50000,0.18,0.05,0.04,0.02,0.02,0.01), 
(4812924,N'Marcy',109,4,1,48000,0.16,0.03,0.04,0.02,0.02,0.01), 
(8479652,N'Marcy',110,7,2,50000,0.18,0.05,0.04,0.02,0.02,0.01), 
(4687911,N'Marcy',111,2,5,24000,0.1,0.02,NULL,NULL,NULL,NULL),
(2610247,N'Coldwell',112,1,3,22000,0.1,0.02,NULL,NULL,NULL,NULL);

INSERT INTO bj_employeecontact VALUES 
(N'308-587-5230',101,N'Daniel',N'Montgomery',N'1565 Hickory Lane',N'Lexington',68850), 
(N'308-254-4820',102,N'Dorla',N'Bice',N'75 County Ct',N'Lexington',68850), 
(N'308-398-0851',103,N'Aja',N'Vega',N'344 Shiloh Dr',N'Lexington',68850), 
(N'308-510-5085',104,N'Joel',N'Henly',N'456 Magnolia Ave',N'Lexington',68850), 
(N'308-250-8777',105,N'Vicky',N'Journey',N'3465 Tennessee Dr',N'Lexington',68850), 
(N'308-984-0580',106,N'Deborah',N'Vassar',N'403 Garden Rd',N'Lexington',68850), 
(N'308-541-5847',107,N'Sandra',N'Mercer',N'94 Member Blvd',N'Lexington',68850), 
(N'308-699-8815',108,N'Kelly',N'Diamond',N'4 Privet Ln',N'Lexington',68850), 
(N'308-597-7752',109,N'Mario',N'Goran',N'509 Golden Place',N'Lexington',68850), 
(N'308-230-5079',110,N'James',N'Delano',N'86 Truman St',N'Lexington',68850), 
(N'308-210-5225',111,N'Becky',N'Chileno',N'39 Fendi Ln',N'Lexington',68850), 
(N'308-163-2805',112,N'Estelle',N'Ligon',N'12 Lyons Ave',N'Lexington',68850);

INSERT INTO bj_appointments VALUES 
(151,N'Yes',N'Yes',N'7/13/2018'), (152,N'Yes',N'Yes',N'09-12-18'), 
(153,N'Yes',N'Yes',N'9/17/2018'), (154,N'Yes',N'Yes',N'12-12-18'), 
(155,N'Yes',N'Yes',N'12/14/2018'), (156,N'Yes',N'Yes',N'01-08-19'), 
(157,N'Yes',N'Yes',N'1/22/2019'), (158,N'No',N'Yes',N'3/21/2019'), 
(159,N'Yes',N'No',N'04-16-19'), (160,N'No',N'Yes',N'06-08-19'), 
(161,N'No',N'Yes',N'6-18-19'), (162,N'Yes',N'Yes',N'08-02-19'), 
(163,N'No',N'Yes',N'10-02-19'), (164,N'Yes',N'Yes',N'11-21-19'), 
(165,N'No',N'Yes',N'2/23/2020'), (166,N'Yes',N'No',N'03-29-20'), 
(167,N'No',N'Yes',N'04-06-20'), (168,N'Yes',N'Yes',N'4/16/2020'), 
(169,N'No',N'No',N'5/17/2020'), (170,N'Yes',N'Yes',N'07-12-20'), 
(171,N'Yes',N'Yes',N'09-06-20'), 
(172,N'No',N'Yes',N'9/14/2020'), 
(173,N'Yes',N'Yes',N'11/21/2020'), 
(174,N'Yes',N'No',N'12-28-20'), 
(175,N'Yes',N'Yes',N'4/13/2021');

INSERT INTO bj_services VALUES 
(N'B1',N'Small Dog, Short Hair',20), 
(N'B2',N'Small Dog, Long Hair',25), 
(N'B3',N'Medium Dog, Short Hair',30), 
(N'B4',N'Medium Dog, Long Hair',45), 
(N'B5',N'Large Dog, Small Hair',40), 
(N'B6',N'Large Dog, Long Hair',55), 
(N'B7',N'X-Large Dog, Small Hair',50), 
(N'B8',N'X-Large Dog, Long Hair',65), 
(N'B9',N'Mega-Dog, Small Hair',60), 
(N'B10',N'Mega-Dog, Long Hair',70), 
(N'S1',N'nail trim',8),
(N'S2',N'ear cleaning',5),
(N'S3',N'skin scrape',25),
(N'S4',N'ear mite treatment',10),
(N'S5',N'flea treatment',15),
(N'S6',N'tick treatment',12.5),
(N'S7',N'teeth brushing',8.5),
(N'S8',N'nose & pad conditioning',6),
(N'S9',N'eye cleaning & drops',7.5),
(N'S10',N'hair cut',15),
(N'S11',N'chalking(5 colors available) ',4), 
(N'S12',N'stenciling (20 designs, 8 color options) ',7), 
(N'S13',N'feathering (6 options available)',5), 
(N'S14',N'Vitamins (soft shiny coat)',15), 
(N'S15',N'matted hair',30);

INSERT INTO bj_appointmentdetail VALUES 
(1.0,151.0,N'B10'),
(2.0,152.0,N'B4'),
(3.0,152.0,N'S1'),
(4.0,153.0,N'B1'), 
(5.0,153.0,N'S2'), 
(6.0,154.0,N'B10'), 
(7.0,154.0,N'S11'),
(8.0,155.0,N'B1'), 
(9.0,156.0,N'B3'), 
(10.0,157.0,N'B6'), 
(11.0,158.0,N'B2'), 
(12.0,159.0,N'B5'), 
(13.0,159.0,N'S15'), 
(14.0,160.0,N'B1'), 
(15.0,161.0,N'B4'), 
(16.0,162.0,N'B2'), 
(17.0,163.0,N'B1'), 
(18.0,163.0,N'B4'), 
(19.0,163.0,N'S9'), 
(20.0,164.0,N'B2'), 
(21.0,164.0,N'S15'), 
(22.0,164.0,N'S2'), 
(23.0,164.0,N'S3'), 
(24.0,165.0,N'B8'), 
(25.0,165.0,N'S11'), 
(26.0,165.0,N'S12'), 
(27.0,165.0,N'S4'), 
(28.0,167.0,N'B3'), 
(29.0,167.0,N'S6'), 
(30.0,168.0,N'B2'), 
(31.0,168.0,N'S13'), 
(32.0,168.0,N'S4'), 
(33.0,170.0,N'B3'), 
(34.0,170.0,N'S1'), 
(35.0,170.0,N'S4'), 
(36.0,171.0,N'B7'), 
(37.0,171.0,N'S10'), 
(38.0,171.0,N'S13'), 
(39.0,171.0,N'S14'), 
(40.0,171.0,N'S5'), 
(41.0,171.0,N'S6'), 
(42.0,172.0,N'B6'), 
(43.0,172.0,N'S12'), 
(44.0,172.0,N'S6'), 
(45.0,173.0,N'B6'), 
(46.0,173.0,N'S5'), 
(47.0,175.0,N'B5'),
(48.0,175.0,N'S11'), 
(49.0,175.0,N'S7'), 
(50.0,175.0,N'S8');

INSERT INTO bj_cases VALUES 
(1,15,105,171,N'10:32',N'20:10'), 
(2,7,104,154,N'9:35',N'15:49'), 
(3,10,106,161,N'9:30',N'16:44'), 
(4,1,111,170,N'15:25',N'16:32'), 
(5,6,105,162,N'12:31',N'15:56'), 
(6,4,109,163,N'13:41',N'17:01'), 
(7,9,104,173,N'11:44',N'18:27'), 
(8,15,106,165,N'14:11',N'20:56'), 
(9,5,106,164,N'12:02',N'16:07'), 
(10,11,112,156,N'9:04',N'10:06'), 
(11,8,107,151,N'12:10',N'12:30'), 
(12,12,109,152,N'10:35',N'20:15'), 
(13,2,108,167,N'11:40',N'11:50'), 
(14,6,105,168,N'15:03',N'18:56'), 
(15,9,110,172,N'11:30',N'18:42'), 
(16,7,108,158,N'12:53',N'19:36'), 
(17,13,107,175,N'17:44',N'18:34'), 
(18,9,103,157,N'18:48',N'19:37'), 
(19,7,111,153,N'9:45',N'12:23'), 
(20,3,103,160,N'8:12',N'17:14'), 
(21,14,106,155,N'15:32',N'19:54');