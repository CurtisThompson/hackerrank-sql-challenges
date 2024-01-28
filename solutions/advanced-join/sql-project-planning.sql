SET @row_num := 0;
SELECT MIN(Start_Date), MAX(End_Date)
FROM (
  SELECT
    Task_ID,
    Start_Date,
    End_Date,
    CASE
      WHEN Date_Change IN (NULL, 1) THEN @row_num
      ELSE @row_num := @row_num + 1
    END AS Project_Num
  FROM (
    SELECT
      Task_ID,
      Start_Date,
      End_Date,
      DATEDIFF(End_Date, LAG(End_Date, 1, 0) OVER (ORDER BY End_Date ASC)) AS Date_Change
    FROM Projects
    ORDER BY End_Date ASC
  ) AS ProjectsDateChanges
) As ProjectsNumbered
GROUP BY Project_Num
ORDER BY COUNT(Start_Date) ASC, MIN(Start_Date) ASC;