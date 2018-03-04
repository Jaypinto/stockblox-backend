DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO public;
DROP DATABASE stockbloxdb;
CREATE DATABASE stockbloxdb;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "user" (
   id INTEGER PRIMARY KEY NOT NULL,
   first_name varchar NOT NULL,
   last_name varchar NOT NULL,
   email varchar UNIQUE NOT NULL,
   password_hash varchar NOT NULL
);

CREATE TABLE "user_settings"(
   user_id INTEGER REFERENCES "user"(ID) NOT NULL,
   language varchar NOT NULL
);

CREATE TABLE "dashboard"(
   id INTEGER PRIMARY KEY NOT NULL,
   user_id INTEGER REFERENCES "user"(ID) NOT NULL,
   dashboard_name varchar(50) NOT NULL
);

CREATE TABLE "market"(
   id INTEGER PRIMARY KEY NOT NULL,
   market_ticker varchar(10) UNIQUE NOT NULL,
   market_name varchar(50) NOT NULL,
   prev_close NUMERIC(20,5)
);

CREATE TABLE "stock"(
   id INTEGER PRIMARY KEY NOT NULL,
   stock_ticket varchar(10) UNIQUE NOT NULL,
   stock_name varchar(100) NOT NULL,
   prev_close NUMERIC(20,5)
);

CREATE TABLE "contains_market"(
   dashboard_id INTEGER REFERENCES "dashboard"(ID) NOT NULL,
   market_id INTEGER REFERENCES "market"(ID) NOT NULL
);

CREATE TABLE "contains_stock"(
   DASHBOARD_ID INTEGER REFERENCES "dashboard"(ID) NOT NULL,
   STOCK_ID INTEGER REFERENCES "stock"(ID) NOT NULL
);


   


