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
DROP TABLE IF EXISTS restaurant_hours;
DROP TABLE IF EXISTS day_table;
DROP TABLE IF EXISTS restaurant_location;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS cuisine_type;


-- CUISINE_TYPE TABLE AND DATA
CREATE TABLE cuisine_type (
	cuisine_id SERIAL NOT NULL,
	restaurant_type varchar(50) NOT NULL,
	CONSTRAINT PK_cuisine_type PRIMARY KEY (cuisine_id)
);

INSERT INTO cuisine_type (restaurant_type) VALUES ('pizza');
INSERT INTO cuisine_type (restaurant_type) VALUES ('burgers');
INSERT INTO cuisine_type (restaurant_type) VALUES ('steakhouse');
INSERT INTO cuisine_type (restaurant_type) VALUES ('barbecue');
INSERT INTO cuisine_type (restaurant_type) VALUES ('mexican');
INSERT INTO cuisine_type (restaurant_type) VALUES ('Japanese hibachi and sushi');
INSERT INTO cuisine_type (restaurant_type) VALUES ('breakfast/brunch');


-- RESTAURANT TABLE AND DATA
CREATE TABLE restaurant (
	restaurant_id SERIAL NOT NULL,
	restaurant_name varchar(100) NOT NULL,
	cuisine_id int NOT NULL,
	phone_number char(10) NOT NULL,
	star_rating varchar(3) NOT NULL,
	thumbnail_img varchar(500) NOT NULL,
	CONSTRAINT PK_restaurant PRIMARY KEY (restaurant_id),
	CONSTRAINT FK_restaurant_references_cuisine_type FOREIGN KEY(cuisine_id) REFERENCES cuisine_type(cuisine_id)
);

INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Mad Monks Pizza','1','5134861819','4.5',
	'https://www.google.com/maps/place/Mad+Monks+Pizza/@39.3496097,-84.326025,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipNamUI1mhUmiSSULbmJDt9lUzeuDMZ4AsNnSuQ!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNamUI1mhUmiSSULbmJDt9lUzeuDMZ4AsNnSuQ%3Dw152-h86-k-no!7i1920!8i1080!4m5!3m4!1s0x884059d89433089f:0x29d31680894512d7!8m2!3d39.3496097!4d-84.326025?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Fratelli''s Pizzeria','1','5137775061','4.7',
	'https://www.google.com/maps/place/Fratelli''s+Pizzeria/@39.3578325,-84.3958348,3a,51.6y/data=!3m8!1e2!3m6!1sAF1QipPwSjMkaGTGeVbGRtiYYEWkBaBpony__wMGoYIY!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPwSjMkaGTGeVbGRtiYYEWkBaBpony__wMGoYIY%3Dw128-h86-k-no!7i5419!8i3613!4m5!3m4!1s0x88405a7df075ab39:0xa6bbcf2349f47c60!8m2!3d39.3578325!4d-84.3956666?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Pies & Pints','1','5137557437','4.4',
	'https://www.google.com/maps/place/Pies+%26+Pints+-+Cincinnati,+OH+(Liberty+Center)/@39.3709789,-84.3709828,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMouosLB2-nHJJWfOZVkGsCnssNy-d3oruOv7Cn!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMouosLB2-nHJJWfOZVkGsCnssNy-d3oruOv7Cn%3Dw129-h86-k-no!7i5184!8i3456!4m5!3m4!1s0x0:0x67adf7bdba2c0817!8m2!3d39.3710224!4d-84.3711403?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Zip''s Cafe','2','5138719876','4.6',
	'https://www.google.com/maps/place/Zip''s+Cafe/@39.1297903,-84.4295644,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMi0t_cDfQNIP7WEib-crubw38jFJcHt5WrhP_g!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMi0t_cDfQNIP7WEib-crubw38jFJcHt5WrhP_g%3Dw203-h114-k-no!7i1920!8i1080!4m5!3m4!1s0x8841ad8dc6a40b31:0x62fa3eaca77b2ae9!8m2!3d39.1296982!4d-84.4294012?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'The Turf Club','2','5135334222','4.4',
	'https://www.google.com/maps/place/The+Turf+Club/@39.1182954,-84.4191134,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMCq0cYOiuf4moSM4lO6Obfxp7iJGUHRG7PIAbv!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMCq0cYOiuf4moSM4lO6Obfxp7iJGUHRG7PIAbv%3Dw203-h152-k-no!7i4032!8i3024!4m13!1m7!3m6!1s0x8841ade9a349d847:0x3c75e7cc99111daf!2sThe+Turf+Club!8m2!3d39.1182954!4d-84.4191134!10e2!3m4!1s0x8841ade9a349d847:0x3c75e7cc99111daf!8m2!3d39.1182954!4d-84.4191134?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Jeff Ruby''s Precinct','3','5133215454','4.8',
	'https://www.google.com/maps/place/Jeff+Ruby''s+Precinct/@39.1170939,-84.4394511,3a,107.8y,90t/data=!3m8!1e2!3m6!1sAF1QipNYkEtqwipQ9IbC85kmWzhkry_Lw5oJym_i5F8!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNYkEtqwipQ9IbC85kmWzhkry_Lw5oJym_i5F8%3Dw203-h153-k-no!7i504!8i382!4m13!1m7!3m6!1s0x8841b20840bd227b:0x40712c1cc950729a!2sJeff+Ruby''s+Precinct!8m2!3d39.1171512!4d-84.4395542!10e2!3m4!1s0x8841b20840bd227b:0x40712c1cc950729a!8m2!3d39.1171512!4d-84.4395542?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Jag''s Steak and Seafood','3','5138605353','4.7',
	'https://www.google.com/maps/place/Jag''s+Steak+%26+Seafood/@39.3288813,-84.4261443,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipMLW4yCv-JiM70Y-xwFcEomAMNmXFRwrUg4AB3Z!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMLW4yCv-JiM70Y-xwFcEomAMNmXFRwrUg4AB3Z%3Dw203-h135-k-no!7i3000!8i2000!4m11!1m5!2m4!1sRestaurants!5m1!6sgcid:steak_house!6e5!3m4!1s0x8840503cea90f741:0xa7dc61430790d54f!8m2!3d39.3289208!4d-84.4263978?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Mission BBQ','4','5139640984','4.7',
	'https://www.google.com/maps/place/MISSION+BBQ/@39.3137364,-84.3141585,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipNjWUubv9mWfkl3A24NoUkDqZln0zrVTtFdgToI!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNjWUubv9mWfkl3A24NoUkDqZln0zrVTtFdgToI%3Dw114-h86-k-no!7i4096!8i3072!4m11!1m5!2m4!1sRestaurants!5m1!6sgcid:barbecue_restaurant!6e5!3m4!1s0x8840577c6f868983:0x424bfba39703a788!8m2!3d39.3137364!4d-84.3141585?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'City Barbeque and Catering','4','5137550518','4.5',
	'https://www.google.com/maps/place/City+Barbeque+and+Catering/@39.3542891,-84.3614752,3a,75y,120h,90t/data=!3m8!1e1!3m6!1sAF1QipNrP0ohweK9_Z4yXOeRpRSxroz2zOSk_szlONdz!2e10!3e11!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNrP0ohweK9_Z4yXOeRpRSxroz2zOSk_szlONdz%3Dw86-h86-k-no-pi-0-ya112.30635-ro-0-fo100!7i13312!8i6656!4m11!1m5!2m4!1sRestaurants!5m1!6sgcid:barbecue_restaurant!6e5!3m4!1s0x0:0x684cd79c5f05b5e2!8m2!3d39.354277!4d-84.36131?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Acapulco','5','5134863772','4.5',
	'https://www.google.com/maps/place/Acapulco+mexican+restaurant/@39.3365551,-84.3433871,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipOUDzGsYpPpEA7q3RtUVgzwJg6QRmuIhNGdSiaJ!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOUDzGsYpPpEA7q3RtUVgzwJg6QRmuIhNGdSiaJ%3Dw114-h86-k-no!7i4096!8i3072!4m8!1m2!2m1!1smexican+restaurant!3m4!1s0x88405742872a6cd3:0x4aab34ea84bbe270!8m2!3d39.3365551!4d-84.3433871?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'El Vaquero','5','5134598855','4.4',
	'https://www.google.com/maps/place/El+Vaquero+Mexican+Restaurant/@39.3406736,-84.3394626,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipPv2HPt8f-Rw55MjifDmVblMBz5YyNHEMr26O-v!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPv2HPt8f-Rw55MjifDmVblMBz5YyNHEMr26O-v%3Dw152-h86-k-no!7i1381!8i777!4m8!1m2!2m1!1smexican+restaurant!3m4!1s0x8840575b710e6269:0x9fb0d1ff59bf80f8!8m2!3d39.3407915!4d-84.339243?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'El Caporal','5','5133367947','4.4',
	'https://www.google.com/maps/place/El+Caporal+-+Mexican+Bar+%26+Grill/@39.351398,-84.329067,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipN6amM1lBQFnz6rKeXGlvVAZqFKy3k6TC3KVXuH!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipN6amM1lBQFnz6rKeXGlvVAZqFKy3k6TC3KVXuH%3Dw114-h86-k-no!7i4048!8i3036!4m8!1m2!2m1!1smexican+restaurant!3m4!1s0x884059dee0bd204f:0xd383921eae992817!8m2!3d39.351398!4d-84.329067?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Miyako Sushi & Grill','6','5137773888','4.5',
	'https://www.google.com/maps/place/Miyako+Sushi+%26+Grill/@39.3536632,-84.3639446,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipNVLAw4jkxvA_-l0L0HDRGoaGlVA5IZNTe2As3v!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNVLAw4jkxvA_-l0L0HDRGoaGlVA5IZNTe2As3v%3Dw114-h86-k-no!7i4032!8i3024!4m5!3m4!1s0x88405a063cdba4ef:0xf2d79d76a4685df4!8m2!3d39.353933!4d-84.364008?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Soho Japanese Bistro','6','5137596876','4.3',
	'https://www.google.com/maps/place/Soho+Japanese+Bistro/@39.3557275,-84.3633564,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipOVGkCc71oul6pp9PbVqqybs8U6zmMGizIFmMyZ!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOVGkCc71oul6pp9PbVqqybs8U6zmMGizIFmMyZ%3Dw129-h86-k-no!7i2048!8i1363!4m5!3m4!1s0x88405a06f1bfcc1f:0x9e17de6a72d58a6c!8m2!3d39.3557635!4d-84.3636931?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Another Broken Egg Cafe','7','5138471961','4.6',
	'https://www.google.com/maps/place/Another+Broken+Egg+Cafe/@39.35308,-84.36336,3a,75y/data=!3m8!1e2!3m6!1sAF1QipNJSS1QnuXh-yqMoCVqPNU5nFejMux50Ryy4KVT!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNJSS1QnuXh-yqMoCVqPNU5nFejMux50Ryy4KVT%3Dw114-h86-k-no!7i4608!8i3456!4m5!3m4!1s0x88405b76987049a9:0x7613fe02583d1c21!8m2!3d39.3530797!4d-84.3633599?hl=en&authuser=0#');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'First Watch','7','5138471445','4.5',
	'https://www.google.com/maps/place/First+Watch/@39.377536,-84.3779393,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipP8-hDlrbyuXeInWslgndty7UNnQ6q8zAeH23VA!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipP8-hDlrbyuXeInWslgndty7UNnQ6q8zAeH23VA%3Dw114-h86-k-no!7i4048!8i3036!4m8!1m2!2m1!1sfirst+watch!3m4!1s0x88405a46d867935d:0xb2cfb2827500e57d!8m2!3d39.37759!4d-84.37797?hl=en&authuser=0#');


