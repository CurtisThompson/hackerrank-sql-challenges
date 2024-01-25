SELECT
  Hackers.Hacker_ID AS HID,
  Hackers.Name AS HName
FROM Hackers
INNER JOIN Submissions ON Hackers.Hacker_ID = Submissions.Hacker_ID
INNER JOIN Challenges ON Submissions.Challenge_ID = Challenges.Challenge_ID
INNER JOIN Difficulty ON Challenges.Difficulty_Level = Difficulty.Difficulty_Level
WHERE Submissions.Score = Difficulty.Score
GROUP BY Hackers.Hacker_ID, Hackers.Name
HAVING COUNT(Submissions.Challenge_ID) > 1
ORDER BY
  COUNT(Submissions.Challenge_ID) DESC,
  Hackers.Hacker_ID ASC;