# movies_db


A sample database includes three tables: `actors`, `directors` and `movies`. The data is available as .csv files under directory `movies-data`

## Installation [with docker container]:

1. Start Docker container with port mapping `-p 3306:3306`:

  ```
  docker run -it --rm \
  -p 3306:3306 \
  nycdsa/linux-toolkits
  ```
  
  Note: if you have MySQL service running locally, you may need to change the port mapping to `-p 3307:3306`
  
2. Git clone the repository
3. Change directory to the repository
4. Run command:

  ```
  ./create_movies_db.sh
  ```

## MySQL Workbench Connection

1. Click the `+` sign and fill in with the following information:
  - Connection Name: [anything]
  - Hostname: 127.0.0.1 [or docker-machine ip if using Docker Toolbox]
  - Port: 3306 [or 3307 if mapping was set to 3307]
  - Username: ubuntu

2. Click *Test Connection* to test; click *OK* to save. 
3. Then click the connection to connect.