-- RESTAURANT_LOCATION TABLE AND DATA
CREATE TABLE restaurant_location (
	location_id SERIAL NOT NULL,
	restaurant_id int NOT NULL,
	street_address varchar(100) NOT NULL,
	address_2 varchar(20),
	city varchar(50) NOT NULL,
	region varchar(20) NOT NULL,
	zip_code char(5) NOT NULL,
	CONSTRAINT PK_location PRIMARY KEY (location_id),
	CONSTRAINT FK_location_references_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('1','753 Reading Rd','Mason','OH','45040');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('2','6890 Tylersville Rd','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('3','7621 Gibson St','Liberty Township','OH','45044');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('4','1036 Delta Ave','Cincinnati','OH','45208');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('5','4618 Eastern Ave','Cincinnati','OH','45226');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('6','311 Delta Ave','Cincinnati','OH','45226');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('7','5980 West Chester Rd','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('8','8655 Mason Montgomery Rd','Mason','OH','45040');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('9','7706 Voice of America Centre Dr','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('10','6691 Reading Rd','Mason','OH','45040');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('11','1061 Reading Rd','Mason','OH','45040');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('12','6011 Tylersville Rd','Mason','OH','45040');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('13','7691 Voice of America Centre Dr','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('14','7655 Voice of America Centre Dr','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,city,region,zip_code) VALUES ('15','7701 Voice of America Centre Dr','West Chester Township','OH','45069');
INSERT INTO restaurant_location (restaurant_id,street_address,address_2,city,region,zip_code) VALUES ('16','6876 Cincinnati Dayton Rd','#106','Liberty Township','OH','45044');


-- DAY_TABLE AND DATA
CREATE TABLE day_table (
	day_id SERIAL NOT NULL,
	day_of_week varchar(9),
	CONSTRAINT PK_day PRIMARY KEY (day_id)
);

INSERT INTO day_table (day_of_week) VALUES ('Sunday');
INSERT INTO day_table (day_of_week) VALUES ('Monday');
INSERT INTO day_table (day_of_week) VALUES ('Tuesday');
INSERT INTO day_table (day_of_week) VALUES ('Wednesday');
INSERT INTO day_table (day_of_week) VALUES ('Thursday');
INSERT INTO day_table (day_of_week) VALUES ('Friday');
INSERT INTO day_table (day_of_week) VALUES ('Saturday');


-- RESTAURANT_HOURS TABLE AND DATA
CREATE TABLE restaurant_hours (
	id SERIAL NOT NULL,
	restaurant_id int NOT NULL,
	day_id int NOT NULL,
	open_time time,
	close_time time,
	duration_in_minutes varchar(4) NOT NULL,
	CONSTRAINT PK_restaurant_hours PRIMARY KEY (id),
	CONSTRAINT FK_restaurant_hours_references_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_restaurant_hours_references_day_table FOREIGN KEY (day_id) REFERENCES day_table(day_id)
);

-- MAD MONKS PIZZA HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','1','12:00:00','20:00:00','480');
-- CLOSED MONDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','3','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','4','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','5','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','6','16:00:00','22:00:00','360');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','7','12:00:00','22:00:00','600');

-- FRATELLI'S PIZZERIA HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','1','12:00:00','20:00:00','480');
-- CLOSED MONDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','3','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','4','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','5','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','6','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','7','11:00:00','21:00:00','600');

-- PIES & PINTS HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','6','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','7','11:00:00','23:00:00','720');
-- ZIP'S CAFE HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','1','11:00:00','21:00:00','600');
-- CLOSED MONDAY
-- CLOSED TUESDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','4','16:0000','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','5','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','6','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','7','11:00:00','21:00:00','600');

-- THE TURF CLUB HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','1','11:00:00','20:00:00','540');
-- CLOSED MONDAY
-- CLOSED TUESDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','4','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','5','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','6','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','7','11:00:00','21:00:00','600');

-- JEFF RUBY'S PRECINCT HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','1','16:30:00','21:00:00','270');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','2','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','3','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','4','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','5','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','6','17:00:00','23:00:00','360');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','7','16:30:00','23:00:00','390');

