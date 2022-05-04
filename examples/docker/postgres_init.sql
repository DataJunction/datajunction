DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS dim_users;

CREATE TABLE dim_users (
  id integer,
  ds date NOT NULL,
  full_name text,
  age integer,
  country text,
  gender text,
  preferred_language text,
  PRIMARY KEY (id, ds)
)
PARTITION BY LIST (ds);

CREATE TABLE dim_users_20220101 PARTITION OF dim_users
FOR VALUES IN ('2022-01-01');

CREATE TABLE dim_users_20220102 PARTITION OF dim_users
FOR VALUES IN ('2022-01-02');

INSERT INTO dim_users (id, ds, full_name, age, country, gender, preferred_language)
  VALUES (1, '2022-01-01', 'Alice One', 10, 'Argentina', 'female', 'Spanish'), (2, '2022-01-01', 'Bob Two', 15, 'Brazil', 'male', 'Portuguese'), (3, '2022-01-01', 'Charlie Three', 20, 'Chile', 'non-binary', 'Spanish'), (4, '2022-01-01', 'Denise Four', 25, 'Denmark', 'female', 'Danish'), (5, '2022-01-01', 'Ernie Five', 27, 'Equator', 'male', 'Spanish'), (6, '2022-01-01', 'Fabian Six', 29, 'France', 'non-binary', 'French');

INSERT INTO dim_users (id, ds, full_name, age, country, gender, preferred_language)
  VALUES (1, '2022-01-02', 'Alice One', 11, 'Argentina', 'female', 'Spanish'), (2, '2022-01-02', 'Bob Two', 15, 'Bolivia', 'male', 'Portuguese'), (3, '2022-01-02', 'Charlie Three', 21, 'Chile', 'non-binary', 'Spanish'), (4, '2022-01-02', 'Denise Four', 25, 'Denmark', 'male', 'Danish'), (5, '2022-01-02', 'Ernie Five', 27, 'Equator', 'male', 'English'), (6, '2022-01-02', 'Fabianne Six', 29, 'France', 'non-binary', 'French');

CREATE TABLE comments (
  id integer PRIMARY KEY,
  user_id integer,
  "timestamp" timestamp with time zone,
  "text" text
);

INSERT INTO comments (id, user_id, "timestamp", "text")
  VALUES (1, 1, '2021-01-01 01:00:00', 'Hola!'), (2, 2, '2021-01-01 02:00:00', 'Oi, tudo bom?'), (3, 3, '2021-01-01 03:00:00', 'Que pasa?'), (4, 4, '2021-01-01 04:00:00', 'Også mig'), (5, 5, '2021-01-01 05:00:00', 'Bueno'), (6, 6, '2021-01-01 06:00:00', 'Bonjour!'), (7, 2, '2021-01-01 07:00:00', 'Prazer em conhecer'), (8, 3, '2021-01-01 08:00:00', 'Si, si'), (9, 4, '2021-01-01 09:00:00', 'Hej'), (10, 5, '2021-01-01 10:00:00', 'Por supuesto'), (11, 6, '2021-01-01 11:00:00', 'Oui, oui'), (12, 3, '2021-01-01 12:00:00', 'Como no?'), (13, 4, '2021-01-01 13:00:00', 'Farvel'), (14, 5, '2021-01-01 14:00:00', 'Hola, amigo!'), (15, 6, '2021-01-01 15:00:00', 'Très bien'), (16, 4, '2021-01-01 16:00:00', 'Dejligt at møde dig'), (17, 5, '2021-01-01 17:00:00', 'Dale!'), (18, 6, '2021-01-01 18:00:00', 'Bien sûr!'), (19, 5, '2021-01-01 19:00:00', 'Hasta luego!'), (20, 6, '2021-01-01 20:00:00', 'À toute à l'' heure ! '), (21, 6, '2021-01-01 21:00:00', 'Peut être'), (22, 6, '2021-01-01 00:00:00', 'Cześć!');
