-- BoJangles services orderd by Fee
SELECT *
FROM bj_services
ORDER BY Fee DESC

-- Names of groomers and their clients, including the number of times each client was groomed
SELECT CONCAT(bj_employees.FName, ' ', bj_employees.LName) AS 'Employee',
janglesdb_pets.Name AS 'Pet', 
COUNT(bj_appointmentDetail.Service_Code) AS 'Times groomed' 
FROM bj_employees
JOIN bj_cases ON bj_employees.Employee_ID = bj_cases.Employee_ID
JOIN janglesdb_pets ON bj_cases.Pet_ID = janglesdb_pets.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
       JOIN bj_appointmentDetail ON bj_appointments.Appointment_ID
       = bj_appointmentDetail.Appointment_ID
WHERE bj_appointmentDetail.Service_Code LIKE 'B%'
GROUP BY janglesdb_pets.Name, CONCAT(bj_employees.FName, ' ', bj_employees.LName)

-- Names of clients not seen in the last year including the date they were last seen
SELECT janglesdb_pets.Name, MAX(bj_appointments.Date) AS 'Date Last Seen'
FROM janglesdb_pets
JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
       JOIN bj_appointments ON bj_cases.Appointment_ID =
bj_appointments.Appointment_ID
GROUP BY janglesdb_pets.Name
HAVING MAX(bj_appointments.Date) < CURRENT_TIMESTAMP - 365;

-- Number of services performed on animals by species
SELECT janglesdb_pets.Species, COUNT(bj_appointmentdetail.Service_Code) as 'Total Services' 
FROM janglesdb_pets
JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
JOIN bj_appointmentdetail ON bj_appointments.Appointment_ID
       = bj_appointmentdetail.Appointment_ID
GROUP BY janglesdb_pets.Species
ORDER BY 'Total Services' DESC;

-- Finding which clients have had the same walk-in service performed more than once
SELECT janglesdb_pets.Name, COUNT(bj_appointments.Appointment_ID) as 'Times Walked In'
FROM janglesdb_pets
   JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
GROUP BY janglesdb_pets.Name
HAVING COUNT(bj_appointments.Appointment_ID) > 1
Order by Count(bj_appointments.Appointment_ID) DESC;

-- Owners and clients listed by number of grooming visits in descending order
SELECT janglesdb_pets.Name, COUNT(bj_appointments.Appointment_ID) as 'Times Walked In'
FROM janglesdb_pets
   JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
GROUP BY janglesdb_pets.Name
HAVING COUNT(bj_appointments.Appointment_ID) > 1
Order by Count(bj_appointments.Appointment_ID) DESC;

-- Pet clients that have been turned away due to lack of vaccinations
SELECT janglesdb_pets.Name, bj_appointments.Vaccination 
FROM janglesdb_pets
   JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
WHERE bj_appointments.Vaccination = 'No';

-- Client that has been groomed the most often
SELECT TOP 1 janglesdb_pets.Name AS 'Most groomed',
COUNT(bj_appointmentDetail.Service_Code) AS 'Times Groomed'  
FROM janglesdb_pets
   JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
   JOIN bj_AppointmentDetail ON bj_Appointments.Appointment_ID
       = bj_appointmentDetail.Appointment_ID
GROUP BY janglesdb_pets.Name
ORDER BY COUNT(bj_appointmentDetail.Service_Code) DESC;

-- Finding which employees earn more than the average salary for all employees 
SELECT TOP 1 janglesdb_pets.Name AS 'Most groomed',
COUNT(bj_appointmentDetail.Service_Code) AS 'Times Groomed'  
FROM janglesdb_pets
   JOIN bj_cases ON janglesdb_pets.Pet_ID = bj_cases.Pet_ID
JOIN bj_appointments ON bj_cases.Appointment_ID = bj_appointments.Appointment_ID
   JOIN bj_AppointmentDetail ON bj_Appointments.Appointment_ID
       = bj_appointmentDetail.Appointment_ID
WHERE bj_AppointmentDetail.Service_Code LIKE 'B%'
GROUP BY janglesdb_pets.Name
ORDER BY COUNT(bj_appointmentDetail.Service_Code) DESC;

-- Finding the part-time employee that has been with BoJangles the longest
SELECT TOP 1 CONCAT(bj_employees.Fname, ' ', bj_employees.Lname) AS 'Employee',
CONVERT(DATE, bj_employees.Start_Date) AS 'Start Date' 
FROM bj_employees
WHERE bj_employees.Status = 'Part-Time'
ORDER BY bj_employees.Start_Date ASC;

-- Finding the employee that has taken the most sick days
SELECT TOP 1 CONCAT(bj_employees.Fname, ' ', bj_employees.Lname) AS 'Employee', bj_employeesalary.Sick_Days 
FROM bj_employees
   JOIN bj_employeesalary ON bj_employees.Employee_ID = bj_employeesalary.Employee_ID
ORDER BY bj_employeesalary.Sick_Days DESC;

-- Number of services ordered by amount descending
SELECT bj_services.Service_Code, bj_services.Description, COUNT(bj_appointmentdetail.Service_Code) AS AmountOrdered, 
bj_services.Fee AS FeePerOrder
FROM bj_appointmentdetail
INNER JOIN bj_services ON bj_services.Service_Code=bj_appointmentdetail.Service_Code
GROUP BY bj_services.Service_Code, bj_services.Description, bj_services.Fee
ORDER BY COUNT(bj_services.Service_Code) DESC;