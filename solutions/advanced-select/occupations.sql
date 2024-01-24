SET @d_row := 0;
SET @p_row := 0;
SET @s_row := 0;
SET @a_row := 0;

SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor)
FROM (
  SELECT
    CASE
      WHEN Occupation = "Doctor" THEN @d_row := @d_row + 1
      WHEN Occupation = "Professor" THEN @p_row := @p_row + 1
      WHEN Occupation = "Singer" THEN @s_row := @s_row + 1
      WHEN Occupation = "Actor" THEN @a_row := @a_row + 1
    END AS RowNum,
    CASE WHEN Occupation = "Doctor" THEN Name END AS Doctor,
    CASE WHEN Occupation = "Professor" THEN Name END AS Professor,
    CASE WHEN Occupation = "Singer" THEN Name END AS Singer,
    CASE WHEN Occupation = "Actor" THEN Name END AS Actor
  FROM OCCUPATIONS
  ORDER BY Name
) AS LongList
GROUP BY RowNum;
