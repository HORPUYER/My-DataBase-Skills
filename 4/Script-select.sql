select name , time from track
where time = (select MAX(time) from track);

select name from track 
where time > '00:03:30';

select name from collection
where year >= 2018 and year <= 2020;

select name from artist
where name not like '% %';

select name from artist
where name like '%мой%' or name like '%my%';

select id_genre, count(*) from genre_artist
group by id_genre 
order by id_genre;

SELECT a.name, COUNT(*) FROM album a 
JOIN track t ON t.id_alum = a.id
WHERE year IN (2019, 2020)
GROUP BY a.name;

select id_alum, AVG(time) avg_t from track
group by id_alum
order by avg_t;

select a.name from artist a 
left join artist_album aa on aa.id_artist = a.id 
left join album a2 on a2.id = aa.id_album 
where year != 2020;

select c.name from collection c
left join coll_track ct on ct.id_collection = c.id 
left join track t on ct.id_track = t.id 
left join album a2 on a2.id = t.id_alum 
left join artist_album aa on aa.id_album = a2.id 
left join artist a on a.id = aa.id_artist 
where a.name like 'Kino'
order by c.name;