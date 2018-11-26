
DROP TABLE IF EXISTS population;

CREATE TABLE population (
  region STRING,
  ages STRING,
  year INT,
  population INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 'state-population.csv' OVERWRITE INTO TABLE population;
