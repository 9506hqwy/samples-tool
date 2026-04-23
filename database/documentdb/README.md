# DocumentDB

## Start

Start database.

```sh
podman run \
    -d \
    -p 10260:10260 \
    ghcr.io/documentdb/documentdb/documentdb-local:latest \
        --username admin \
        --password admin \
        --skip-init-data
```

Run operations.

```sh
uv run client.py
```

```json
{'_id': ObjectId('69ea0bfc4531d905e338686a'), 'id': 'aaa', 'name': 'AAA'}
```

Connect PostgreSQL.

```sh
podman exec -it <container> psql -h 127.0.0.1 -p 9712 -d postgres
```

List tables.

```sh
\dt
```

```text
                          List of relations
         Schema         |          Name          | Type  |   Owner
------------------------+------------------------+-------+------------
 documentdb_api_catalog | collection_indexes     | table | documentdb
 documentdb_api_catalog | collections            | table | documentdb
 documentdb_api_catalog | documentdb_index_queue | table | documentdb
 public                 | spatial_ref_sys        | table | documentdb
(4 rows)
```

Create database and collection.

```sql
select documentdb_api.create_collection('test', 'test');
```

```text
NOTICE:  creating collection
 create_collection
-------------------
 t
(1 row)
```

Confirm collections.

```sql
select * from collections;
```

```text
 database_name |  collection_name  | collection_id | shard_key |           collection_uuid            | view_definition | validator | validation_level | validation_action
---------------+-------------------+---------------+-----------+--------------------------------------+-----------------+-----------+------------------+-------------------
 test          | system.dbSentinel |             9 |           | dafa8cff-fb51-45b1-bfab-ce2d4ddb4449 |                 |           |                  |
 test          | test              |            10 |           | 3155f79f-28e7-42d7-9bce-0df1ed72d707 |                 |           |                  |
(2 rows)
```

Insert data.

```sql
select documentdb_api.insert_one('test', 'test', '{"id": "aaa", "name": "AAA"}');
```

```text
                              insert_one
----------------------------------------------------------------------
 { "n" : { "$numberInt" : "1" }, "ok" : { "$numberDouble" : "1.0" } }
(1 row)
```

Fetch data.

```sql
SELECT * FROM documentdb_api.collection('test','test');
```

```text
 shard_key_value |                    object_id                     |                                     document
-----------------+--------------------------------------------------+-----------------------------------------------------------------------------------
              10 | { "" : { "$oid" : "69ea20ca4d01f09584072fa0" } } | { "_id" : { "$oid" : "69ea20ca4d01f09584072fa0" }, "id" : "aaa", "name" : "AAA" }
(1 row)
```

Switch schema and confirm tables.

```sh
set search_path to documentdb_data;
\d
```

```text
                       List of relations
     Schema      |     Name     | Type  |         Owner
-----------------+--------------+-------+-----------------------
 documentdb_data | documents_10 | table | documentdb_admin_role
 documentdb_data | documents_9  | table | documentdb_admin_role
 documentdb_data | retry_10     | table | documentdb_admin_role
 documentdb_data | retry_9      | table | documentdb_admin_role
(4 rows)
```

Fetch data.

```sql
select * from  documents_10;
```

```text
 shard_key_value |                    object_id                     |                                     document
-----------------+--------------------------------------------------+-----------------------------------------------------------------------------------
              10 | { "" : { "$oid" : "69ea20ca4d01f09584072fa0" } } | { "_id" : { "$oid" : "69ea20ca4d01f09584072fa0" }, "id" : "aaa", "name" : "AAA" }
(1 row)

```

## References

- [DocumentDB](https://documentdb.io/)
- [Functions](https://github.com/documentdb/documentdb/wiki/Functions)
