# Zimera ERP

Zimera ERP is a customized instance of [Tryton](https://tryton.org) ERP software. It is not a fork of Tryton, instead it is Tryton instance which should be executed from source (not need to install Zimera ERP using **pip**). 

## Features

Zimera ERP is not a fork of Tryton, therefore it is very much the same with Tryton. See Tryton website for more information about Tryton features.

## Why?

Previously, we usually use **pip** to install Tryton (`trytond`, `all trytond modules`, `proteus`, `relatorio`, and `tryton`) and `sao` (web client for Tryton - JavaScript, should be installed using `npm` from Node.js). Using those approaches, all components of Tryton will be installed into Python's site-packages (for trytond and all Tryton's modules) and wherever we want to put `sao`. The problem is, when we want to develop and test Tryton's module(s), we have to put the module into `trytond/modules` directory. That way, we have to create a package first so that the package can be installed into Tryton's modules directory.

Other thing is, localization can be problematic if we want to use language file (.po): we have to edit the file and then put that file inside `locale` directory, create the package, and the install them using **pip**. It is easier, if we just copy `.po` into `trytond/modules/modulename/locale`.

## Module

Just put module into `trytond/modules`.

## Localization

The primary documentation for localization is available at  https://docs.tryton.org/projects/server/en/latest/topics/translation.html. If you want to create / edit .po file, just create / edit and then copy that file (.po) into `trytond/modules/modulename/locale`.

## Tryton Version

We track latest Tryton version (include all Tryton's modules and sao). Whenever a new release available, we make some adjustment into Zimera ERP. 

## Configuration

Configuration reside in file(s) inside [deploy](tryton-suite/zerp/deploy/) directory. 

## Run Zimera ERP

Enter [tryton-suite](tryton-suite/) directory and use this command to exectute Tryton:

```
$ python bin/trytond -c config_file
```

See inside [deploy](tryton-suite/zerp/deploy) directory for example of deployment configuration

