CREATE KEYSPACE IF NOT EXISTS requirements
WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': 3
};

USE requirements;

CREATE TABLE IF NOT EXISTS projects (
    project_id uuid PRIMARY KEY,
    name text,
    owner text,
    status text,
    created_date timestamp
);

CREATE TABLE IF NOT EXISTS requirements_by_project (
    project_id uuid,
    req_id uuid,
    title text,
    status text,
    priority text,
    author text,
    created_date timestamp,
    PRIMARY KEY (project_id, req_id)
);

CREATE TABLE IF NOT EXISTS requirements_by_status (
    status text,
    created_date timestamp,
    req_id uuid,
    title text,
    author text,
    project_id uuid,
    PRIMARY KEY (status, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);

CREATE TABLE IF NOT EXISTS requirements_by_author (
    author text,
    created_date timestamp,
    req_id uuid,
    title text,
    status text,
    project_id uuid,
    PRIMARY KEY (author, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);

CREATE TABLE IF NOT EXISTS requirement_history (
    req_id uuid,
    changed_at timestamp,
    field text,
    old_value text,
    new_value text,
    changed_by text,
    PRIMARY KEY (req_id, changed_at)
) WITH CLUSTERING ORDER BY (changed_at DESC);
