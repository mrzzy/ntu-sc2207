# ntu-sc2207

NTU SC2207 Introduction to Database: Lab Project

- Targets MS SQLServer's SQL dialect as per lab requirements.

## Contributing

### Linter

Install SQL Linter:

```sh
pip install sqlfluff
```

Before pushing, please run the linter & fix any violations:

```sh
sqlfluff fix .
```

### Project Structure

Project structure:

- `ddl.sql`: SQL DDL statements to create the tables in DB schema.
- `data.sql`: SQL `INSERT` statements to populate the tables with data rows.
- `queries.sql`: SQL queries to retrieve data as per lab requirements.

> `ddl.sql` will be executed first, followed by `data.sql` then `queries.sql`
