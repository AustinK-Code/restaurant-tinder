-- TABLE ORDER HAS BEEN CHANGED TO ACCOMMODATE DEPENDENCIES
-- USE CTRL + F WITH THE FOLLOWING KEYWORDS TO FIND THE TABLE THAT YOU ARE LOOKING FOR

-- USERS TABLE
-- EVENTS TABLE
-- EVENT_INVITATION_CHOICES TABLE
-- EVENT_CHOICES_RESULTS TABLE
-- EVENT_RSVP TABLE
-- RESTAURANT TABLE
-- CUISINE_TYPE TABLE
-- RESTAURANT_LOCATION TABLE
-- RESTAURANT_HOURS TABLE
-- DAY_TABLE




BEGIN TRANSACTION;

DROP TABLE IF EXISTS event_choices_results;
DROP TABLE IF EXISTS invitation_choices;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS restaurant_hours;
DROP TABLE IF EXISTS day_table;
DROP TABLE IF EXISTS restaurant_location;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS cuisine_type;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

-- USERS TABLE
CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


-- EVENTS TABLE
CREATE TABLE events (
	event_id SERIAL NOT NULL,
	event_host_id int NOT NULL,
	event_date date NOT NULL,
	event_time time NOT NULL,
	respond_by_date date NOT NULL,
	respond_by_time time NOT NULL,
	CONSTRAINT PK_events PRIMARY KEY (event_id),
	CONSTRAINT FK_events_references_users FOREIGN KEY(event_host_id) REFERENCES users(user_id)
);

-- EVENT_CHOICES_RESULTS TABLE
CREATE TABLE event_choices_results (
	result_id SERIAL NOT NULL,
	event_id int NOT NULL,
	choice_1_result decimal, -- COMPUTED VALUES, COUNT(VOTES) WHERE VOTE = TRUE / COUNT(VOTES)
	choice_2_result decimal,
	choice_3_result decimal,
	choice_4_result decimal,
	choice_5_result decimal,
	CONSTRAINT PK_event_choices_results PRIMARY KEY (result_id),
	CONSTRAINT FK_event_choices_results_references_events FOREIGN KEY(event_id) REFERENCES events(event_id)
);

-- TO DO
-- EVENT_RSVP TABLE
-- CREATE TABLE event_rsvp ();



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
	'Mad Monks Pizza','1','5134861819','4.5','Mad_Monks_Pizza.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Fratelli''s Pizzeria','1','5137775061','4.7','fratellis_pizzeria.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Pies & Pints','1','5137557437','4.4','pies&pints.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Zip''s Cafe','2','5138719876','4.6','zip-s-cafe.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'The Turf Club','2','5135334222','4.4','The_Turf_Club.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Jeff Ruby''s Precinct','3','5133215454','4.8','jeff_rubys_precinct.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Jag''s Steak and Seafood','3','5138605353','4.7','jags_steak_and_seafood.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Mission BBQ','4','5139640984','4.7','mission_bbq.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'City Barbeque and Catering','4','5137550518','4.5','city_barbeque.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Acapulco','5','5134863772','4.5','Acapulco.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'El Vaquero','5','5134598855','4.4','El_Vaquero.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'El Caporal','5','5133367947','4.4','El_Caporal.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Miyako Sushi & Grill','6','5137773888','4.5','miyako_hibachi_and_sushi.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Soho Japanese Bistro','6','5137596876','4.3','soho_japanese_bistro.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'Another Broken Egg Cafe','7','5138471961','4.6','another_broken_egg_cafe.jpg');
INSERT INTO restaurant (restaurant_name,cuisine_id,phone_number,star_rating,thumbnail_img) VALUES (
	'First Watch','7','5138471445','4.5','first_watch.jpg');


-- EVENT_INVITATION_CHOICES TABLE
CREATE TABLE invitation_choices (
	invitation_id SERIAL NOT NULL,
	event_id int NOT NULL,
	event_guest_id int NOT NULL,
	restaurant_choice_1 int NOT NULL, -- PER PRODUCT OWNER REQUEST, MIN 2 MAX 5 CHOICES FOR INVITE
	restaurant_choice_2 int NOT NULL,
	restaurant_choice_3 int,
	restaurant_choice_4 int,
	restaurant_choice_5 int,
	vote_1 boolean, -- THUMBS UP = TRUE, THUMBS DOWN = FALSE
	vote_2 boolean,
	vote_3 boolean,
	vote_4 boolean,
	vote_5 boolean,
	CONSTRAINT PK_invitation_choices PRIMARY KEY (invitation_id),
	CONSTRAINT FK_invitation_choices_references_events FOREIGN KEY(event_id) REFERENCES events(event_id),
	CONSTRAINT FK_invitation_choices_references_users FOREIGN KEY(event_guest_id) REFERENCES users(user_id),
	CONSTRAINT FK_invitation_choice1_references_restaurant FOREIGN KEY(restaurant_choice_1) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_invitation_choice2_references_restaurant FOREIGN KEY(restaurant_choice_2) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_invitation_choice3_references_restaurant FOREIGN KEY(restaurant_choice_3) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_invitation_choice4_references_restaurant FOREIGN KEY(restaurant_choice_4) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_invitation_choice5_references_restaurant FOREIGN KEY(restaurant_choice_5) REFERENCES restaurant(restaurant_id)
);


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
	day_id int NOT NULL,
	day_of_week varchar(9),
	CONSTRAINT PK_day PRIMARY KEY (day_id)
);

