# nycdsa Docker Images

To get started, please read [Docker QuickStart](https://github.com/nycdatasci/bootcamp/blob/master/Docker/docker-quickstart.md)

Software versions:

- [nycdsa/linux-tookits](https://hub.docker.com/r/nycdsa/linux-toolkits/)
  - Ubuntu: 16.04
  - Python: 3.5.2
  - MySQL: 5.7.23
  
- [nycdsa/mysql-movies-db](https://hub.docker.com/r/nycdsa/mysql-movies-db/)
  - Base: nycdsa/linux-tookits
  - Database: movies_db
    - actors
    - directors
    - movies
  
- [nycdsa/hadoop-core](https://hub.docker.com/r/nycdsa/hadoop-core/)
  - Ubuntu: 16.04
  - Python: 3.5.2
  - Hadoop: 2.8.4

- [nycdsa/hadoop-stack](https://hub.docker.com/r/nycdsa/hadoop-stack/)
  - Base: nycdsa/hadoop-core
  - Tez: 0.9.1
  - Hive: 2.3.3
  - Pig: 0.17.0
