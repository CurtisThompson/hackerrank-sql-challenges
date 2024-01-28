SELECT Students.Name
FROM Students
INNER JOIN Friends ON Students.ID = Friends.ID
INNER JOIN Packages AS StudentPackage ON Students.ID = StudentPackage.ID
INNER JOIN Packages AS FriendPackage ON Friends.Friend_ID = FriendPackage.ID
WHERE StudentPackage.Salary < FriendPackage.Salary
ORDER BY FriendPackage.Salary ASC;