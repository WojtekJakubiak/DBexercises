-- ZADANIE 1

create table pracownik(
    id_pracownika int auto_increment primary key,
    imie varchar(40) not null,
    nazwisko varchar(60) not null,
    data_urodzenia date not null
);

desc pracownik;

insert into pracownik
values
    (1,'jan','nowak','2000-10-11'),
    (2,'bartek','kleks','2007-02-24'),
    (3,'kim','le','2002-05-30');

select * from pracownik;

update pracownik
set data_urodzenia = '1996-10-11'
where id_pracownika = 1;

-- ZADANIE 2

create table zadania(
    id_zadania int auto_increment primary key,
    nazwa_zadania varchar(150) not null,
    priorytet enum('normalny','wysoki','niski'),
    opis text,
    id_pracownika int,
    foreign key(id_pracownika)
        references pracownik(id_pracownika)
        on delete set null
);

desc zadania;

alter table zadania
modify priorytet enum('normalny','wysoki','niski')
default 'normalny';

insert into zadania
    (id_zadania, nazwa_zadania, id_pracownika)
values
    (1,'zad1',1),
    (2,'zad2',2),
    (3,'zad3',3);

select * from zadania;

-- ZADANIE 3

create table projekt(
    id_projektu int auto_increment primary key,
    nazwa_projektu varchar(150) not null,
    data_rozpoczecia date not null,
    data_zakonczenia date null
);

alter table projekt
add column menadzer_projektu int,
add constraint fk_menadzer_projektu
    foreign key(menadzer_projektu)
    references pracownik(id_pracownika);

insert into projekt
    (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu)
values
    ('System rezerwacji online', '2026-01-15', '2026-06-30', 1),
    ('Aplikacja mobilna klienta', '2026-07-01', null, 2);

alter table zadania
add column projekt int,
add constraint fk_zadanie_projekt
    foreign key(projekt)
    references projekt(id_projektu)
    on delete cascade;

update zadania
set projekt = 1
where id_zadania in (1, 2);

update zadania
set projekt = 2
where id_zadania = 3;

select * from projekt;
select * from zadania;

-- ZADANIE 4


create table sprint(
    id_sprintu int unsigned auto_increment primary key,
    numer_sprintu int unsigned,
    data_rozpoczecia date,
    data_zakonczenia date
);

alter table zadania
add column sprint int unsigned null,
add constraint fk_zadanie_sprint
    foreign key(sprint)
    references sprint(id_sprintu)
    on delete set null;

insert into sprint
    (numer_sprintu, data_rozpoczecia, data_zakonczenia)
values
    (1, '2026-11-12', '2026-11-26');

update zadania
set sprint = 1
where id_zadania in (1, 2);

select * from sprint;
select * from zadania;


-- ZADANIE 5

create table status(
    id_statusu int auto_increment primary key,
    nazwa_statusu varchar(20) not null
);

insert into status
values
    (1,'nowe'),
    (2,'w trakcie'),
    (3,'zakonczone');

select * from status;



create table zadanie_status(
    id_zdarzenia int auto_increment primary key,
    id_zadania int,
    id_statusu int,
    data_zdarzenia datetime default current_timestamp,

    foreign key(id_zadania)
        references zadania(id_zadania),

    foreign key(id_statusu)
        references status(id_statusu)
);


insert into zadanie_status
values
    (1,1,1,default),
    (2,2,2,default),
    (3,3,3,default);

select * from zadanie_status;



select * from projekt;

select * from zadania
where projekt = 1;


delete from zadanie_status
where id_zadania in (
    select id_zadania
    from zadania
    where projekt = 1
);


delete from projekt
where id_projektu = 1;


select * from zadania;


alter table zadania
drop foreign key fk_zadanie_sprint;

drop table sprint;
