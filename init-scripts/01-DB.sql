CREATE TABLE TAG(
   id_tag SERIAL PRIMARY KEY,
   tag TEXT
);

CREATE TABLE COLLECTION(
   id_collection SERIAL PRIMARY KEY,
   name_collection VARCHAR(50),
   creation_date_collection TIMESTAMP,
   updated_date_collection TIMESTAMP
);

CREATE TABLE APP_USER(
   id_user SERIAL PRIMARY KEY,
   username_user VARCHAR(50),
   email_user VARCHAR(50),
   password_user VARCHAR(150),
   avatar_user TEXT,
   shared_user BOOLEAN,
   creation_date_user TIMESTAMP,
   updated_date_user TIMESTAMP
);

CREATE TABLE AUTHOR(
   id_author SERIAL PRIMARY KEY,
   name_author VARCHAR(50),
   creation_date_author TIMESTAMP,
   updated_date_author TIMESTAMP
);

CREATE TABLE SERIE(
   id_serie SERIAL PRIMARY KEY,
   title_serie VARCHAR(150),
   description_serie TEXT,
   cover_serie TEXT,
   creation_date_serie TIMESTAMP,
   updated_date_serie TIMESTAMP
);

CREATE TABLE SEASON(
   id_season SERIAL PRIMARY KEY,
   number_season INT,
   creation_date_season TIMESTAMP,
   updated_date_season TIMESTAMP,
   id_serie INT,
   FOREIGN KEY(id_serie) REFERENCES SERIE(id_serie)
);

CREATE TABLE MEDIA(
   id_media SERIAL PRIMARY KEY,
   title_media VARCHAR(100),
   description_media TEXT,
   cover_media TEXT,
   length_media VARCHAR(50),
   type_media VARCHAR(50),
   creation_date_media TIMESTAMP,
   updated_date_media TIMESTAMP,
   id_season INT,
   FOREIGN KEY(id_season) REFERENCES SEASON(id_season)
);

CREATE TABLE NOTE(
   id_note SERIAL PRIMARY KEY,
   title_note VARCHAR(50),
   description_note TEXT,
   image_note TEXT,
   shared_note BOOLEAN,
   timeline_note VARCHAR(25),
   creation_date_note TIMESTAMP,
   updated_date_note TIMESTAMP,
   id_media INT,
   id_user INT,
   FOREIGN KEY(id_media) REFERENCES MEDIA(id_media),
   FOREIGN KEY(id_user) REFERENCES APP_USER(id_user)
);

CREATE TABLE NOTE_TAG(
   id_note INT,
   id_tag INT,
   PRIMARY KEY(id_note, id_tag),
   FOREIGN KEY(id_note) REFERENCES NOTE(id_note),
   FOREIGN KEY(id_tag) REFERENCES TAG(id_tag)
);

CREATE TABLE NOTE_COLLECTION(
   id_note INT,
   id_collection INT,
   PRIMARY KEY(id_note, id_collection),
   FOREIGN KEY(id_note) REFERENCES NOTE(id_note),
   FOREIGN KEY(id_collection) REFERENCES COLLECTION(id_collection)
);

CREATE TABLE MEDIA_AUTHOR(
   id_media INT,
   id_author INT,
   PRIMARY KEY(id_media, id_author),
   FOREIGN KEY(id_media) REFERENCES MEDIA(id_media),
   FOREIGN KEY(id_author) REFERENCES AUTHOR(id_author)
);
