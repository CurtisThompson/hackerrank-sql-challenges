SELECT
  CASE
    WHEN Grade >= 8 THEN Name
    ELSE NULL
  END,
  Grade,
  Marks
FROM Students
INNER JOIN Grades ON Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark
ORDER BY Grade DESC, Name ASC