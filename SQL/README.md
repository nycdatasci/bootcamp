# Movies Database (movies_db)

A sample database includes three tables: `actors`, `directors` and `movies`. The data is available as .csv files under directory `movies-data`

## Installation:

1. Start Docker container with port mapping `-p 3306:3306`:

  - MAC/Linux/Docker ToolBox
  ```
  docker run -it \
  -p 3306:3306 \
  nycdsa/mysql-movies-db
  ```
  
  - Windows
  ```
  docker run -it ^
  -p 3306:3306 ^
  nycdsa/mysql-movies-db
  ```
  
  Note: if you have MySQL service running locally, the port 3306 might be occupied already and you should change the port mapping to a different one, for example, `-p 3307:3306`.

2. (Optional) If you need the csv files, you can clone the repo by running `git clone` command inside the docker container.
  
## Installation with shared folder:

If you have issue running `git clone` inside the docker container, you should download the repository on your host machine and mount it in your container:

1. `git clone` the repo to your computer first and then change your working directory to `bootcamp` directory.

2. Start docker container with mount option:
  
  - MAC/Linux/Docker ToolBox
  
  ```
  docker run -it \
  -p 3306:3306 \
  -v "$(pwd)":/home/ubuntu/bootcamp \
  nycdsa/mysql-movies-db
  ```
  
  - Windows

  ```
  docker run -it ^
  -p 3306:3306 ^
  -v %cd%:/home/ubuntu/bootcamp ^
  nycdsa/mysql-movies-db
  ```
  *Note*: if %cd% does not work for your windows machine, try to use the absolute directory. For example, `-v C:/User/nycdsa/bootcamp:/home/ubuntu/bootcamp`.

## MySQL Workbench Connection

1. Start MySQL Workbench and click the `+` sign next to *MySQL Connections* to open the Connection Tab, then fill in with the following information:
  - Connection Name: [anything]
  - Hostname: 127.0.0.1 [or docker-machine ip (default: 192.168.99.100) if using Docker Toolbox]
  - Port: 3306 [or 3307 if mapping was set to 3307]
  - Username: ubuntu

  ![mysql_connection](https://github.com/nycdatasci/bootcamp/blob/master/images/mysql_connection.png?raw=true)

2. Click *Test Connection* to test, then click *OK* to save. 
3. Click the connection that you just created to connect.