-- JAG'S STEAK & SEAFOOD HOURS
-- CLOSED SUNDAY
-- CLOSED MONDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','3','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','4','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','5','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','6','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','7','17:00:00','20:30:00','210');

-- MISSION BBQ HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','1','11:30:00','20:00:00','510');
-- CLOSED MONDAY
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','6','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','7','11:00:00','21:00:00','600');
-- CITY BARBEQUE AND CATERING HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','1','11:00:00','20:00:00','540');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','6','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','7','11:00:00','21:00:00','600');

-- ACAPULCO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','5','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','6','11:00:00','22:00:30','690');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','7','11:00:00','22:00:30','690');

-- EL VAQUERO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','5','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','6','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','7','11:00:00','23:00:00','720');

-- EL CAPORAL HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','1','12:00:00','21:00:00','540');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','5','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','6','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','7','12:00:00','23:00:00','660');

-- MIYAKO SUSHI & GRILL HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','1','12:00:00','22:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','2','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','2','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','3','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','3','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','4','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','4','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','5','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','5','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','6','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','6','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','7','12:00:00','23:00:00','660');

-- SOHO JAPANESE BISTRO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','6','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','7','11:00:00','23:00:00','720');

-- ANOTHER BROKEN EGG CAFE HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','1','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','2','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','3','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','4','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','5','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','6','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','7','07:00:00','14:00:00','420');

-- FIRST WATCH HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','1','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','2','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','3','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','4','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','5','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','6','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','7','07:00:00','14:30:00','450');

COMMIT TRANSACTION;
