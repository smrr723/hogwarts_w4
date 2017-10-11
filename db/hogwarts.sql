DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  url VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  house_id SERIAL4 REFERENCES houses(id) ON DELETE CASCADE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4
);
