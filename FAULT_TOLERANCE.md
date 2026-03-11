```markdown
# Отказоустойчивость

- **Фактор репликации**: 3
- **Толерантность**: до 2 узлов

## Тест
```bash
# Статус кластера
docker exec cassandra-seed nodetool status

# Остановить узел
docker stop cassandra-node1

# ONE - работает
docker exec cassandra-seed cqlsh -e "CONSISTENCY ONE; SELECT * FROM requirements.projects;"

# ALL - НЕ работает
docker exec cassandra-seed cqlsh -e "CONSISTENCY ALL; SELECT * FROM requirements.projects;"
