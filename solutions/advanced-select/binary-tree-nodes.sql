SELECT
  N,
  CASE
    WHEN P IS NULL THEN "Root"
    WHEN HasChildren IS NULL THEN "Leaf"
    ELSE "Inner"
  END
FROM BST
LEFT JOIN
  (SELECT DISTINCT(P) AS HasChildren FROM BST ORDER BY P) AS ParentTable
  ON ParentTable.HasChildren = BST.N
ORDER BY N ASC;