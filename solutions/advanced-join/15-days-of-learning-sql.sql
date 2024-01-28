SELECT
  HackersPerDay.Submission_Date,
  HackersPerDay.Continuous_Hackers,
  DailyHacker.Hacker_ID,
  Hackers.Name
FROM (
  SELECT 
    Sub2.Submission_Date, 
    COUNT(Sub2.Hacker_ID) AS Continuous_Hackers
  FROM (
    SELECT 
      S3.Submission_Date,
      S3.Hacker_ID,
      COUNT(DISTINCT S4.Submission_Date)
    FROM Submissions S3
    INNER JOIN Submissions S4
      ON S4.Hacker_ID = S3.Hacker_ID
      AND S4.Submission_Date <= S3.Submission_Date
    GROUP BY S3.Submission_Date, S3.Hacker_ID
    HAVING COUNT(DISTINCT S4.Submission_Date) = DATEDIFF(S3.Submission_Date, '2016-03-01') + 1
    ) AS Sub2
  GROUP BY Sub2.Submission_Date
) AS HackersPerDay
INNER JOIN (
  SELECT 
    TopHackers.Submission_Date, 
    MIN(TopHackers.Hacker_ID) AS Hacker_ID
  FROM (
    SELECT
      S1.Submission_Date,
      S1.Hacker_ID,
      COUNT(S1.Submission_ID)
    FROM Submissions AS S1
    GROUP BY S1.Submission_Date, S1.Hacker_ID
    HAVING COUNT(S1.Submission_ID) = (
      SELECT COUNT(S2.Submission_ID)
      FROM Submissions AS S2
      WHERE S2.Submission_Date = S1.Submission_Date
      GROUP BY S2.Hacker_ID
      ORDER BY COUNT(S2.Submission_ID) DESC
      LIMIT 1
    )
  ) AS TopHackers
  GROUP BY TopHackers.Submission_Date
) AS DailyHacker ON HackersPerDay.Submission_Date = DailyHacker.Submission_Date
INNER JOIN Hackers ON DailyHacker.Hacker_ID = Hackers.Hacker_ID
ORDER BY HackersPerDay.Submission_Date