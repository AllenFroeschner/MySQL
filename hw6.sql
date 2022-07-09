--Q1.

SELECT DISTINCT s.LName AS 'SwimmerLName', s.FName AS 'SwimmerFName', c.LName AS 'PrimaryCaretakerLName'
, c.LName AS 'PrimaryCaretakerLName'
FROM swimmer AS s INNER JOIN caretaker AS c ON (s.Main_CT_Id=c.CT_Id);

--Q2

SELECT DISTINCT s.LName, s.FName, s.currentLevelId
FROM swimmer AS s INNER JOIN level AS l ON(s.currentLevelId=l.LevelId)
WHERE l.Level != 'Green' AND l.Level != 'Blue';

--Q3

SELECT DISTINCT CONCAT(s.LName,' ',s.FName) AS 'swimmer', m.Title AS 'Meet', v.Address AS 'Meet Address'
FROM swimmer AS s INNER JOIN participation AS p ON(s.SwimmerId=p.SwimmerId), meet AS m 
INNER JOIN venue AS v ON(m.VenueId=v.VenueId)
WHERE v.Address LIKE '%Bay Area Boulevard' AND p.Participated=1;

--Q4
SELECT DISTINCT CONCAT(s.LName,' ',s.FName) AS 'swimmer in UHCL Open',l.Level, e.Title
FROM swimmer AS s INNER JOIN participation AS p ON(s.SwimmerId=p.SwimmerId) INNER JOIN event AS e 
ON(p.EventId=e.EventId) INNER JOIN meet AS m ON( e.MeetId=m.MeetId), level AS l 
WHERE m.Title='UHCL Open' AND p.Participated=1;


