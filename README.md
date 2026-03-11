# Управление требованиями в Cassandra

**Трофимов**  
Тема: Моделирование NoSQL-базы для системы управления требованиями. Создание схемы хранения данных в Cassandra и выполнение запросов на CQL. Фиксирование особенностей распределённости и отказоустойчивости.

- 1 Contributor
- 0 Issues
- 0 Stars
- 0 Forks

---

## Описание

Система управления требованиями на Apache Cassandra. Хранение проектов, требований, их статусов, авторов и истории изменений.

---

## Запуск

```bash
# Запустить кластер
docker-compose up -d

# Создать схему
docker exec -it cassandra-seed cqlsh -f schema.cql

# Загрузить данные
docker exec -it cassandra-seed cqlsh -f data.cql

# Выполнить запросы
docker exec -it cassandra-seed cqlsh -f queries.cql
CREATE KEYSPACE requirements
WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': 3};

USE requirements;

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
USE requirements;

-- Требования проекта
SELECT * FROM requirements_by_project WHERE project_id = 11111111-1111-1111-1111-111111111111;

-- Требования по статусу
SELECT * FROM requirements_by_status WHERE status = 'APPROVED';

-- Требования по автору
SELECT * FROM requirements_by_author WHERE author = 'Трофимов';

-- История требования
SELECT * FROM requirement_history WHERE req_id = 11111111-1111-1111-1111-111111111111;
# Статус кластера
docker exec cassandra-seed nodetool status

# Остановить узел
docker stop cassandra-node1

# Запрос с ONE работает
docker exec cassandra-seed cqlsh -e "CONSISTENCY ONE; SELECT * FROM requirements.projects;"

# Запрос с ALL упадет
docker exec cassandra-seed cqlsh -e "CONSISTENCY ALL; SELECT * FROM requirements.projects;"
cassandra-requirements/
├── README.md
├── docker-compose.yml
├── schema.cql
├── data.cql
└── queries.cql
