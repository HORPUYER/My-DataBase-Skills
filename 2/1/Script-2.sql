create table if not exists genre(
	id SERIAL primary key,
	name VARCHAR(100) not null
);

create table if not exists artist(
	id SERIAL primary key,
	name VARCHAR(100) not null
);

create table if not exists album(
	id SERIAL primary key,
	name VARCHAR(100) not null,
	year integer not null
);

create table if not exists track(
	id SERIAL primary key,
	name VARCHAR(100) not null,
	time TIME not null,
	id_alum integer not null references album(id)
);

create table if not exists genre_artist(
	id_genre INTEGER not null references genre(id),
	id_artist INTEGER not null references artist(id),
	constraint ge_ar primary key (id_genre, id_artist)
);

create table if not exists artist_album(
	id_artist INTEGER not null references artist(id),
	id_album INTEGER not null references album(id),
	constraint ar_al primary key (id_artist, id_album)
);

create table if not exists collection(
	id SERIAL primary key,
	name VARCHAR(100) not null,
	year INTEGER not null
);

CREATE TABLE IF NOT EXISTS album_track (
	id_track INTEGER references track(id),
	id_album INTEGER references album(id),
	constraint al_tr primary key (id_track, id_album)
);

CREATE TABLE IF NOT EXISTS coll_track (
	id_collection INTEGER references collection(id),
	id_track INTEGER references track(id),
	constraint col_tr primary key (id_collection, id_track)
);


insert into genre(name) values
('ROK'),
('HIP-HOP'),
('Jazz');

insert into artist(name) values
('Kino'),
('Splin'),
('Basta'),
('Skriptonit'),
('Louis Armstrong'),
('Skot Joplin');

insert into album (name, year) values
('Последний герой', 1989),
('Гранатовый альбом', 1998),
('Баста 3', 2010),
('Дом с нормальными явлениями', 2015),
('C`est si bon', 1991),
('Regtime', 1971);

insert into track (name, time, id_alum) values
('Перемен', '00:04:52', 1),
('Выхода нет', '00:03:47', 2),
('Урбан', '00:04:12', 3),
('Дома', '00:03:32', 4),
('Hello, Dolly!', '00:02:28', 5),
('Bethena', '00:06:06',  6);

insert into collection (name, year) values
('RUS_ROK', 2024),
('RUS_HIP-HOP', 2024),
('Juzz', 2024),
('Рекомендация', 2024);

insert into genre_artist(id_genre, id_artist) values
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6);

insert into artist_album(id_artist, id_album) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);

insert into coll_track(id_collection, id_track) values
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,1),
(4,3);