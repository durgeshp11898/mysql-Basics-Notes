show databases;
create database [dbname]
drop database [dbname]
use [dbname]

-- create table
create table [tablename](col1 colType(size) extra......);

-- show all tables
show tables 

-- describe the table
desc [tablename]

-- Table ALTER
-- add column
alter table [tablename]  ADD [column_name] datatype;

-- modify column
alter table [tablename] MODIFY [column_name] [newDataType];

-- rename column
alter table [tablename] RENAME COLUMN [oldcolname] TO [newcolname]

-- drop column
alter table [tablename] DROP COLUMN [colname]

--  insert data to table

insert into [tablename](cols) values (values);

-- update
update [tablename] set col1=value,col2=value,col3=value where id=12 ;

-- delete
delete from [tablename] where [colname]=?;

--order by

select * from [tablename] order by [colname] 

-- limit

-- offset

-- Alias
Funtions 
AVG- find the average
SUM-find the sum 
COUNT-count the rows






'',""
String Funtions

1. LENGTH(str)-find the length
        select LENGTH("Learn Code With Durgesh") as "Length";

2. CONCATE(str1,str2)-for concatination



3. LCASE(str) - to lowercase
    UCASE- to convert into uppercase


4. SUBSTRING(str,start,length)- extract part of the string 
     select SUBSTRING("learn code with durgesh",1,8);

5. TRIM(str)- removes leading and trailing spaces
     select TRIM("         LCWD    ");

6. REVERSE-reverse the string
    select REVERSE("LCWD");

7. STRCMP(string1,string2)-compares two  string

        If string1 = string2, this function returns 0
        If string1 < string2, this function returns -1
        If string1 > string2, this function returns 1

Other important functions

1. CURDATE() --return the current date
    select CURDATE();
    +------------+
    | CURDATE()  |
    +------------+
    | 2022-10-26 |
    +------------+
    YYYY-MM-DD

2. CURTIME()--return the current time
    select CURTIME();
    +-----------+
    | CURTIME() |
    +-----------+
    | 13:11:54  |
    +-----------+

3. NOW()-- return the current date and time
    select NOW();
    +---------------------+
    | NOW()               |
    +---------------------+
    | 2022-10-26 13:12:24 |
    +---------------------+

4.IF(test,yes,no) --- return yes if test true else no 
        select IF(4<5,"YES","NO");
        +--------------------+
        | IF(4<5,"YES","NO") |
        +--------------------+
        | YES                |
        +--------------------+
        1 row in set (0.00 sec)

        mysql> select IF(10<5,"YES","NO");
        +---------------------+
        | IF(10<5,"YES","NO") |
        +---------------------+
        | NO                  |
        +---------------------+

5.IFNULL(NULL,"Test"), --if null then TEST else value itself  

    select IFNULL(NULL,"lcwd.com");
    +-------------------------+
    | IFNULL(NULL,"lcwd.com") |
    +-------------------------+
    | lcwd.com                |
    +-------------------------+
    1 row in set (0.00 sec)

    mysql> select IFNULL("Tiger","lcwd.com");
    +----------------------------+
    | IFNULL("Tiger","lcwd.com") |
    +----------------------------+
    | Tiger                      |
    +----------------------------+
6.DATABSE()-- return the current database


7.VERSION()-- return the version of mysql databse

8.USER() -- return thecurrent user

    select DATABASE() "DB", VERSION() "VER",  USER() "USER";
    +-------------+--------+----------------+
    | DB          | VER    | USER           |
    +-------------+--------+----------------+
    | boot_course | 8.0.27 | root@localhost |
    +-------------+--------+----------------+
    1 row in set (0.00 sec)


    maths
    10 functions
    sin
    cos 
    tan 

-- IN
13,23,124
select * from students WHERE city IN("Mumbai","Delhi");
+-----+------------------+--------+------+
| id  | name             | city   | fees |
+-----+------------------+--------+------+
|  13 | Harsh Tiwari     | Mumbai | 3000 |
|  56 | Rahul Dravid     | Mumbai | 3000 |
|  67 | Virat Kohli      | Delhi  | 4000 |
| 124 | Sachin Tendulkar | Delhi  | 4000 |
+-----+------------------+--------+------+

-- LIKE 

wildcards:

    % =>represent, zero character or multiple characters

        select * from students WHERE name LIKE 'A%';
        +----+--------------------+---------+------+
        | id | name               | city    | fees |
        +----+--------------------+---------+------+
        | 12 | Ankit Kumar Tiwari | Lucknow | 3000 |
        | 23 | Ankit Kumar Tiwari | ABC     | 3000 |
        +----+--------------------+---------+------+

    

    _ =>represent single character

    select * from students WHERE name LIKE '_a%';
    +-----+------------------+--------+------+
    | id  | name             | city   | fees |
    +-----+------------------+--------+------+
    |  13 | Harsh Tiwari     | Mumbai | 3000 |
    |  56 | Rahul Dravid     | Mumbai | 3000 |
    | 124 | Sachin Tendulkar | Delhi  | 4000 |
    +-----+------------------+--------+------+


    select * from students WHERE name LIKE '%Kumar%';
    +----+--------------------+---------+------+
    | id | name               | city    | fees |
    +----+--------------------+---------+------+
    | 12 | Ankit Kumar Tiwari | Lucknow | 3000 |
    | 23 | Ankit Kumar Tiwari | ABC     | 3000 |
    +----+--------------------+---------+------+
    2 rows in set (0.00 sec)


-- Create Forign Key

--  While creating table


create table qualifications(
    qId int primary key auto_increment,
    pass_year varchar(4) not null,
    name varchar(500) not null,
    about varchar(100),
    sid int, 
    FOREIGN KEY (sid) REFERENCES students(id)

);

create table [laptops](lId int, model varchar(500) not null, price int,
    sid int,  FOREIGN KEY(sid) REFERENCES [main_students]([main_table_primary_key_id])
 );

 -- Constraints

 --add 
    ALTER TABLE [tablename] ADD FOREIGN KEY (this_col_name) REFERENCES [parent_table_name](parent_primary_key_col);

     ALTER TABLE [tablename] ADD CONSTRAINT FK_student252 FOREIGN KEY (this_col_name) REFERENCES [parent_table_name](parent_primary_key_col);


 --drop
    ALTER TABLE [tablename] DROP FOREIGN KEY [Constraint name];


--students , laptops

1. what columns 
    name ,city,model,price


SIMPLE JOIN:
    select students.name,students.city,laptops.model,laptops.price from students,laptops WHERE students.id=laptops.sid; 

-- ALIAS
    select s.name,s.city,l.model,l.price from students s,laptops l WHERE s.id=l.sid; 

INNER JOIN:

select s.name,s.city,l.model,l.price from students s INNER JOIN laptops l ON s.id=l.sid;


 
