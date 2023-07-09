# Introduction

This projects has two major components the backend built with jaseci and the frontend with remix. The main component is the backend . Through jaseci we are able to expose many apis that can carry out crud functionality and processes. All these Apis are avaliable to any user with the proper credientials.These apis allow for fine control of the application.
The main endpoint that will be hit when a email is received can be replicated by hitting the end point 'email_trigger'

# Getting Started

# How to run the application in docker

1. open a terminal in the root of the code directory.
2. Build the Image for the application by running :

```bash
docker build -t sbm -f Dockerfile .
```

3. Run the Image. This will start a jaseci server will all the AI modules loaded . You can check localhost:8000 to see if the container is running.

`Note : rename the container to sbm by using this command :

```bash
docker rename [container_id] sbm
```

5. Create a Superuser so you can login to the server by running :

```bash
docker exec -it [container ID] jsserv createsuperuser
```

4. You can then log in to the server by running the following command on the docker container :

```bash
docker exec -it sbm jsctl -m
```

This will launch a jaseci terminal .

5. Build you Jac Application and log in to your server :

```bash
script scripts/build
script scripts/load
```

This will get you server up and ready to make API calls.

# Run UI in Docker

1. cd in to frontend

2. Replace the enviroment variables with your server url and token .

3. Run this to build:

```bash
docker build -t remix -f remix.DockerFile .
```

4. Run this to start the container :

```bash
docker run -p 3000:30000 remix
```

# Build and Test

all `walkers` are essentially an api. To call any of the apis,
make a post request to http://locahost:8000/js/walker_run with your user token.

the body of the json body will follow this format :

```json
{
    "name_of_walker",
    "ctx" : {
        "attribute_1" : "value",
        "attribute_2" : "value"
    }
}
```

# Future work

1.Expose public call back url