INSERT INTO day_table (day_id, day_of_week) VALUES ('0','Sunday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('1','Monday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('2','Tuesday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('3','Wednesday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('4','Thursday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('5','Friday');
INSERT INTO day_table (day_id, day_of_week) VALUES ('6','Saturday');


-- RESTAURANT_HOURS TABLE AND DATA
CREATE TABLE restaurant_hours (
	id SERIAL NOT NULL,
	restaurant_id int NOT NULL,
	day_id int NOT NULL,
	open_time time,
	close_time time,
	duration_in_minutes varchar(4),
	CONSTRAINT PK_restaurant_hours PRIMARY KEY (id),
	CONSTRAINT FK_restaurant_hours_references_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id),
	CONSTRAINT FK_restaurant_hours_references_day_table FOREIGN KEY (day_id) REFERENCES day_table(day_id)
);

-- IF A RESTAURANT IS CLOSED ON A CERTAIN DAY, duration_in_minutes WILL BE NULL, USE THIS WHEN CHECKING IF OPEN

-- MAD MONKS PIZZA HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','0','12:00:00','20:00:00','480');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('1','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','2','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','3','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','4','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','5','16:00:00','22:00:00','360');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('1','6','12:00:00','22:00:00','600');

-- FRATELLI'S PIZZERIA HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','0','12:00:00','20:00:00','480');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('2','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','2','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','3','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','4','16:00:00','20:00:00','240');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('2','6','11:00:00','21:00:00','600');

-- PIES & PINTS HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','0','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','5','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('3','6','11:00:00','23:00:00','720');
-- ZIP'S CAFE HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','0','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('4','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('4','2','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','3','16:0000','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','4','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('4','6','11:00:00','21:00:00','600');

-- THE TURF CLUB HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','0','11:00:00','20:00:00','540');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('5','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('5','2','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','3','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','4','16:00:00','21:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('5','6','11:00:00','21:00:00','600');

-- JEFF RUBY'S PRECINCT HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','0','16:30:00','21:00:00','270');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','1','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','2','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','3','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','4','17:00:00','22:00:00','300');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','5','17:00:00','23:00:00','360');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('6','6','16:30:00','23:00:00','390');

-- JAG'S STEAK & SEAFOOD HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('7','0','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('7','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','2','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','3','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','4','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','5','17:00:00','20:30:00','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('7','6','17:00:00','20:30:00','210');

-- MISSION BBQ HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','0','11:30:00','20:00:00','510');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time) VALUES ('8','1','00:00:00','00:00:00');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('8','6','11:00:00','21:00:00','600');
-- CITY BARBEQUE AND CATERING HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','0','11:00:00','20:00:00','540');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','5','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('9','6','11:00:00','21:00:00','600');

-- ACAPULCO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','0','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','1','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','5','11:00:00','22:00:30','690');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('10','6','11:00:00','22:00:30','690');

-- EL VAQUERO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','0','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','1','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','5','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('11','6','11:00:00','23:00:00','720');

-- EL CAPORAL HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','0','12:00:00','21:00:00','540');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','1','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','2','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','3','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','4','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','5','11:00:00','22:00:00','660');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('12','6','12:00:00','23:00:00','660');

-- MIYAKO SUSHI & GRILL HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','0','12:00:00','22:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','1','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','1','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','2','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','2','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','3','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','3','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','4','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','4','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','5','11:00:00','14:00:30','210');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','5','16:30:00','22:00:00','330');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('13','6','12:00:00','23:00:00','660');

-- SOHO JAPANESE BISTRO HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','0','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','1','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','2','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','3','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','4','11:00:00','21:00:00','600');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','5','11:00:00','23:00:00','720');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('14','6','11:00:00','23:00:00','720');

-- ANOTHER BROKEN EGG CAFE HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','0','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','1','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','2','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','3','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','4','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','5','07:00:00','14:00:00','420');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('15','6','07:00:00','14:00:00','420');

-- FIRST WATCH HOURS
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','0','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','1','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','2','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','3','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','4','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','5','07:00:00','14:30:00','450');
INSERT INTO restaurant_hours (restaurant_id,day_id,open_time,close_time,duration_in_minutes) VALUES ('16','6','07:00:00','14:30:00','450');


COMMIT TRANSACTION;

