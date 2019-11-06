## PostgreSQL

### [Installation](https://www.postgresql.org/download/)

[Additional instructions](http://www.postgresqltutorial.com/)

#### Linux

```
$: sudo apt-get update
$: sudo apt-get install postgresql-X
# Note: if you get an error "Could not get lock..." then just wait a few minutes for apt to finish or consult the web page below
# Note: restart OS
```
* [Apt lock question on StackExchange](https://askubuntu.com/questions/15433/unable-to-lock-the-administration-directory-var-lib-dpkg-is-another-process/315791#315791)  

```
$: createdb _username  # check installation
# Note: if you get an error "...role _username does not exist" then you will need to create a role first
```
* [PostgreSQL tutorial about creating a database](https://www.postgresql.org/docs/10/static/tutorial-createdb.html)  
* [DigitalOcean on role and database creation](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)  

```
# Note: create a PostgreSQL role
$: sudo -i -u postgres
$: createuser --interactive
  # Enter name of role to add: _username
  # Shall the new role be a superuser? (y/n) y
# Note: PostgreSQL roles are separate from Linux usernames
# Note: go back and create a database with the same username
```

```
# Note: when you have a role and a database
$: psql
  # \q  # quit
```

### [Installing pgadmin](http://queirozf.com/entries/installing-postgresql-and-pgadmin-on-ubuntu)

```
$: sudo apt-get install pgadmin3
```

```
$: psql
\password _username
Enter your password: _password
```

```
$: pgadmin3
```

```
# Note: click "Add a connection to a server"
Name: Catchy-Name
Host: localhost
Port: by default, its 5432
Maintenance DB: postgres
Username: _username
Password: _password
```

### PgAdmin interface

Buttons:
* Refresh
* Execute arbitrary SQL queries
* Expand schemas list
* Show data in selected table

### [PostgreSQL and Python psycopg](http://www.postgresqltutorial.com/postgresql-python/)

```
$: conda search psycopg2
$: conda install psycopg2
```

### [Tutorial](https://www.postgresql.org/docs/10/static/tutorial-accessdb.html)

```
$: SELECT version();
$: SELECT current_date;
$: SELECT 2 + 2;
$: \h
$: \q
```

TODO
