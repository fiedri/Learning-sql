CREATE DATABASE mario_database;

CREATE TABLE mario_database.characters();

ALTER TABLE mario_database.characters ADD COLUMN id SERIAL;
ALTER TABLE mario_database.characters ADD COLUMN name VARCHAR(30) NOT NULL;
ALTER TABLE mario_database.characters ADD COLUMN homeland VARCHAR(60);
ALTER TABLE mario_database.characters ADD COLUMN favorite_color VARCHAR(20);

INSERT INTO mario_database.characters (name, homeland, favorite_color) VALUES
('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Princess Peach', 'Mushroom Kingdom', 'Pink'),
('Bowser', 'Dark Land', 'Yellow'),
('Yoshi', 'Yoshi Island', 'Green'),
('Toad', 'Mushroom Kingdom', 'Green');

UPDATE mario_database.characters SET favorite_color = 'Blue' WHERE name = 'Toad';

ALTER TABLE mario_database.characters ADD PRIMARY KEY (id);

CREATE TABLE mario_database.more_info();