-- ZADANIE 1

alter table zadania
drop foreign key zadania_ibfk_1;

alter table projekt
drop foreign key fk_menadzer_projektu;

alter table pracownik
modify id_pracownika int not null;

alter table pracownik
drop primary key;


alter table pracownik
add primary key (id_pracownika);

alter table pracownik
modify id_pracownika int not null auto_increment;

alter table zadania
add constraint fk_zadania_pracownik
foreign key (id_pracownika)
references pracownik(id_pracownika)
on delete set null;


alter table projekt
add constraint fk_menadzer_projektu
foreign key (menadzer_projektu)
references pracownik(id_pracownika);

-- ZADANIE 2

alter table zadania
add column godziny_szacowane int default 8;



update zadania
set godziny_szacowane = 4
where id_zadania = 1;

update zadania
set godziny_szacowane = 12
where id_zadania = 2;

update zadania
set godziny_szacowane = 16
where id_zadania = 3;

select * from zadania;


alter table zadania
alter column godziny_szacowane set default 6;


insert into zadania (nazwa_zadania)
values ('zadanie testowe');

set @nowe_zadanie = last_insert_id();


select * from zadania
where id_zadania = @nowe_zadanie;


delete from zadania
where id_zadania = @nowe_zadanie;

-- ZADANIE 3


alter table projekt
add column opis_kratki varchar(50) null;

alter table projekt
modify opis_kratki varchar(200) null;


update projekt
set opis_kratki = 'MVP'
where id_projektu = 1;

update projekt
set opis_kratki = 'pilne wdrozenie'
where id_projektu = 2;

select * from projekt;


alter table projekt
drop column opis_kratki;

-- ZADANIE 4

alter table zadania
drop foreign key fk_zadanie_projekt;


alter table zadania
add constraint fk_zadanie_projekt
foreign key (projekt)
references projekt(id_projektu)
on delete set null;


set @projekt_do_usuniecia = (
    select max(id_projektu)
    from projekt
);


select * from projekt
where id_projektu = @projekt_do_usuniecia;

delete from projekt
where id_projektu = @projekt_do_usuniecia;

select * from zadania
where projekt is null;

