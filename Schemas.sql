CREATE SCHEMA test;
CREATE SCHEMA hr;

ALTER SCHEMA hr RENAME TO rekrutacja;

DROP SCHEMA rekrutacja;
--jak wybierac obiekty ze schema
SELECT *
FROM movies.public.actors;

ALTER TABLE mangoes
SET SCHEMA test;

SELECT current_schema();

SHOW search_path;

SET search_path TO humanresources, public;
--SET search_path TO <schema_name>, public;

ALTER SCHEMA test OWNER TO tomasz;

CREATE DATABASE tomasz_dane;

CREATE TABLE tomasz_dane.public.tomasz_songs(
	song_id SERIAL PRIMARY KEY,
	song_title VARCHAR(100)
);

INSERT INTO tomasz_songs (song_title) Values
('Rolling bass'),
('chase the sun');

GRANT USAGE ON SCHEMA test TO tomasz;
