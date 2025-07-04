use companydb015;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    HireDate DATE,
    JobTitle VARCHAR(50),
    DepartmentID INT,
    ManagerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);



CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    HoursWorked DECIMAL(5, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);



CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Amount DECIMAL(12, 2),
    EffectiveDate DATE,
    PayGrade VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);



CREATE TABLE LeaveRecord (
    LeaveID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    LeaveType ENUM('Sick', 'Casual', 'Maternity'),
    Status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);




ALTER TABLE Employee
ADD Gender ENUM('Male', 'Female', 'Other') AFTER Name;


ALTER TABLE Employee
MODIFY Phone VARCHAR(20);


ALTER TABLE Department
DROP COLUMN Location;


ALTER TABLE Assignment
ADD CONSTRAINT fk_assignment_employee
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);


ALTER TABLE Salary
CHANGE Amount SalaryAmount DECIMAL(12,2);


RENAME TABLE LeaveRecord TO EmployeeLeave;


ALTER TABLE Assignment
ADD CONSTRAINT chk_hours_worked_positive
CHECK (HoursWorked >= 0);


-- Select Constraint Name:
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Project'
  AND COLUMN_NAME = 'DepartmentID'
  AND REFERENCED_TABLE_NAME = 'Department';

-- Once you know the name (e.g., fk_project_department), run:
ALTER TABLE Project
DROP FOREIGN KEY project_ibfk_1;


-- insertion queries--  

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES 
(1, 'Engineering'),
(2, 'HR'),
(3, 'Marketing'),
(4, 'Finance');



INSERT INTO Employee (EmployeeID, Name, Gender, Email, Phone, HireDate, JobTitle, DepartmentID, ManagerID)
VALUES
(101, 'Alice Sharma', 'Female', 'alice@company.com', '9876543210', '2020-05-01', 'Software Engineer', 1, NULL),
(102, 'Bob Mehta', 'Male', 'bob@company.com', '9123456789', '2019-03-15', 'Team Lead', 1, 101),
(103, 'Carol Singh', 'Female', 'carol@company.com', '9988776655', '2021-11-01', 'HR Executive', 2, NULL),
(104, 'David Kumar', 'Male', 'david@company.com', '9012345678', '2022-02-01', 'Marketing Analyst', 3, NULL),
(105, 'Eva Thomas', 'Female', 'eva@company.com', '8901234567', '2020-09-12', 'Finance Manager', 4, NULL),
(106, 'Farhan Ali', 'Male', 'farhan@company.com', '8800123456', '2023-04-10', 'Finance Executive', 4, 105);


INSERT INTO Project (ProjectID, ProjectName, StartDate, EndDate, Budget, DepartmentID)
VALUES
(1001, 'AI Research', '2023-01-10', '2024-12-31', 500000.00, 1),
(1002, 'Employee Wellness', '2023-06-01', '2024-06-30', 150000.00, 2),
(1003, 'Digital Marketing Revamp', '2024-01-01', '2024-12-31', 300000.00, 3),
(1004, 'Audit Automation', '2024-03-01', '2025-03-01', 250000.00, 4);


INSERT INTO Assignment (AssignmentID, EmployeeID, ProjectID, Role, HoursWorked)
VALUES
(1, 101, 1001, 'Developer', 150.5),
(2, 102, 1001, 'Project Lead', 200.0),
(3, 103, 1002, 'Coordinator', 100.0),
(4, 104, 1003, 'SEO Specialist', 90.0),
(5, 105, 1004, 'Audit Lead', 120.0),
(6, 106, 1004, 'Data Entry', 75.5);


INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, EffectiveDate, PayGrade)
VALUES
(1, 101, 60000.00, '2024-01-01', 'PG4'),
(2, 102, 80000.00, '2024-01-01', 'PG5'),
(3, 103, 40000.00, '2024-01-01', 'PG3'),
(4, 104, 50000.00, '2024-02-01', 'PG3'),
(5, 105, 90000.00, '2024-01-01', 'PG6'),
(6, 106, 45000.00, '2024-03-01', 'PG3');


INSERT INTO EmployeeLeave (LeaveID, EmployeeID, StartDate, EndDate, LeaveType, Status)
VALUES
(1, 101, '2024-06-01', '2024-06-05', 'Sick', 'Pending'),
(2, 103, '2024-05-20', '2024-05-25', 'Casual', 'Approved'),
(3, 104, '2024-07-10', '2024-07-12', 'Casual', 'Approved'),
(4, 105, '2024-08-01', '2024-08-15', 'Maternity', 'Pending'),
(5, 106, '2024-06-15', '2024-06-17', 'Sick', 'Approved');



-- Performing updates

UPDATE Employee
SET Email = 'alice.new@company.com', Phone = '9998887776'
WHERE EmployeeID = 101;

select * from Employee;



UPDATE Department
SET DepartmentName = 'Product Engineering'
WHERE DepartmentID = 1;

select * from Department;



UPDATE Project
SET Budget = 550000.00, EndDate = '2025-06-30'
WHERE ProjectID = 1001;

select * from Project;



UPDATE Assignment
SET Role = 'Senior Developer', HoursWorked = 180.0
WHERE AssignmentID = 1;

select * from Assignment;


UPDATE Salary
SET SalaryAmount = 65000.00, PayGrade = 'PG4+'
WHERE SalaryID = 1;

select * from SALARY;



UPDATE EmployeeLeave
SET Status = 'Approved'
WHERE LeaveID = 1;

select * from EmployeeLeave;


UPDATE Employee
SET managerid = 101
where departmentid = 1;

select EmployeeId,Name,ManagerId,departmentID from Employee;