CREATE DATABASE caffeinate;

CREATE TABLE shops (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(400) NOT NULL,
  address_1 VARCHAR(500),
  address_2 VARCHAR(500),
  city VARCHAR(500),
  state VARCHAR(50),
  zip INTEGER,
  logo_url TEXT,
  shop_owner_id INTEGER,
  shop_group_id INTEGER
);

CREATE TABLE groups (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE shop_groups (
  id SERIAL4 PRIMARY KEY,
  group_id INTEGER,
  shop_id INTEGER
);

CREATE TABLE shop_services (
  id SERIAL4 PRIMARY KEY,
  service_id INTEGER,
  shop_id INTEGER
);


CREATE TABLE services (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE shop_owners (
  id SERIAL4 PRIMARY KEY,
  firstname VARCHAR(400),
  lastname VARCHAR(400),
  email VARCHAR(400),
  phone VARCHAR(400),
  password_digest VARCHAR(400)
);
