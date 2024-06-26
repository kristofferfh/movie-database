CREATE TABLE movie (
  mov_id integer NOT NULL PRIMARY KEY,
  mov_title char(50) NOT NULL,
  mov_year integer NOT NULL,
  mov_time integer NOT NULL,
  mov_lang char(50) NOT NULL,
  mov_dt_rel date,
  mov_rel_country char(5) NOT NULL
);

CREATE TABLE actor (
  act_id integer NOT NULL PRIMARY KEY,
  act_fname char(20) NOT NULL,
  act_lname char(20) NOT NULL,
  act_gender char(1) NOT NULL
 );

 CREATE TABLE director (
  dir_id integer NOT NULL PRIMARY KEY,
  dir_fname char(20) NOT NULL,
  dir_lname char(20) NOT NULL
);

CREATE TABLE genres (
  gen_id integer NOT NULL PRIMARY KEY,
  gen_title char(20) NOT NULL
);

CREATE TABLE reviewer (
  rev_id integer NOT NULL PRIMARY KEY,
  rev_name char(30)
);

CREATE TABLE movie_cast (
  act_id integer NOT NULL FOREIGN KEY REFERENCES actor(act_id),
  mov_id integer NOT NULL FOREIGN KEY REFERENCES movie(mov_id),
  role char(30) NOT NULL
);

CREATE TABLE movie_genres (
  mov_id integer NOT NULL FOREIGN KEY REFERENCES movie(mov_id),
  gen_id integer NOT NULL FOREIGN KEY REFERENCES genres(gen_id)
);

CREATE TABLE movie_directors (
  dir_id integer NOT NULL FOREIGN KEY REFERENCES director(dir_id),
  mov_id integer NOT NULL FOREIGN KEY REFERENCES movie(mov_id)
);

CREATE TABLE rating (
  mov_id integer NOT NULL FOREIGN KEY REFERENCES movie(mov_id),
  rev_id integer NOT NULL FOREIGN KEY REFERENCES reviewer(rev_id),
  rev_stars integer,
  num_o_ratings integer
);