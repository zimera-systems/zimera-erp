# DB Dump for Tryton

This directory consists of two important database dump:

1.  [Vanilla DB](vanilla-db-before-tryton-app-init.sql): database after first creation. Username and password: admin:admin. Necessary prior to run Tryton for the first time.
2.  [DB after configuration](db-adter-tryton-app-init.sql): database after Tryton initialization. Consists of first core data: modules activated, party configuration, default party (company), money, country, user for party (company), and chart of accounts.
    *   Username: bpdp, pass: bpdpadmin123
    *   Company: zimeracorp - PT Zenit Merdeka Raya
    *   Modules: all modules
    *   Money: Rupiah
    *   Chart of accounts: minimal, default `Main Expense` for Expense account.
