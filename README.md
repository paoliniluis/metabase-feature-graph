# What's this

Trying to map all Metabase concepts into a Neo4j database to build test cases

## How to run

- docker compose up (although it will just start the DB)
- then go to http://localhost:7474/ and click on "connect"
- enter what's in the "features.cypher" file in the terminal and run it
- then run the command on "how to see the nodes visually"

## How to delete the DB

```
MATCH (n)
DETACH DELETE n;
```

## How to see the nodes visually

```
MATCH (n)-[r]->(m) RETURN n,r,m;
```