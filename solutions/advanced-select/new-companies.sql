SELECT Company.company_code, founder, LMCount, SMCount, MCount, ECount
FROM Company
-- Lead Managers
LEFT JOIN
 (SELECT company_code, COUNT(DISTINCT(lead_manager_code)) AS LMCount FROM Lead_Manager GROUP BY company_code) AS LMGroups
 ON LMGroups.company_code = Company.company_code
-- Senior Managers
LEFT JOIN
 (SELECT company_code, COUNT(DISTINCT(senior_manager_code)) AS SMCount FROM Senior_Manager GROUP BY company_code) AS SMGroups
 ON SMGroups.company_code = Company.company_code
-- Managers
LEFT JOIN
 (SELECT company_code, COUNT(DISTINCT(manager_code)) AS MCount FROM Manager GROUP BY company_code) AS MGroups
 ON MGroups.company_code = Company.company_code
-- Employees
LEFT JOIN
 (SELECT company_code, COUNT(DISTINCT(employee_code)) AS ECount FROM Employee GROUP BY company_code) AS EGroups
 ON EGroups.company_code = Company.company_code
ORDER BY company_code ASC