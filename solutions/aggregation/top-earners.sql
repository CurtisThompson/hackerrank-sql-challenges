SET @max_sal := (SELECT MAX(Months * Salary) FROM Employee);
SELECT @max_sal, COUNT(Name)
FROM Employee
WHERE Months * Salary >= @max_sal;