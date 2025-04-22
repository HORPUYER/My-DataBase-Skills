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