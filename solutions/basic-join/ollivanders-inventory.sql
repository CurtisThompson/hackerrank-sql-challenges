SELECT W.ID, P.Age, W.Coins_Needed, W.Power
FROM Wands AS W
INNER JOIN Wands_Property AS P ON W.Code = P.Code
WHERE P.Is_Evil = 0
AND W.Coins_Needed = (SELECT MIN(A.Coins_Needed)
                      FROM Wands AS A
                      INNER JOIN Wands_Property AS B ON A.Code = B.Code
                      WHERE W.Power = A.Power AND P.Age = B.Age)
ORDER BY W.Power DESC, P.Age DESC;