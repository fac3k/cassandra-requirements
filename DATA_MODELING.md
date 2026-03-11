# Моделирование данных

## Таблицы

### projects
```cql
CREATE TABLE projects (
    project_id uuid PRIMARY KEY,
    name text,
    owner text,
    status text
);
CREATE TABLE requirements_by_project (
    project_id uuid,
    req_id uuid,
    title text,
    status text,
    priority text,
    author text,
    created_date timestamp,
    PRIMARY KEY (project_id, req_id)
);
CREATE TABLE requirements_by_status (
    status text,
    created_date timestamp,
    req_id uuid,
    title text,
    author text,
    project_id uuid,
    PRIMARY KEY (status, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);
CREATE TABLE requirements_by_author (
    author text,
    created_date timestamp,
    req_id uuid,
    title text,
    status text,
    project_id uuid,
    PRIMARY KEY (author, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);
CREATE TABLE requirement_history (
    req_id uuid,
    changed_at timestamp,
    field text,
    old_value text,
    new_value text,
    changed_by text,
    PRIMARY KEY (req_id, changed_at)
) WITH CLUSTERING ORDER BY (changed_at DESC);
