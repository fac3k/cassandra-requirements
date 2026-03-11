USE requirements;

INSERT INTO projects (project_id, name, owner, status, created_date)
VALUES (11111111-1111-1111-1111-111111111111, 'CRM System', 'Иванов', 'ACTIVE', '2024-01-15');

INSERT INTO projects (project_id, name, owner, status, created_date)
VALUES (22222222-2222-2222-2222-222222222222, 'Mobile App', 'Петров', 'ACTIVE', '2024-02-01');

INSERT INTO requirements_by_project (project_id, req_id, title, status, priority, author, created_date)
VALUES (11111111-1111-1111-1111-111111111111, 11111111-1111-1111-1111-111111111111, 'Авторизация пользователей', 'APPROVED', 'HIGH', 'Иванов', '2024-01-16');

INSERT INTO requirements_by_status (status, created_date, req_id, title, author, project_id, priority)
VALUES ('APPROVED', '2024-01-16', 11111111-1111-1111-1111-111111111111, 'Авторизация пользователей', 'Иванов', 11111111-1111-1111-1111-111111111111, 'HIGH');

INSERT INTO requirements_by_author (author, created_date, req_id, title, status, project_id, priority)
VALUES ('Иванов', '2024-01-16', 11111111-1111-1111-1111-111111111111, 'Авторизация пользователей', 'APPROVED', 11111111-1111-1111-1111-111111111111, 'HIGH');

INSERT INTO requirement_history (req_id, changed_at, field, old_value, new_value, changed_by)
VALUES (11111111-1111-1111-1111-111111111111, '2024-01-17', 'status', 'DRAFT', 'APPROVED', 'Иванов');
