create table infs_jakubiakw.CLIENT like company_2025.CLIENT;

insert into infs_jakubiakw.CLIENT  select * from company_2025.CLIENT;

select * from CLIENT;

create table infs_jakubiakw.EMPLOYEE like company_2025.EMPLOYEE;
insert into infs_jakubiakw.EMPLOYEE  select * from company_2025.EMPLOYEE;

create table infs_jakubiakw.ORDER like company_2025.ORDER;
insert into infs_jakubiakw.ORDER  select * from company_2025.ORDER;

select * from infs_jakubiakw.ORDER where ORDER_STATUS = 5;

select ORDER_ID, ORDER_STATUS from infs_jakubiakw.ORDER WHERE ORDER_STATUS in (1,3,5);

-- zad2

select 	FIRST_NAME,pensja from infs_jakubiakw.EMPLOYEE where FIRST_NAME ="Agnieszka" and pensja = 3900;

select EMPLOYEE_NAME from infs_jakubiakw.EMPLOYEE where	pensja between 5000 and 7000;

select CLIENT_ID from CLIENT where SHORT_NAME like "%eco%" and  is_company = 1;

-- zad 3

select * from infs_jakubiakw.ORDER;
select ORDER_ID from infs_jakubiakw.ORDER where month(ORDER_DATE) in (6,7);

SELECT * FROM infs_jakubiakw.CLIENT WHERE TAX_IDENTIFIER IS NOT NULL ORDER BY SHORT_NAME ASC;

SELECT * FROM infs_jakubiakw.EMPLOYEE ORDER BY BIRTH_DATE ASC LIMIT 5;

-- zad 4

SELECT DISTINCT FIRST_NAME FROM infs_jakubiakw.EMPLOYEE;

SELECT FIRST_NAME,LAST_NAME FROM infs_jakubiakw.EMPLOYEE WHERE LAST_NAME LIKE 'Ko%';

SELECT LAST_NAME, pensja FROM infs_jakubiakw.EMPLOYEE WHERE YEAR(DATE_OF_EMPLOYMENT) BETWEEN 2010 AND 2014;

-- zad 5 

SELECT * FROM infs_jakubiakw.CLIENT WHERE TAX_IDENTIFIER IS NULL;

SELECT SHORT_NAME FROM infs_jakubiakw.CLIENT WHERE SHORT_NAME LIKE 'K%' OR SHORT_NAME LIKE '%ski' ORDER BY SHORT_NAME DESC;
