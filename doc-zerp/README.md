# Zimera ERP Documentation

## Prerequisites

Tryton - as well as Zimera ERP - needs some modules in Python installation. So, it is advised that [Miniconda](https://conda.io/miniconda.html) is used for environment and package management, do install Miniconda using the instruction from Miniconda website. Make sure that all of packages requirements are satisfied. From vanilla Miniconda installation, go to [Zimera ERP](../tryton-suite/) directory and install them using **pip**:

```
pip -r requirements.txt
```

## Configuration

Configuration reside in file(s) inside [deploy](../tryton-suite/deploy/) directory.

## Run Zimera ERP

First, see `Configuration` above and complete yours, enter [tryton-suite](../tryton-suite/) directory and use this command to execute Tryton:

```
$ python bin/trytond -c config_file
```

See inside [deploy](../tryton-suite/deploy) directory for example of deployment configuration

## Proteus

If you want to use Proteus, see [Zimera ERP - Proteus Documentation](proteus/).

