# Introduction

Reseci is a product of the Innovation Challenge 2023 (Hackathon).
*Commits made after the 9th July, 2023 was not part of the Hackathon.*

The concept of the product is to allow only certain emails to schedule meetings with employees of an organisation. There are many endpoints available to carry out CRUD functions ranging from adding new staff to the organisatoin, to changing the application's settings. There is an accompanying frontend that allows users to see statistics and easily change settings within the application.

## Getting Started

### Running the application using Docker

1. `docker-compose up --build`

*Backend will be available at localhost:8000; frontend available at localhost:3000*

2. Create a Superuser so you can login to the server by running:

```bash
docker exec -it reseci_backend jsserv createsuperuser
```

3. You can then login to the server by running the following command on the docker container and using the credentials created in the previous step:

```bash
docker exec -it reseci_backend jsctl -m
$ login http://localhost:8000
```

4. Build your Jac application:

```bash
script scripts/build
script scripts/load
```

Your backend is now ready to accept requests.

## Build and Test

All 'walkers' are essentially api endpoints. To make a request to any of the endpoints, make a post request to http://locahost:8000/js/walker_run with your user token generated whenever you login to jsctl in step 3 above.

The body of the request will follow this format :

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

1. Expose public call back url.
2. Allow settings to have email templating options using variables.
