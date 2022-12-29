# How to Use Proteus

**Proteus** resides in project root, in `proteus` directory, therefore, **Proteus** should be accessed from root directory of this project (the directory where `proteus` directory exists). Please pass database configuration first (as specified in your Trytond's configuration file - see [example.cfg](../../tryton-suite/deploy/example.cfg). **Note**: database name should be written in db URL. Here's an example:


```python
>>> config = config.set_trytond('postgresql://tryton:tryton@localhost/trytondb')
>>> Module = Model.get('ir.module')
```

In this configuration, we use this URL: 

1.  `postgresql`: type of database
2.  first `tryton`: user name for the database
3.  second `tryton`: password for the database
4.  `localhost`: server location for the database
5.  `trytondb`: database name

**Next**: go to [**Proteus** documentation](https://docs.tryton.org/projects/client-library/en/latest/index.html).

