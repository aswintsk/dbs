use company015;

desc employee;
select * from employee;


insert into employee values
(3,"Jacob","jacob@gmail.com","9687968796","2020-03-16","Sr Manager",20,3),
(4,"James","james@gmail.com","9788079679","2020-03-14","controls manager",30,4),
(5,"Morgan","morgan@gmail.com","9867868759","2020-02-15","HRIS Analyst",40,5),
(6,"Steve","steve@gmail.com","9868796859","2020-05-1","Assistant Manager",50,6),
(7,"Benjamin","ben@gmail.com","9695697969","2020-06-29","System Architect",60,7),
(8,"Carol","carol@gmail.com","8695868596","2020-01-15","PR Director",70,8);


desc project;
select * from project;
insert into project values
(1001,"project alpha",'2023-04-01','2023-12-01',140000,10),
(1002,"project beta",'2021-01-15','2022-1-015',20000000,20),
(1003,"project ghama",'2021-04-01','2022-03-12',540000,30);

desc assignment;
insert into assignment values
(101,1,1001,"team Lead",160),
(102,2,1002,"Manager",500),
(131,3,1003,"Project Head",260);

desc salary;
insert into salary values
(1,1,300000,'2022-02-04','A'),
(2,2,400000,'2022-02-04','A+');

alter table employee add constraint sfk foreign key(managerID) references employee(employeeID);

create table salary(salaryID int(20) primary key,empId int(20),amount int(30),effectiveDate date,payGrade varchar(10),foreign key(empId) references employee(employeeID));

create table leave_t(leaveID int(29) primary key ,empId int(20) , startDate date, endDate date,leaveType varchar(40), statuss varchar(20), 
						foreign key(empId) references employee(employeeID),
						constraint chk_status check(statuss = 'pending' or statuss= 'approved' or statuss = 'rejected'));
                        
alter table leave_t modify column statuss varchar(20) not null ;

alter table employee add column gender varchar(20);

alter table employee modify column phno bigint;

alter table department drop column loc;

desc salary;
alter table salary rename column amount to salaryAmount ;

rename table leave_t to EmployeeLeave;

alter table assignment add constraint chk_hrsWrk check(hoursWorked>=0);

alter table project drop constraint project_ibfk_1;


desc employee;
select * from employee;
update employee set email = "kai123@gmail.com" ,phno = "8884569645" where employeeID =1;

desc department;
select * from department;
alter table department add column loc varchar(20);
update department set depname = 'Public Relation', loc = "South Korea" where depid = 70;

desc project ;
select * from project;
update project set budget = 300000, endDate='2023-12-12' where projectId = 1001;

select * from assignment;
update assignment set role = "Team Leader" , hoursWorked = 200 where assignmentId = 101;

select * from salary;
update salary set salaryAmount = 350000 , payGrade = 'A+' where salaryID = 1;
