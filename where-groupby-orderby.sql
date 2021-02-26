select * from tblEmployee
where DateOfBirth between '19760101' and '19861231'

select * from tblEmployee
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

select * from tblEmployee
where year(DateOfBirth) between 1976 and 1986 -- Do not use

-- Group By and counting each group
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn from tblEmployee
GROUP BY year(DateOfBirth)

SELECT * FROM tblEmployee
where year(DateOfBirth) = 1967

-- Group By and counting each group
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn from tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth)

-- Group By and counting each group
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn  FROM tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth) -- cannot use YearOfDateOfBirth (alias) 
-- non-deterministic

-- Group By and counting each group
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn  FROM tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth) -- cannot use YearOfDateOfBirth (alias) 
ORDER BY year(DateOfBirth) ASC
-- non-deterministic

-- Group By and counting each group
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn  FROM tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth) -- cannot use YearOfDateOfBirth (alias) 
ORDER BY year(DateOfBirth) DESC
-- non-deterministic

