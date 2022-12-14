SELECT
    schools.id,
    schools.name AS school,
    courses.name AS course,
    companies.name AS company,
    roles.name AS role
FROM educations
JOIN schools ON educations."schoolId" = schools.id
JOIN courses ON educations."courseId" = courses.id
JOIN applicants ON educations."userId" = applicants."userId"
JOIN jobs ON applicants."jobId" = jobs.id
JOIN companies ON jobs."companyId" = companies.id
JOIN roles ON jobs."roleId" = roles.id
WHERE companies.id = 10 AND roles.name = 'Software Engineer' and jobs.active = true;