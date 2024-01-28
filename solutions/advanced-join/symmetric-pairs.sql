SET @row_num := 0;
WITH FNum AS (SELECT (@row_num := @row_num + 1) AS RowNum, X, Y FROM Functions)
SELECT
  CASE WHEN F.X < F.Y THEN F.X ELSE F.Y END AS X,
  CASE WHEN F.X < F.Y THEN F.Y ELSE F.X END AS Y
FROM FNum AS F
INNER JOIN FNum AS G ON F.X = G.Y AND F.Y = G.X AND F.RowNum < G.RowNum
ORDER BY X ASC;