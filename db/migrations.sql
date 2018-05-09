DROP DATABASE IF EXISTS rest_o_rant;

CREATE DATABASE rest_o_rant;

\c rest_o_rant

CREATE TABLE waiters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(128)
);

CREATE TABLE menuitems(
  id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  description TEXT,
  price NUMERIC
);


CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  menuitem_id INT REFERENCES menuitems(id),
  waiter_id INT REFERENCES waiters(id),
  notes VARCHAR(128),
  open BOOLEAN
);