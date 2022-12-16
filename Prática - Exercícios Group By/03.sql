SELECT u.name AS writer, COUNT(t."writerId") AS "testimonialCount"
FROM testimonials t
JOIN users u ON t."writerId" = u.id
WHERE t."writerId" = 435
GROUP BY u.id;