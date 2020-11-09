CREATE DATABASE my_database;

CREATE TABLE my_table
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);

INSERT INTO my_table
    (content)
VALUES
    ('random text');
