SELECT "userId" AS id, COUNT(id) AS educations 
FROM  educations 
GROUP BY "userId";