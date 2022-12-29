# Zimera ERP Documentation

## Prerequisites

Tryton - as well as Zimera ERP - needs some modules in Python installation. So, it is advised that [Miniconda](https://conda.io/miniconda.html) is used for environment and package management, do install Miniconda using the instruction from Miniconda website. Make sure that all of packages requirements are satisfied. From vanilla Miniconda installation, go to [Zimera ERP](../tryton-suite/) directory and install them using **pip**:

```
pip -r requirements.txt
```

## Database and User/Password Access

After configuratiion, create database user who will owns the database and the database as well.

Create user:

```
$ createuser -d tryton -P
```

Create database:

```
$ createdb -U tryton trytondb
```

`trytondb` is database name while `tryton` is user who owns the database.

Next, populate tables into the vanilla database which has just been created above:

```
$ python bin/trytond-admin -c deploy/example.cfg -d trytondb --all
```

Create user name and password for super user administration:

```
$ python bin/trytond-admin -c deploy/example.cfg -d trytondb -p
"admin" password for "trytondb": 
"admin" password confirmation: 
$
```

**Note**: default username and password for Zimera ERP: **admin:admin**

## Configuration

Configuration reside in file(s) inside [deploy](../tryton-suite/deploy/) directory. Set database using the information above.


## Run Zimera ERP

First, see `Configuration` above and complete yours, enter [tryton-suite](../tryton-suite/) directory and use this command to execute Tryton:

```
$ python bin/trytond -c config_file
```

See inside [deploy](../tryton-suite/deploy) directory for example of deployment configuration

## Proteus

If you want to use Proteus, see [Zimera ERP - Proteus Documentation](proteus/).
