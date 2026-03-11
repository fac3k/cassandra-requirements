```markdown
# Репликация и согласованность

## Репликация
```cql
CREATE KEYSPACE requirements
WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': 3
};
