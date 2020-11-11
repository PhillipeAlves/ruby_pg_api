![Banner](/public/ruby-banner.gif)

>>>## Steps to create a DB


### `1`

### Create a squema

On your root directory create a directory called `db`. 

Inside of the `db` directory touch a file called `schema.sql`.

In the `schema.sql` file create a **squema**.

E.g.:

```
CREATE DATABASE my_database_name;

CREATE TABLE my_table
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);

INSERT INTO my_table
    (content)
VALUES
    ('random text');

```
---
> **_note:_** A database **schema** represents the logical <br/>
 configuration of all or part of a relational database.<br/>
It can exist both as a visual representation and as  <br/> 
a set of formulas known as integrity constraints <br/> 
that govern a database. 

---

### `2`

### Enter the PostgreSQL console

```
$ psql
```
---

### `3`

### Create a database

```
$ CREATE DATABASE my_database;
```
---

### `4`

### Connect to the database

```
$ \c my_database
```

---

### `5`

### Create a table

```
$ CREATE TABLE my_table
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);
```

---

### `6`

### Fill the table with dummy data

```
$ INSERT INTO my_table
    (content)
VALUES
    ('random text');
```

---

### `7`

### To see all the tables in the database


```
$ \dt
```

E.g. result:
          
| Schema |   Name   | Type  |  Owner  |
| :----: | :------: | :---: | :-----: |
| public | my_table | table |   me    |

--- 

### `8`

### To see the fields available in a specific table

```
$ select * from my_table;
```

E.g. result:

|  id |   content    |
| :-: | :----------: | 
|  1  |  random text |

---

>>>## Deploying to Heroku

### `1`

### Create a Procfile (no extensions)

```
web: bundle exec ruby main.rb -p $PORT
```
---

### `2`

### Database connection

***models/my_table.rb***

```
PG.connect(ENV['DATABASE_URL'] || { dbname: 'my_database' })
```
---

### `3`

### Create your app

```
$ heroku login
$ heroku create
```
---

### `4`

### Check for addons

Use the **_heroku addons_** command to determine whether your app already </br>
has Heroku Postgres provisioned:

```
$ heroku addons

Add-on                                                      Plan       Price  State
──────────────────────────────────────────────────────────  ─────────  ─────  ───────
heroku-postgresql (postgresql-concave-52656)                hobby-dev  free   created
```
---

### `5`

### Connect your DB

If heroku-postgresql doesn’t appear in your app’s list of add-ons, </br>
you can provision it with the following CLI command:

```
$ heroku addons:create heroku-postgresql:hobby-dev
```

> **note:** **hobby-dev** is a free database plan offered by Heroku. </br>
As part of the provisioning process, a **DATABASE_URL** config var </br>
is added to your app’s configuration. This contains the URL </br>
your app uses to access the database.

---

### `6`

### Deploy

```
$ git add .
$ git commit -m "message..."
$ git push heroku master
```
---

>>>## Local server

### `1`

### Clone the project to your local directory

```
$ git clone https://github.com/PhillipeAlves/ruby_pg_api.git cd ruby_pg_api
```
---

### `2`

### To run the server locally

```
$ ruby main.rb
```
---



