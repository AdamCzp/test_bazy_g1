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
#lab 5 i 6
use wikingowie;
select * from zasob where waga >=2 and waga <=5;
select * from kreatura where rodzaj='wiedzma' and udzwig<=70 and udzwig >=30 and nazwa='%or%';
select * from zasob;
select * from zasob where month(dataPozyskania) = '07' or month(dataPozyskania) = '07';
select * from zasob where rodzaj is not null order by waga;
select * from kreatura order by dataUr asc limit 5;
select distinct rodzaj from zasob;
show create table zasob;
select CONCAT (nazwa, ' ' , rodzaj) as nazwaRodzaj from kreatura where rodzaj like 'Wi%';
select * ,(ilosc*waga) from zasob where year (dataPozyskania) between '2000' and '2007';
select * ,(ilosc*waga)*0.7 as waga_netto, (ilosc*waga)*0.3 as odpadki from zasob; 
select * ,(ilosc*waga)*0.7 as waga_netto, (ilosc*waga)*0.3 as odpadki from zasob where rodzaj='jedzenie';
select distinct rodzaj from zasob where nazwa lIKE 'Ba%' or nazwa LIKE '%os' order by nazwa;
select avg(waga) from kreatura where rodzaj='wiking';
select avg(waga),count(*) from kreatura group by rodzaj;
select avg(year(dataUr)) from kreatura group by rodzaj;
select sum(waga*ilosc) from zasob group by rodzaj;
# having filtr dla kolumn agregowanych po wybraniu potrzebnych danych
select nazwa , avg(waga) from zasob where ilosc >= 4 group by nazwa having avg(waga) > 10;
select nazwa, count(distinct nazwa) from zasob group by rodzaj having count(distinct nazwa) >1;
select * from kreatura inner join ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury;
select * from kreatura k left join ekwipunek e on k.idKreatury=e.idKreatury;
;
Select w.nazwa,
count(u.id_uczestnika),
group_concat(k.nazwa)
from wyprawa w
join uczestnicy u on u.id_wyprawy=w.id_wyprawy
join kreatura k on k.id_Kreatury=u.id_uczestnika
group by w.id_wyprawy;



select w.nazwa, k.nazwa as kierownik, ew.kolejnosc, s.nazwa
from etapy_wyprawy ew
join sektor s on ew.sektor=s.id_sektora
join wyprawa w on w.id_wyprawy=ew.idWyprawy
join kreatura k on k.idKreatury=w.kierownik
order by w.data_rozpoczecia desc, ew.kolejnosc asc;

select count(id_sektora) from sektor;
select count(distinct sektor) from etapy_wyprawy;


select nazwa, ifnull(waga, 'bez wagi') from kreatura;

select nazwa, if(waga is null, 'bez wagi', waga) from kreatura;

select count(idEtapu) as iloscOdwiedzin, sektor.nazwa from sektor
left join etapy_wyprawy on sektor.id_sektora = etapy_wyprawy.sektor 
group by id_sektora;

select if(count(id_wyprawy)=0,'nie bral' , 'bral') as czyBral,
kreatura.nazwa from kreatura
left join uczestnicy on uczestnicy.id_uczestnika=kreatura.idKreatury
group by kreatura.idKreatury;



























