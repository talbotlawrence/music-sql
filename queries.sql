select * from genre;

INSERT INTO genre
 SELECT null, 'Country'
UNION ALL SELECT null, 'Blue'
UNION ALL SELECT null, 'Pop'
UNION ALL SELECT null, 'Rap'

insert into artist values (null, 'The Beatles');
select * from artist;

insert into album 
SELECT null, 'Rubber Soul'
UNION ALL SELECT null, 'Revolver'
UNION ALL SELECT null, 'Abbey Road'
UNION ALL SELECT null, 'Let It Be'

insert into album values (null, 'The White Album');

select * from album;
select * from artistalbum;

insert into artistalbum
select null, 3, 2
union all select null, 3, 3 
union all select null, 3, 4
union all select null, 3, 5

insert into artistalbum values (null, 3, 6);

insert into song
select null, 'Drive My Car'
UNION ALL SELECT null, 'Norwegian Wood'
UNION ALL SELECT null, 'Taxman'
UNION ALL SELECT null, 'Yellow Submarine'
UNION ALL SELECT null, 'Sun King'
UNION ALL SELECT null, 'Come Together'
UNION ALL SELECT null, 'Let It Be'
UNION ALL SELECT null, 'Get Back'

select * from song;
select * from artistsong;

--4 through 11
insert into artistsong
select null, 3, 4
union all select null, 3, 5
union all select null, 3, 6
union all select null, 3, 7
union all select null, 3, 8
union all select null, 3, 9
union all select null, 3, 10
union all select null, 3, 11

select * from album
union all
select * from song

insert into songalbum
select null, 10, 5
union all select null, 11, 5

select ar.name, al.name, so.name
from artist ar join artistalbum aa on ar.artistid = aa.artistid
join album al on al.albumid = aa.albumid
join artistsong ars on ar.artistid = ars.artistid
join song so on so.songid = ars.songid
left join songalbum sa on so.songid = sa.songid
where ar.name = 'The Beatles' and al.name = 'The White Album'

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;

select al.name, so.name from album al left join songalbum sa on al.albumid = sa.albumid
left join song so on so.songid = sa.songid
where al.name = 'The White Album'
--where al.name = 'Rubber Soul'
--order by al.name --not needed but good habit

select al.name, count(so.name) as 'number of songs on Rubber Soul' 
from album al left join songalbum sa on al.albumid = sa.albumid
left join song so on so.songid = sa.songid
where al.name = 'Rubber Soul'
group by al.name

select ar.name, count(so.name) as 'number of songs for The Beatles' 
from artist ar left join artistsong ars on ar.artistid = ars.artistid
left join song so on so.songid = ars.songid
where ar.name = 'The Beatles'
group by ar.name

select ge.name, count(so.name) as 'number of songs in the dang Genre' 
from genre ge left join genresong gs on ge.genreid = gs.genreid
left join song so on so.songid = gs.songid
group by ge.name

alter table song add column song_length text ;
alter table album add column album_length text;

update album set album_length = '47:23' where name = 'Abbey Road'
update album set album_length = '35:50' where name = 'Rubber Soul'
update album set album_length = '34:43' where name = 'Revolver'
update album set album_length = '93:35' where name = 'The White Album'
update album set album_length = '35:10' where name = 'Let It Be'

select * from song;

update song set song_length = '2:25' where name = 'Drive My Car'
update song set song_length = '2:05' where name = 'Norwegian Wood'
update song set song_length = '2:39' where name = 'Taxman'
update song set song_length = '2:41' where name = 'Yellow Submarine'
update song set song_length = '4:20' where name = 'Come Together'
update song set song_length = '2:26' where name = 'Sun King'
update song set song_length = '4:03' where name = 'Let It Be'
update song set song_length = '3:09' where name = 'Get Back'

select max(album_length) as 'Length of Album', name 
from album

select max(so.song_length) as 'Length of Song', so.name, al.name
from song so join songalbum sa on so.songid = sa.songid
join album al on al.albumid = sa.albumid