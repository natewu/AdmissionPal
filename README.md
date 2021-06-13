# AdmissionPal

## MySQL Setup

To start the MySQL server, install MySQL 5 from https://dev.mysql.com/downloads/installer/ (click "Looking for previous GA versions" for MySQL 5).
The server should start automatically after installation on Windows, but if it doesn't, you can follow the instructions at https://dev.mysql.com/doc/refman/8.0/en/windows-start-service.html to make it start.

Then, run the MySQL Command Line Client (should be searchable in start menu) and run the following commands after logging in with the password you chose during installation:
```
CREATE DATABASE admissionpal_db;
USE admissionpal_db;
SOURCE C:/path/to/admissionpal_db.sql;
```
The file admissionpal_db.sql is located in AdmissionPal/site/admissionpal_db.sql .

For demonstration purposes, we are providing this SQL file hardcoded with values. 90% of these values were scraped and generated with code (you can see some of this code in the "Automated Database" folder), and in the future (when exporting a .sql file for judging convenience is not needed) we would like to automatically update a MySQL database every academic year with new info from the university websites.

### Why SQL?

We considered using JSON instead of an SQL database to organize our data because it's easier to start with, but we decided against doing so for a few reasons.
- SQL databases can organize our data much nicer (multiple tables, easily deletable categories)
- SQL already has great commands for requesting/adding data (already filtered when we get the data from our database)
- SQL makes it easier to edit large amounts of existing organized data

Overall, an SQL database is MUCH more scalable than JSON and would almost definitely be used in a final product of AdmissionPal