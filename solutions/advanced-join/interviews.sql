SELECT
  Contests.Contest_ID,
  Contests.Hacker_ID,
  Contests.Name,
  SUM(SS.TS),
  SUM(SS.TAS),
  SUM(VS.TV),
  SUM(VS.TUV)
FROM Challenges
LEFT JOIN (
  SELECT Challenge_ID, SUM(Total_Views) AS TV, SUM(Total_Unique_Views) AS TUV
  FROM View_Stats
  GROUP BY Challenge_ID
) AS VS ON Challenges.Challenge_ID = VS.Challenge_ID
LEFT JOIN (
  SELECT Challenge_ID, SUM(Total_Submissions) AS TS, SUM(Total_Accepted_Submissions) AS TAS
  FROM Submission_Stats
  GROUP BY Challenge_ID
) AS SS ON Challenges.Challenge_ID = SS.Challenge_ID
INNER JOIN Colleges ON Challenges.College_ID = Colleges.College_ID
INNER JOIN Contests ON Colleges.Contest_ID = Contests.Contest_ID
GROUP BY Contests.Contest_ID, Contests.Hacker_ID, Contests.Name
HAVING SUM(SS.TS) + SUM(SS.TAS) + SUM(VS.TV) + SUM(VS.TUV) > 0
ORDER BY Contests.Contest_ID ASC;