```markdown
# Примеры запросов CQL

## SELECT
```cql
-- Все проекты
SELECT * FROM projects;

-- Требования проекта
SELECT * FROM requirements_by_project WHERE project_id = 11111111-1111-1111-1111-111111111111;

-- Требования по статусу
SELECT * FROM requirements_by_status WHERE status = 'APPROVED';

-- Требования по автору
SELECT * FROM requirements_by_author WHERE author = 'Иванов';

-- История требования
SELECT * FROM requirement_history WHERE req_id = 11111111-1111-1111-1111-111111111111;
CONSISTENCY ONE;
CONSISTENCY QUORUM;
CONSISTENCY ALL;
