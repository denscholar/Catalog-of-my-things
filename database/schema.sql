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