WITH CMades AS (
    (
    SELECT CMade, COUNT(CMade) AS CCount
    FROM (
      SELECT COUNT(Challenge_ID) AS CMade
      FROM Hackers
      INNER JOIN Challenges ON Challenges.Hacker_ID = Hackers.Hacker_ID
      GROUP BY Hackers.Hacker_ID, Hackers.Name
    ) AS C
    GROUP BY CMade
    ORDER BY CMade DESC
    LIMIT 1
  )
  UNION
  (
    SELECT CMade, COUNT(CMade) AS CCount
    FROM (
      SELECT COUNT(Challenge_ID) AS CMade
      FROM Hackers
      INNER JOIN Challenges ON Challenges.Hacker_ID = Hackers.Hacker_ID
      GROUP BY Hackers.Hacker_ID, Hackers.Name
    ) AS C
    GROUP BY CMade
    HAVING CCount = 1
  )
)
SELECT HID, HName, HackerCounts.CMade
FROM (
  SELECT Hackers.Hacker_ID AS HID, Hackers.Name AS HName, COUNT(Challenge_ID) AS CMade
  FROM Hackers
  INNER JOIN Challenges ON Challenges.Hacker_ID = Hackers.Hacker_ID
  GROUP BY Hackers.Hacker_ID, Hackers.Name
) AS HackerCounts
INNER JOIN CMades ON CMades.CMade = HackerCounts.CMade
ORDER BY HackerCounts.CMade DESC, HID ASC;