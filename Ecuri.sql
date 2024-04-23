Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 205
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database Ecuri;
Query OK, 1 row affected (0.01 sec)


mysql> use Ecuri;
Database changed
mysql> create table Personne(
    -> Id_personne int primary key ,
    -> nom_p varchar(40),
    -> prenom_p varchar(40),
    -> tele_p int ,
    -> adress_p varchar(40),
    -> fonction varchar(40),
    -> Id_personne_sup int );
Query OK, 0 rows affected (0.05 sec)

mysql> desc Personne ;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| Id_personne     | int         | NO   | PRI | NULL    |       |
| nom_p           | varchar(40) | YES  |     | NULL    |       |
| prenom_p        | varchar(40) | YES  |     | NULL    |       |
| tele_p          | int         | YES  |     | NULL    |       |
| adress_p        | varchar(40) | YES  |     | NULL    |       |
| fonction        | varchar(40) | YES  |     | NULL    |       |
| Id_personne_sup | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> create table cheval (
    -> id_cheval int primary key,
    -> nom_cheval varchar(40),
    -> num_tatto int ,
    -> color_cheval varchar(40),
    -> num_cheval_mere int ,
    -> num_cheval_pere int ,
    -> nom_race varchar(40) ,
    -> num_personne_eleveur int );
Query OK, 0 rows affected (0.03 sec)

mysql> desc cheval;
+----------------------+-------------+------+-----+---------+-------+
| Field                | Type        | Null | Key | Default | Extra |
+----------------------+-------------+------+-----+---------+-------+
| id_cheval            | int         | NO   | PRI | NULL    |       |
| nom_cheval           | varchar(40) | YES  |     | NULL    |       |
| num_tatto            | int         | YES  |     | NULL    |       |
| color_cheval         | varchar(40) | YES  |     | NULL    |       |
| num_cheval_mere      | int         | YES  |     | NULL    |       |
| num_cheval_pere      | int         | YES  |     | NULL    |       |
| nom_race             | varchar(40) | YES  |     | NULL    |       |
| num_personne_eleveur | int         | YES  |     | NULL    |       |
+----------------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> create table proprietaire (
    ->  id_propr int ,
    ->  id_cheval int ,
    -> prix_achat float,
    -> date_propr date ,
    -> primary key (id_propr, id_cheval) );
Query OK, 0 rows affected (0.03 sec)

mysql> desc proprietaire ;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| id_propr   | int   | NO   | PRI | NULL    |       |
| id_cheval  | int   | NO   | PRI | NULL    |       |
| prix_achat | float | YES  |     | NULL    |       |
| date_propr | date  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table Concour (
    -> nom_con  varchar(40),
    -> Anne_concour year ,
    -> nbr_pp int ,
    -> place varchar(20) ,
    -> primary key (nom_con,Anne_concour) );
Query OK, 0 rows affected (0.03 sec)

