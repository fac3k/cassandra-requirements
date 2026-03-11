# Управление требованиями в Cassandra

**Трофимов**  
Тема: Моделирование NoSQL-базы для системы управления требованиями. Создание схемы хранения данных в Cassandra и выполнение запросов на CQL. Фиксирование особенностей распределённости и отказоустойчивости.

<div align="center">

![Cassandra](https://img.shields.io/badge/Apache%20Cassandra-1287B1?style=flat-square&logo=apache%20cassandra&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![CQL](https://img.shields.io/badge/CQL-Cassandra%20Query%20Language-orange)

</div>

## 📋 О проекте

Система управления требованиями (Requirements Management System) на базе Apache Cassandra. 
Проект демонстрирует принципы моделирования данных в NoSQL-базах, распределённость и отказоустойчивость.

## 📚 Документация

| Файл | Описание |
|------|----------|
| [ARCHITECTURE.md](ARCHITECTURE.md) | Архитектура системы и кластера Cassandra |
| [DATA_MODELING.md](DATA_MODELING.md) | Моделирование данных, таблицы, ключи |
| [CQL_QUERIES.md](CQL_QUERIES.md) | Примеры запросов на CQL |
| [REPLICATION_CONSISTENCY.md](REPLICATION_CONSISTENCY.md) | Репликация и уровни согласованности |
| [FAULT_TOLERANCE.md](FAULT_TOLERANCE.md) | Отказоустойчивость кластера |
| [PERFORMANCE_TUNING.md](PERFORMANCE_TUNING.md) | Настройка производительности |
| [BACKUP_RESTORE.md](BACKUP_RESTORE.md) | Резервное копирование и восстановление |
| [SECURITY.md](SECURITY.md) | Безопасность и аутентификация |
| [MONITORING.md](MONITORING.md) | Мониторинг и метрики |
| [TROUBLESHOOTING.md](TROUBLESHOOTING.md) | Решение проблем |
| [GLOSSARY.md](GLOSSARY.md) | Словарь терминов |
| [RUNBOOKS.md](RUNBOOKS.md) | Инструкции для администратора |

## 🚀 Быстрый старт

```bash
# Запустить кластер
docker-compose up -d

# Создать схему
docker exec -it cassandra-seed cqlsh -f schema.cql

# Загрузить данные
docker exec -it cassandra-seed cqlsh -f data.cql
