USE requirements;

SELECT * FROM projects;
SELECT * FROM requirements_by_project WHERE project_id = 11111111-1111-1111-1111-111111111111;
SELECT * FROM requirements_by_status WHERE status = 'APPROVED';
SELECT * FROM requirements_by_author WHERE author = 'Иванов';
SELECT * FROM requirement_history WHERE req_id = 11111111-1111-1111-1111-111111111111;

CONSISTENCY ONE;
SELECT COUNT(*) FROM requirements_by_project;

CONSISTENCY QUORUM;
SELECT COUNT(*) FROM requirements_by_project;
