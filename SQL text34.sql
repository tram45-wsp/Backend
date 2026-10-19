BEGIN;

SELECT capacity 
FROM courses 
WHERE id = 2 
FOR UPDATE;

INSERT INTO registrations (member_id, course_id, status)
SELECT 3, 2, 'confirmed'
WHERE (
    SELECT COUNT(*) 
    FROM registrations 
    WHERE course_id = 1
) < (
    SELECT capacity 
    FROM courses 
    WHERE id = 3
);

COMMIT;

SELECT * FROM registrations WHERE course_id = 2;