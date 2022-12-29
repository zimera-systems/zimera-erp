# PostgreSQL Documentation

## Installation

PostgreSQL installation can be done using Linux package manager for your distro, or compile from source. There is no *best way* for installation method, it is all depends on your preference. As of us, in this documentation, we will install PostgreSQL from source code. 

**Assumption**: [Fish](https://fishshell.com/) is our preference for shell. If you use another shell, make some adjustments: usually - for this purpose - only on environment variable setting. In Fish: `set -x PATH $HOME/software/dbms/postgresql/bin $PATH`, while in Bash, use this: `export PATH $HOME/software/dbms/postgresql/bin:$PATH`. Other things are almost the same and will be notified if differences arise.

### Compilation

```
$ ./configure --prefix=/home/bpdp/software/dbms/postgresql-version
$ make # or "make world" if you want to render html dan man
$ make install
```

**Note**: *prefix* can be changed to suit your preference

### Create Env Variables File to be Sourced

_$HOME/env/postgresal_

```
cat postgresql 
set -x PATH $HOME/software/dbms/postgresql/bin $PATH
set -x LD_LIBRARY_PATH $HOME/software/dbms/postgresql/lib 
set -x PGDATA $HOME/software/dbms/postgresql-data

alias startpsql="pg_ctl -l logfile start"
alias stoppsql="pg_ctl stop" 
```

Then, type this inside a shell where you want to use PostgreSQL (one time only):

```
$ source ~/env/postgresql
```

## Preparation

These preparation steps are only done once, just to prepare PostgreSQL: database initialization.

```
$ mkdir ~/software/dbms/posgresql/data
$ initdb --pgdata ~/software/dbms/postgresql/data/

initdb: warning: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.
```

## Daily Activities

To start server:

```
$ pg_ctl -D /home/bpdp/software/dbms/postgresql/data/ -l logfile start
```

or (see env variable setting):

```
$ startpsql
```

To stop server:

```
$ pg_ctl stop -D ~/software/dbms/postgresql/data/
```

or (see env variable setting):

```
$ stoppsql
```

## User and Database

Create user:

```
$ createuser -d tryton -P 
Enter password for new role:
Enter it again:
$
```

**Note**: `-d` to enable access to create db, while -P is used to create password.

Create database (user *tryton* will create database *trytondb*):

```
$ createdb -U tryton trytondb
```

To test connection:

```
$ psql -U tryton trytondb -W
```
