CREATE DATABASE catalog_of_my_thing;

CREATE TABLE item (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genre_id INT,
	author_id INT,
	label_id INT,
	archived BOOLEAN,
	public_date DATE,
	FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Label (
  id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  title varchar(50),
  color varchar(10)
);

CREATE TABLE Book (
  id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  publisher VARCHAR(50),
  cover_state VARCHAR(10),
  FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE author (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20)
);

CREATE TABLE game(
	id INT NOT NULL,
	last_played_at DATE,
	multiplayer BOOLEAN,
	FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE
);