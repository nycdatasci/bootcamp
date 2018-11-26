DROP TABLE IF EXISTS population_partitions;

CREATE TABLE population_partitions (
  region VARCHAR(4),
  ages VARCHAR(10),
  population INT)
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ',';
