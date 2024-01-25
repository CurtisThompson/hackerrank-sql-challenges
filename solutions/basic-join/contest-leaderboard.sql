SELECT HID, HName, SUM(MaxScore)
FROM (
  SELECT Hackers.Hacker_ID AS HID,
    Hackers.Name AS HName,
    MAX(Submissions.Score) AS MaxScore
  FROM Hackers
  INNER JOIN Submissions ON Submissions.Hacker_ID = Hackers.Hacker_ID
  GROUP BY Hackers.Hacker_ID, Hackers.Name, Submissions.Challenge_ID
) AS HackerTopScores
GROUP BY HID, HName
HAVING SUM(MaxScore) > 0
ORDER BY SUM(MaxScore) DESC, HID ASC;