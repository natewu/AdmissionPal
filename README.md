![image](https://user-images.githubusercontent.com/20260142/121823082-271beb80-cc60-11eb-929d-bd763ecad60b.png)
<p align="center">
  <strong>Admission information for Albertans has never been easier 🎓</strong>
</p>

### How do you use Admission Pal? 
Upon opening the page, it will ask what universities you are interested in, where you can list as many as you like or select the entire catalog. After you type in the majors that you are interested in viewing, the result will display a grid of the university information database to you. You are able to organize the data in different orders, such as the costs of tuition, or the average grade for the major. The website also fetches the required courses needed in order to pursue the major. 

![unknown](https://user-images.githubusercontent.com/74692833/121824060-8846bd80-cc66-11eb-944a-2df01d897c1e.png)

### Where is the Data From?
Some of our more detailed information was hand-selected, but much was also scraped from various websites. Web scraping allows our site to be up to date with other universities without the need of maintenance costs. The sites which were used in order to retrieve most of our data can be found: 
- https://uwaterloo.ca/future-students/admissions/admission-requirements
- https://www.macleans.ca/hub/education-hub/

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

In AdmissionPal/server/backend/db.js, change the password on line 7

```password: process.env.REACT_APP_SQL_PASS```

to the password you set when you installed MySQL.

Finally, open the file C:/Program Files/MySQL/MySQL Server 5.5/my.ini and change both lines of "port=3306" to "port=3300".

For demonstration purposes, we are providing this SQL file hardcoded with values. 90% of these values were scraped and generated with code (you can see some of this code in the "Automated Database" folder), and in the future (when exporting a .sql file for judging convenience is not needed) we would like to automatically update a MySQL database every academic year with new info from the university websites.

### Why SQL?

We considered using JSON instead of an SQL database to organize our data because it's easier to start with, but we decided against doing so for a few reasons.
- SQL databases can organize our data much nicer (multiple tables, easily deletable categories)
- SQL already has great commands for requesting/adding data (already filtered when we get the data from our database)
- SQL makes it easier to edit large amounts of existing organized data

Overall, an SQL database is MUCH more scalable than JSON and would almost definitely be used in a final product of AdmissionPal

## Node setup

Install node.js (LTS release) from https://nodejs.org/en/ with all packages and three command lines
- One command line in AdmissionPal
- One in AdmissionPal/server
- One in AdmissionPal/site

In AdmissionPal/server and AdmissionPal/site, run the command

```npm i```

In AdmissionPal, run the command

```npm i nodemon -g```

Finally, in AdmissionPal/server run the command

```npm start```


VOILA! AdmissionPal should be running. We're sorry that you had to set this up yourself, however we did not have credit cards to give website hosts that work for free/cheap with node.js, react, and MySQL :)
