SELECT CEILING(AVG(Salary) - AVG(CONVERT(REPLACE(CONVERT(Salary, CHAR), "0", ""), UNSIGNED)))
FROM Employees