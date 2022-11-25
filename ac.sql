use czaplickia;
select * from postac where nazwa !='Bjorn' and rodzaj-'wiking'  Order by data_ur;
# zadanie 1
# lab 4 zadanie 1a
select * from postac;
# lab 4 zadanie 1b
alter table postac drop primary key ;
alter table przetwory drop foreign key przetwory_ibfk_2;
show create table przetwory;
select * from postac;
alter table walizka drop foreign key walizka_ibfk_1;
alter table postac modify id_postaci int;
alter table postac drop primary key;
# lab 4 zad 2 a
alter table postac add column pesel char(11) first ;
alter table postac add primary key(pesel);
update postac set pesel=0;
update postac set pesel='7464' + id_postaci;
show create table postac;
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');
select*from postac;
insert	into postac(pesel, id_postaci, nazwa, rodzaj , data_ur ,wiek) values(74672,9,'Gertruda Nieszczara','syrena','2001-10-10','21');
# lab 4 zad 3
update postac set statek='1' where nazwa like '%a%';
update statek set max_ladownosc=max_ladownosc*0.7 where data_wodowania >='1901-01-01' and data_wodowania <='200-12-31';
select*from statek;
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena','waz');
use czaplicka;
select *from postac;
insert into postac values('7473' , '10' , 'Loko' , 'waz' , '2022-11-25' , '1', null , null );
create table marynarz select * from postac;
select * from marynarz;
delete from marynarz where nazwa='Loko';
show create table postac;
Alter table marynarz ADD primary key(pesel);
update marynarz set statek=null;
delete from marynarz where nazwa='Wiking3';
select * from statek;
select * from postac;
Alter table postac drop column statek;
drop table statek;
use czaplickia;
#lab 4 zad 1
use wikingowie;
select * from zasob;
select * from zasob where rodzaj='jedzenie';
select idZasobu from zasob where idZasobu=1 or idZasobu=3 or idZasobu=5;
select * from kreatura;
select * from kreatura where rodzaj='wiedzma' and udzwig<=50;




















