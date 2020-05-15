.read fa19data.sql

CREATE TABLE obedience AS
  SELECT seven, instructor FROM students;

CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 2 ORDER BY smallest LIMIT 20;

CREATE TABLE matchmaker AS
  SELECT a.Pet, a.Song, a.Color, b.Color FROM students AS a, students AS b WHERE a.Time < b.Time AND a.Song = b.Song AND a.Pet = b.Pet;