mysql> desc Concour;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| nom_con      | varchar(40) | NO   | PRI | NULL    |       |
| Anne_concour | year        | NO   | PRI | NULL    |       |
| nbr_pp       | int         | YES  |     | NULL    |       |
| place        | varchar(20) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table participation (
    ->  id_cheval int ,
    ->  nom_con varchar(40),
    ->  Anne_concour year,
    ->  score int ,
    ->  primary key (id_cheval,nom_con,Anne_concour)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc participation;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| id_cheval    | int         | NO   | PRI | NULL    |       |
| nom_con      | varchar(40) | NO   | PRI | NULL    |       |
| Anne_concour | year        | NO   | PRI | NULL    |       |
| score        | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> show tables;
+-----------------+
| Tables_in_ecuri |
+-----------------+
| cheval          |
| concour         |
| participation   |
| personne        |
| proprietaire    |
+-----------------+
5 rows in set (0.00 sec)

mysql> create table Croissance (
    -> ID_Croissance int primary key ,
    -> Mois int ,
    -> Taille_Croi float,
    -> Poids_Croi float,
    -> id_cheval int ,
    -> foreign key (id_cheval) references cheval (id_cheval)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc Croissance;
+---------------+-------+------+-----+---------+-------+
| Field         | Type  | Null | Key | Default | Extra |
+---------------+-------+------+-----+---------+-------+
| ID_Croissance | int   | NO   | PRI | NULL    |       |
| Mois          | int   | YES  |     | NULL    |       |
| Taille_Croi   | float | YES  |     | NULL    |       |
| Poids_Croi    | float | YES  |     | NULL    |       |
| id_cheval     | int   | YES  | MUL | NULL    |       |
+---------------+-------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> create table Race (
    -> nom_race varchar(40) primary key ,
    -> Poids_Type float ,
    -> Taille_Type float
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc Race;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| nom_race    | varchar(40) | NO   | PRI | NULL    |       |
| Poids_Type  | float       | YES  |     | NULL    |       |
| Taille_Type | float       | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

alter table personne
    -> add foreign key (Id_personne_sup) references personne (Id_personne);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc personne;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| Id_personne     | int         | NO   | PRI | NULL    |       |
| nom_p           | varchar(40) | YES  |     | NULL    |       |
| prenom_p        | varchar(40) | YES  |     | NULL    |       |
| tele_p          | int         | YES  |     | NULL    |       |
| adress_p        | varchar(40) | YES  |     | NULL    |       |
| fonction        | varchar(40) | YES  |     | NULL    |       |
| Id_personne_sup | int         | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table cheval
    -> add foreign key (num_cheval_mere) references cheval (id_cheval),
    -> add foreign key (num_cheval_pere) references cheval (id_cheval),
    -> add foreign key (nom_race) references Race (nom_race),
    -> add foreign key (num_personne_eleveur) references personne (Id_personne);

desc cheval;
+----------------------+-------------+------+-----+---------+-------+
| Field                | Type        | Null | Key | Default | Extra |
+----------------------+-------------+------+-----+---------+-------+
| id_cheval            | int         | NO   | PRI | NULL    |       |
| nom_cheval           | varchar(40) | YES  |     | NULL    |       |
| num_tatto            | int         | YES  |     | NULL    |       |
| color_cheval         | varchar(40) | YES  |     | NULL    |       |
| num_cheval_mere      | int         | YES  | MUL | NULL    |       |
| num_cheval_pere      | int         | YES  | MUL | NULL    |       |
| nom_race             | varchar(40) | YES  | MUL | NULL    |       |
| num_personne_eleveur | int         | YES  | MUL | NULL    |       |
+----------------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> desc  proprietaire;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| id_propr   | int   | NO   | PRI | NULL    |       |
| id_cheval  | int   | NO   | PRI | NULL    |       |
| prix_achat | float | YES  |     | NULL    |       |
| date_propr | date  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table proprietaire
    -> add foreign key (id_cheval) references cheval (id_cheval);
    -> add foreign key (nom_con,Anne_concour) references concour (nom_con,A
nne_concour);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table proprietaire
    -> add foreign key (id_propr) references personne (Id_personne);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

 mysql> insert into personne values
    -> (1, 'wissal','loutfi', '0612345168','agadir','directrice',null),
    -> (2, 'farah','saiza', '0624251683','marrakech','caissiare',2),
    -> (3, 'marieme','amzil', '0745224468','tanger','eleveur',3),
    ->  (4, 'kebbour','lfatmi', '0648771444','marrakech','proprietaire',4);
                                                                          Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from personne;
+-------------+---------+----------+-----------+-----------+--------------+-----------------+
| Id_personne | nom_p   | prenom_p | tele_p    | adress_p  | fonction     | Id_personne_sup |
+-------------+---------+----------+-----------+-----------+--------------+-----------------+
|           1 | wissal  | loutfi   | 612345168 | agadir    | directrice   |            NULL |
|           2 | farah   | saiza    | 624251683 | marrakech | caissiare    |               2 |
|           3 | marieme | amzil    | 745224468 | tanger    | eleveur      |               3 |
|           4 | kebbour | lfatmi   | 648771444 | marrakech | proprietaire |               4 |
+-------------+---------+----------+-----------+-----------+--------------+-----------------+
4 rows in set (0.00 sec)

mysql> insert into Race values
    ->  ('Arabian',100.0,1.6),
    -> ('Mustang',120.0,1.8),
    -> ('Andalou',130.0,1.7);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from Race;
+----------+------------+-------------+
| nom_race | Poids_Type | Taille_Type |
+----------+------------+-------------+
| Andalou  |        130 |         1.7 |
| Arabian  |        100 |         1.6 |
| Mustang  |        120 |         1.8 |
+----------+------------+-------------+
3 rows in set (0.00 sec)

mysql> insert into cheval values
    -> (1,'Bavan',12,'white',1,1,'Arabian',3),
    -> (2,'cisco',32,'brown',3,2,'Mustang',2),
    -> (3,'picola',57,'black',4,3,'Andalou',1),
    -> (4,'chivay',94,'brown',2,3,'Arabian',4);
Query OK, 1 row affected (0.01 sec)

mysql> select * from cheval;
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
| id_cheval | nom_cheval | num_tatto | color_cheval | num_cheval_mere | num_cheval_pere | nom_race | num_personne_eleveur |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
|         1 | Bavan      |        12 | white        |               1 |               1 | Arabian  |                    3 |
|         2 | cisco      |        32 | brown        |               1 |               2 | Mustang  |
                    2 |
|         3 | picola     |        57 | black        |               2 |               3 | Andalou  |                    1 |
|         4 | chivay     |        94 | brown        |               2 |               3 | Arabian  |
                    4 |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
4 rows in set (0.00 sec)


mysql> insert into proprietaire values
    -> (2,1,10000,20190111);
    -> (1,2,20500,20201122),
    ->  (3,3,30400,20230313),
    -> (4,4,45000,20000414);
Query OK, 4 rows affected (0.01 sec)
Records: 4 Duplicates: 0  Warnings: 0

mysql> select * from proprietaire;
+----------+-----------+------------+------------+
| id_propr | id_cheval | prix_achat | date_propr |
+----------+-----------+------------+------------+
|        1 |         2 |      20500 | 2020-11-22 |
|        2 |         1 |      10000 | 2019-01-11 |
|        3 |         3 |      30400 | 2023-03-13 |
|        4 |         4 |      45000 | 2000-04-14 |
+----------+-----------+------------+------------+
4 rows in set (0.00 sec)


mysql> insert into concour values
    -> ('DRESSAGE',2022,10,'RABTA'),
    ->  ('JUMPING',2024,20,'CASA'),
    -> ('Rodeo Show',2000,30,'KECH'),
    -> ('Cross Country Event',2019,40,'AGADIR');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from concour;
+---------------------+--------------+--------+--------+
| nom_con             | Anne_concour | nbr_pp | place  |
+---------------------+--------------+--------+--------+
| Cross Country Event |         2019 |     40 | AGADIR |
| DRESSAGE            |         2022 |     10 | RABTA  |
| JUMPING             |         2024 |     20 | CASA   |
| Rodeo Show          |         2000 |     30 | KECH   |
+---------------------+--------------+--------+--------+
4 rows in set (0.00 sec)

mysql> insert into participation values
    -> (1,'JUMPING', 2024, 80),
    -> (2, 'DRESSAGE', 2022, 95),
    -> (3, 'Cross Country Event', 2019, 75),
    -> (4, 'Rodeo Show', 2000, 85);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from  participation;
+-----------+---------------------+--------------+-------+
| id_cheval | nom_con             | Anne_concour | score |
+-----------+---------------------+--------------+-------+
|         1 | JUMPING             |         2024 |    80 |
|         2 | DRESSAGE            |         2022 |    95 |
|         3 | Cross Country Event |         2019 |    75 |
|         4 | Rodeo Show          |         2000 |    85 |
+-----------+---------------------+--------------+-------+
4 rows in set (0.00 sec)

mysql> insert into Croissance values
    -> (1, 1, 140.5, 300, 1),
    -> (2, 2, 142, 305, 1),
    -> (3, 3, 144, 310, 1),
    -> (4, 1, 130, 280, 2);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Croissance;
+---------------+------+-------------+------------+-----------+
| ID_Croissance | Mois | Taille_Croi | Poids_Croi | id_cheval |
+---------------+------+-------------+------------+-----------+
|             1 |    1 |       140.5 |        300 |         1 |
|             2 |    2 |         142 |        305 |         1 |
|             3 |    3 |         144 |        310 |         1 |
|             4 |    1 |         130 |        280 |         2 |
+---------------+------+-------------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from cheval where nom_race = 'Arabian'
    -> order by nom_cheval DESC;
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
| id_cheval | nom_cheval | num_tatto | color_cheval | num_cheval_mere | num_cheval_pere | nom_race | num_personne_eleveur |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
|         4 | chivay     |        94 | brown        |               2 |               3 | Arabian  |                    4 |
|         1 | Bavan      |        12 | white        |               1 |               1 | Arabian  |                    3 |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
2 rows in set (0.00 sec) 

mysql> select * from Race
    ->  where nom_race = 'Arabian';
+----------+------------+-------------+
| nom_race | Poids_Type | Taille_Type |
+----------+------------+-------------+
| Arabian  |        100 |         1.6 |
+----------+------------+-------------+
1 row in set (0.00 sec)



mysql> select nom_p,prenom_p from personne
    -> where Id_personne_sup is null;
+--------+----------+
| nom_p  | prenom_p |
+--------+----------+
| wissal | loutfi   |
+--------+----------+
1 row in set (0.00 sec)

mysql> select nom_p,prenom_p from personne
    -> where fonction = 'directrice';
+--------+----------+
| nom_p  | prenom_p |
+--------+----------+
| wissal | loutfi   |
+--------+----------+
1 row in set (0.00 sec)


mysql> select nom_con from concour
    -> where  Anne_concour = '2019';
+---------------------+
| nom_con             |
+---------------------+
| Cross Country Event |
+---------------------+
1 row in set (0.00 sec)


/*---SQL EX 9 ---*/

mysql> select * from cheval where color_cheval = 'black';
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
| id_cheval | nom_cheval | num_tatto | color_cheval | num_cheval_mere | num_cheval_pere | nom_race | num_personne_eleveur |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
|         3 | picola     |        57 | black        |               2 |               3 | Andalou  |                    1 |
+-----------+------------+-----------+--------------+-----------------+-----------------+----------+----------------------+
1 row in set (0.00 sec)



mysql> SELECT COUNT(*) AS nombre_chevaux_noirs
    -> FROM cheval WHERE color_cheval = 'black';
+----------------------+
| nombre_chevaux_noirs |
+----------------------+
|                    1 |
+----------------------+
1 row in set (0.00 sec)


mysql> select nom_race,  COUNT('Arabian') AS nbr_cheval_Arabe
    -> FROM cheval WHERE nom_race = 'Arabian';
+----------+------------------+
| nom_race | nbr_cheval_Arabe |
+----------+------------------+
| Arabian  |              2   |
+----------+------------------+
1 row in set (0.00 sec)

mysql> select id_cheval ,  nom_cheval from cheval where  num_tatto =  12;
+-----------+------------+
| id_cheval | nom_cheval |
+-----------+------------+
|         1 | Bavan      |
+-----------+------------+
1 row in set (0.00 sec)

mysql> select nom_con,  COUNT('Cross Country Event') AS nbr_concour
    -> FROM participation WHERE nom_con = 'Cross Country Event';
+---------------------+-------------+
| nom_con             | nbr_concour |
+---------------------+-------------+
| Cross Country Event |           1 |
+---------------------+-------------+
1 row in set (0.00 sec)

mysql> select  id_cheval from participation
    -> where Anne_concour = 2022;
+-----------+
| id_cheval |
+-----------+
|         2 |
+-----------+
1 row in set (0.00 sec)

mysql> select * from personne
    -> where fonction = "directrice";
+-------------+--------+----------+-----------+----------+------------+-----------------+
| Id_personne | nom_p  | prenom_p | tele_p    | adress_p | fonction   | Id_personne_sup |
+-------------+--------+----------+-----------+----------+------------+-----------------+
|           1 | wissal | loutfi   | 612345168 | agadir   | directrice |
 NULL |
+-------------+--------+----------+-----------+----------+------------+-----------------+
1 row in set (0.00 sec)

mysql> select COUNT(*) AS nbr_proprietaire from proprietaire ;
+------------------+
| nbr_proprietaire |
+------------------+
|                5 |
+------------------+
1 row in set (0.02 sec)

mysql> select COUNT(*) AS nbr_ACHETE from proprietaire
    -> where id_propr = 1 and date_propr = '2020-11-22';
+------------+
| nbr_ACHETE |
+------------+
|          1 |
+------------+
1 row in set (0.00 sec)

mysql> select prix_achat from proprietaire
    -> where id_propr = 1 and date_propr = '2020-11-22';
+------------+
| prix_achat |
+------------+
|      20500 |
+------------+
1 row in set (0.00 sec)

