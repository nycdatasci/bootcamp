# movies_db


A sample database includes three tables: `actors`, `directors` and `movies`. The data is available as .csv files under directory `movies-data`

## Installation [with docker container]:

1. Start Docker container with port mapping `-p 3306:3306`:

  ```
  docker run -it \
  -p 3306:3306 \
  nycdsa/mysql-movies-db
  ```
  
  Note: if you have MySQL service running locally, you may need to change the port mapping to `-p 3307:3306`
  
  
## Installation with Docker Toolbox:

If you're using Docker Toolbox, you might have issue downloading with `git clone` inside the docker container. Then you should:

1. `git clone` the repo to your computer first and then `cd` into the `bootcamp`  directory.

2. Start docker container with mount option:
  
  - MAC OS
  
  ```
  docker run -it \
  -p 3306:3306 \
  -v $(pwd):/home/ubuntu/bootcamp \
  nycdsa/mysql-movies-db
  ```
  
  - Windows

  ```
  docker run -it \
  -p 3306:3306 \
  -v %cd%:/home/ubuntu/bootcamp \
  nycdsa/mysql-movies-db
  ```
  
3. When the container is up, follow *step 3* and *step 4* from previous section to complete the database setup.
 

## MySQL Workbench Connection

1. Start MySQL Workbench and click the `+` sign next to *MySQL Connections* to open the Connection Tab, then fill in with the following information:
  - Connection Name: [anything]
  - Hostname: 127.0.0.1 [or docker-machine ip if using Docker Toolbox]
  - Port: 3306 [or 3307 if mapping was set to 3307]
  - Username: ubuntu

  ![mysql_connection](https://github.com/nycdatasci/bootcamp/blob/master/images/mysql_connection.png?raw=true)

2. Click *Test Connection* to test, then click *OK* to save. 
3. Click the connection that you just created to connect.
