# Django Enterprise Page (DEP)

Website of a company made with Django 3.2 and with Front-end 
design adapted to the theme "Start Bootstrap Business Casual".
The purpose of this project is to put into practice intermediate 
knowledge for the management of the Django web Framework.
The topics addressed in this project are:

- Postgres database connection
- Media and static file management
- Templating
- Mailing
- Docker and docker-compose

### Directory Tree ###

## Development ##

### How to run the project ###

The project use docker, so just run:

```
docker-compose up
```

> If it's first time, the images will be created. Sometimes the project doesn't run at first time because
> the init of postgres, just run again `docker-compose up` and it will work.

#### Tip ####

To remove the docker containers including database (Useful sometimes when dealing with migrations):

```
docker-compose down --volumes
```
 
And again run:

```
docker-compose up --build
```

CMS-CATO app will run in url `localhost:8100`

To recreate the docker images after dependencies changes run:

```
docker-compose up --build
```


### Accessing Administration

The django admin site of the CMS-CATO project can be accessed at `localhost:8100/admin`

By default the development configuration creates a superuser with the following
credentials:

```
Username: admin
Password: admin
```
