-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id int REFERENCES orbits NOT NULL,
  galaxy_id int REFERENCES galaxies,
  moons TEXT[]
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');
 
INSERT INTO orbits
  (name)
VALUES
  ('Proxima Centauri'),
  ('Gliese 876'),
  ('The Sun');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 3, 1, '{"The Moon"}'),
  ('Mars', 1.88, 3, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 3, 1, '{}'),
  ('Neptune', 164.8, 3, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 1, 1, '{}'),
  ('Gliese 876 b', 0.23, 2, 1, '{}');