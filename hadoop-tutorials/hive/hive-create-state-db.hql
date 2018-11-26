CREATE DATABASE IF NOT EXISTS state;

-- add table population
DROP TABLE IF EXISTS state.population;

CREATE TABLE state.population (
  region VARCHAR(4),
  ages VARCHAR(10),
  year INT,
  population INT)
ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 'state-population.csv' OVERWRITE INTO TABLE state.population;

-- add table areas
DROP TABLE IF EXISTS state.areas;

CREATE TABLE state.areas (
  state STRING,
  area INT
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 'state-areas.csv' OVERWRITE INTO TABLE state.areas;

-- add table abbrevs
DROP TABLE IF EXISTS state.abbrevs;

CREATE TABLE state.abbrevs (
  state STRING,
  abbreviation VARCHAR(4)
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 'state-abbrevs.csv' OVERWRITE INTO TABLE state.abbrevs;

-- check database
SHOW TABLES FROM state;

