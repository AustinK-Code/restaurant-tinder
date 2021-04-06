BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- THIS IS THE BEGINNING OF THE RESTAURANT DATA
DROP TABLE IF EXISTS cuisine_type;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS restaurant_location;
DROP TABLE IF EXISTS day_table;
DROP TABLE IF EXISTS restaurant_hours;


-- CUISINE_TYPE TABLE AND DATA
CREATE TABLE cuisine_type (
	cuisine_id SERIAL NOT NULL,
	restaurant_type varchar(50) NOT NULL,
	CONSTRAINT PK_cuisine_type PRIMARY KEY (cuisine_id)
);

INSERT INTO cuisine_type (restaurant_type) VALUES ("pizza");
INSERT INTO cuisine_type (restaurant_type) VALUES ("burgers");
INSERT INTO cuisine_type (restaurant_type) VALUES ("steakhouse");
INSERT INTO cuisine_type (restaurant_type) VALUES ("barbecue");
INSERT INTO cuisine_type (restaurant_type) VALUES ("mexican");
INSERT INTO cuisine_type (restaurant_type) VALUES ("Japanese hibachi and sushi");
INSERT INTO cuisine_type (restaurant_type) VALUES ("breakfast/brunch");


-- RESTAURANT TABLE AND DATA
CREATE TABLE restaurant (
	restaurant_id SERIAL NOT NULL,
	restaurant_name varchar(100) NOT NULL,
	cuisine_id varchar(3) NOT NULL,
	phone_number varchar(10) NOT NULL,
	star_rating varchar(1) NOT NULL,
	thumbnail_img varchar(200) NOT NULL,
	CONSTRAINT PK_restaurant PRIMARY KEY (restaurant_id),
	CONSTRAINT FK_restaurant FOREIGN KEY (cuisine_id) REFERENCES cuisine_type(cuisine_id)
);

INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"Mad Monks Pizza","0","5134861819","4.5",
	"https://www.google.com/maps/place/Mad+Monks+Pizza/@39.3496097,-84.326025,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipNamUI1mhUmiSSULbmJDt9lUzeuDMZ4AsNnSuQ!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNamUI1mhUmiSSULbmJDt9lUzeuDMZ4AsNnSuQ%3Dw152-h86-k-no!7i1920!8i1080!4m5!3m4!1s0x884059d89433089f:0x29d31680894512d7!8m2!3d39.3496097!4d-84.326025?hl=en&authuser=0#");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"Fratelli's Pizzeria","0","5137775061","4.7",
	"https://www.google.com/maps/place/Fratelli's+Pizzeria/@39.3578325,-84.3958348,3a,51.6y/data=!3m8!1e2!3m6!1sAF1QipPwSjMkaGTGeVbGRtiYYEWkBaBpony__wMGoYIY!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPwSjMkaGTGeVbGRtiYYEWkBaBpony__wMGoYIY%3Dw128-h86-k-no!7i5419!8i3613!4m5!3m4!1s0x88405a7df075ab39:0xa6bbcf2349f47c60!8m2!3d39.3578325!4d-84.3956666?hl=en&authuser=0#");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"Pies & Pints","0","5137557437","4.4",
	"https://www.google.com/maps/place/Pies+%26+Pints+-+Cincinnati,+OH+(Liberty+Center)/@39.3709789,-84.3709828,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMouosLB2-nHJJWfOZVkGsCnssNy-d3oruOv7Cn!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMouosLB2-nHJJWfOZVkGsCnssNy-d3oruOv7Cn%3Dw129-h86-k-no!7i5184!8i3456!4m5!3m4!1s0x0:0x67adf7bdba2c0817!8m2!3d39.3710224!4d-84.3711403?hl=en&authuser=0#");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"Zip's Cafe","1","5138719876","4.6",
	"https://www.google.com/maps/place/Zip's+Cafe/@39.1297903,-84.4295644,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMi0t_cDfQNIP7WEib-crubw38jFJcHt5WrhP_g!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMi0t_cDfQNIP7WEib-crubw38jFJcHt5WrhP_g%3Dw203-h114-k-no!7i1920!8i1080!4m5!3m4!1s0x8841ad8dc6a40b31:0x62fa3eaca77b2ae9!8m2!3d39.1296982!4d-84.4294012?hl=en&authuser=0#");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	"The Turf Club","1","5138719876","4.6",
	"");


-- RESTAURANT_LOCATION TABLE AND DATA
CREATE TABLE restaurant_location (
	location_id SERIAL NOT NULL,
	restaurant_id varchar(10) NOT NULL,
	street_address varchar(100) NOT NULL,
	address_2 varchar(20),
	city varchar(50) NOT NULL,
	region varchar(20) NOT NULL,
	zip_code varchar(5) NOT NULL,
	CONSTRAINT PK_location PRIMARY KEY (location_id),
	CONSTRAINT FK_location FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);


-- DAY_TABLE AND DATA
CREATE TABLE day_table (
	day_id SERIAL NOT NULL,
	day_of_week varchar(9),
	CONSTRAINT PK_day PRIMARY KEY (day_id)
);

INSERT INTO day_table (day_of_week) VALUES ("Sunday");
INSERT INTO day_table (day_of_week) VALUES ("Monday");
INSERT INTO day_table (day_of_week) VALUES ("Tuesday");
INSERT INTO day_table (day_of_week) VALUES ("Wednesday");
INSERT INTO day_table (day_of_week) VALUES ("Thursday");
INSERT INTO day_table (day_of_week) VALUES ("Friday");
INSERT INTO day_table (day_of_week) VALUES ("Saturday");


-- RESTAURANT_HOURS TABLE AND DATA
CREATE TABLE restaurant_hours (
	id SERIAL NOT NULL,
	restaurant_id varchar(10) NOT NULL,
	day_id varchar(1) NOT NULL,
	open_time varchar(4),
	close_time varchar(4),
	duration_in_minutes varchar(4) NOT NULL,
	CONSTRAINT PK_restaurant_hours PRIMARY KEY (id),
	CONSTRAINT FK_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_day FOREIGN KEY (day_id) REFERENCES day_table(day_id)
)







COMMIT TRANSACTION;
