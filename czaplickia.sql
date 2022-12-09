use czaplickia;
select * from zasob
;
select concat(k1.nazwa, ' - ', k2.nazwa) from kreatura k1 join kreatura k2 on k1.idKreatury=k2.idKreatury;
select k.rodzaj, sum(e.ilosc*z.waga) as waga_razem  from kreatura k join ekwipunek e on k.idKreatury=e.idKreatury join zasob z on e.idZasobu=z.idZasobu where k.rodzaj not in ('malpa' , 'waz' ) group by k.nazwa;
select k.rodzaj, sum(e.ilosc*z.waga)/count(distinct(k.nazwa)) as srednia_waga from kreatura k join ekwipunek e on k.idKreatury=e.idKreatury join zasob z on e.idZasobu=z.idZasobu where k.rodzaj not in ('malpa' , 'waz') group by k.rodzaj;
select k.nazwa from kreatura k where k.rodzaj='wiking' union select nazwa from kreatura k where k.rodzaj='wiking';
#lab 7
select * from wyprawa;
show create table uczestnicy;
select idKreatury from kreatura;
select id_uczestnika from uczestnicy;
select * from kreatura k left join uczestnicy u on u.id_uczestnika=k.idKreatury where u.id_uczestnika is null;
select w.nazwa, sum(e.ilosc) from wyprawa w inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy inner join ekwipunek e on u.id_uczestnika=e.idKreatury group by w.id_wyprawy;