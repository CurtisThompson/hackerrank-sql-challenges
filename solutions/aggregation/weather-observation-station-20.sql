SET @row_num := 0;
SELECT ROUND(AVG(Lat_N), 4) AS Median
FROM (
  SELECT (@row_num := @row_num + 1) AS RowNum, Lat_N
  FROM Station
  ORDER BY Lat_N ASC
) AS OrderedLats
WHERE RowNum IN (FLOOR((@row_num+1)/2), FLOOR((@row_num+2)/2));