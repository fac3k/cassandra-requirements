```markdown
# Инструкции администратора

## Запуск
```bash
docker-compose up -d
docker exec -it cassandra-seed cqlsh -f schema.cql
docker exec -it cassandra-seed cqlsh -f data.cql
docker exec cassandra-seed nodetool status
docker exec cassandra-seed nodetool tablestats requirements
docker exec cassandra-seed nodetool snapshot requirements
docker cp cassandra-seed:/var/lib/cassandra/data/requirements/ ./backup/
