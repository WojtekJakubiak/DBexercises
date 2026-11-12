create table projekt(
id_projektu int auto_increment primary key,
nazwa_projektu varchar (150) not null,
data_rozpoczecia date not null,
data_zakonczenia date null);

ALTER TABLE projekt
ADD COLUMN menadzer_projektu INT,
ADD CONSTRAINT fk_menadzer_projektu 
    FOREIGN KEY (menadzer_projektu) REFERENCES pracownik(id_pracownika);

INSERT INTO projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu)
VALUES
    ('System rezerwacji online', '2026-01-15', '2026-06-30', 1),
    ('Aplikacja mobilna klienta', '2026-07-01', NULL, 2);

ALTER TABLE zadanie
ADD COLUMN projekt INT,
ADD CONSTRAINT fk_zadanie_projekt
    FOREIGN KEY (projekt) REFERENCES projekt(id_projektu)
    ON DELETE CASCADE;

UPDATE zadanie SET projekt = 1 WHERE id_zadania IN (1, 2);
UPDATE zadanie SET projekt = 2 WHERE id_zadania = 3;

select * from projekt;






CREATE TABLE sprint (
    id_sprintu INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numer_sprintu INT UNSIGNED,
    data_rozpoczecia DATE,
    data_zakonczenia DATE
);

ALTER TABLE zadania
ADD COLUMN sprint INT UNSIGNED NULL,
ADD CONSTRAINT fk_zadanie_sprint
    FOREIGN KEY (sprint) REFERENCES sprint(id_sprintu)
    ON DELETE SET NULL;

INSERT INTO sprint (numer_sprintu, data_rozpoczecia, data_zakonczenia)
VALUES (1, '2026-11-12', '2026-11-26');

UPDATE zadania
SET sprint = 1
WHERE id_zadania IN (1, 2);

select * from sprint


