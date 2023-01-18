# Zimera ERP Documentation

## Prerequisites

Tryton - as well as Zimera ERP - needs some modules in Python installation. So, it is advised that [Miniconda](https://conda.io/miniconda.html) is used for environment and package management, do install Miniconda using the instruction from Miniconda website. Make sure that all of packages requirements are satisfied. From vanilla Miniconda installation, go to [Zimera ERP](../tryton-suite/) directory and install them using **pip**:

```
pip -r requirements.txt
```

## Database and User/Password Access

After configuratiion, create database user who will owns the database and the database as well. See also [installation and configuration of PostgreSQL](postgresql/) for more information.

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

Usually, at the end of vanilla database creation process, Tryton will asks for email and admin password:

```
"admin" email for "trytondb": bambangpdp@gmail.com
"admin" password for "trytondb": 
"admin" password confirmation: 
```

Just in case, the questions are not asked, we have to manually create them using the command to create password for super user administration:

```
$ python bin/trytond-admin -c deploy/example.cfg -d trytondb -p
"admin" password for "trytondb": 
"admin" password confirmation: 
$
```

**Note**: default username and password for Zimera ERP: **admin:admin**

## Configure **sao** Web Client

See [this guide](client-sao/) to instalal Node.js modules and Bower components.

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

## User Guide

For more information on how you can use Zimera ERP, see [User Guide](user-guide/)
