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
