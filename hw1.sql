
-- Q1
SELECT DISTINCT s.stuId,  CONCAT(s.fname, ' ', s.lname) AS student, d2.deptName AS minor
FROM student AS s  LEFT JOIN department AS d2 ON (s.minor =  d2.deptCode)
where s.major = 'CSCI' AND s.advisor = 1011;

--____________________________________________________________________________________--
--Q2
SELECT DISTINCT s.stuId,  CONCAT(s.fname, ' ', s.lname) AS student, s.credits, f.facId, 
CONCAT(f.fname, ' ', f.lname) AS advisor
FROM student AS s  LEFT JOIN faculty AS f ON (s.advisor = f.facId)
WHERE f.facId = 1011 OR f.facId = 1017 OR f.facId = 1015;
--____________________________________________________________________________________--
--Q3
--cl has classId, courseId, facId
-- f has facId, DeptCode
-- e has stuId, classId
SELECT DISTINCT CONCAT(cs.rubric,cs.number) AS courseId, cs.name, cl.semester, cl.year, CONCAT(f.fname, ' ', f.lname) 
AS instructor, CONCAT(s.fname, ' ', s.lname) AS student, e.grade, e.stuId

FROM student AS s INNER JOIN enroll AS e ON (s.stuId =e.stuId) 
INNER JOIN  class AS cl ON (e.classId= cl.classId) 
INNER JOIN faculty AS f ON (cl.facId =f.facId) INNER JOIN course AS cs 
ON (s.advisor=f.facId) AND (cs.courseId=cl.courseId)

WHERE cs.rubric='CSCI';
--____________________________________________________________________________________--
--Q4
SELECT DISTINCT CONCAT(cs.rubric,cs.number) AS courseId, cs.name, cl.semester, cl.year, CONCAT(f.fname, ' ', f.lname) 
AS instructor, CONCAT(s.fname, ' ', s.lname) AS student, e.grade, e.stuId

FROM student AS s INNER JOIN enroll AS e ON (s.stuId =e.stuId) 
INNER JOIN  class AS cl ON (e.classId= cl.classId) 
INNER JOIN faculty AS f ON (cl.facId =f.facId) INNER JOIN course AS cs 
ON (s.advisor=f.facId) AND (cs.courseId=cl.courseId)

WHERE cs.rubric='CSCI' AND e.grade IN ('B-','B','B+','A-','A','A+');
--____________________________________________________________________________________--
--Q5
SELECT DISTINCT CONCAT(s.fname, ' ', s.lname) AS 'student with failing grades or no grade'
FROM student AS s INNER JOIN enroll AS e ON (s.stuId =e.stuId)
where e.grade IN ('C-','D','F') OR e.grade IS NULL;
