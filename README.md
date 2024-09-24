# ntu-sc2207
NTU SC2207 Introduction to Database: Lab Project
- Targets MSQLServer's SQL dialect as per lab requirements.

## Contributing
### Project Structure
Project structure:
- `ddl/*.sql`: SQL DDL statements to create the tables in DB schema.
- `data/*.sql`: SQL `INSERT` statements to populate the tables with data rows.
- `queries/*.sql`: SQL queries to retrieve data as per lab requirements.

> `ddl/` SQL files will execute first, followed by `data/` then `queries/`

### File Naming
SQL files should be named in the format: `<ORDER>_*.sql` :
-  `<ORDER>` is a positive integer defining the **sequence** in which the SQL files should be executed within their respective folders.
