

CREATE DATABASE IF NOT EXISTS Jobclub;
USE Jobclub;
/*

	Project Part 2 SQL 

*/

-- PERSON
create table person(
	pid varchar(30),
	passwd  char(32),
	fname varchar(50),
	lname varchar(100),
	PRIMARY KEY (pid)
);

-- instructor
create table instructor(
	pid varchar(30),
	phone char(12),
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES person(pid)
);

-- Student
create table student(
	pid varchar(30),
	gender varchar(10),
	class varchar(20),
	PRIMARY KEY (pid),
    FOREIGN KEY (pid) REFERENCES person(pid)
);


-- section
create table section(
	sectionid integer auto_increment,
	cname varchar(100),
	descr varchar(100),
	PRIMARY KEY (sectionid)
);

-- instructor_of
create table instructor_of(
	pid varchar(30),
	sectionid integer,
	PRIMARY KEY (pid,sectionid),
	FOREIGN KEY (pid) REFERENCES instructor(pid),
	FOREIGN KEY (sectionid) REFERENCES section(sectionid)
);


-- idea
create table idea(
	id integer auto_increment,
	ename varchar(100),
	description varchar(255),
	edatetime datetime,
	is_active boolean,
    pid varchar(30),	
	PRIMARY KEY (id),
 	FOREIGN KEY (pid) REFERENCES student(pid)
);

-- Keywords
create table keywords(
	topic varchar(30),
	PRIMARY KEY (topic)
);

-- Interested_in
create table interested_in(
	pid varchar(30),
	topic varchar(100),
	PRIMARY KEY (pid,topic),
	FOREIGN KEY (pid) REFERENCES person(pid),
	FOREIGN KEY (topic) REFERENCES keywords(topic)
);


-- Member_of
create table member_of(
	pid varchar(30),
	sectionid integer,
	PRIMARY KEY (pid,sectionid),
	FOREIGN KEY (pid) REFERENCES student(pid),
	FOREIGN KEY (sectionid) REFERENCES section(sectionid)
);


-- multivalued attribute representing role in section
create table role_in(
	pid varchar(30),
	sectionid integer,
	role varchar(30),
	PRIMARY KEY (pid,sectionid,role),
	FOREIGN KEY (pid,sectionid) REFERENCES member_of(pid,sectionid)
);


-- Sign_up
create table sign_up(
	pid varchar(30),
	id integer,
	PRIMARY KEY (pid,id),
	FOREIGN KEY (pid) REFERENCES person(pid),
	FOREIGN KEY (id) REFERENCES idea(id)
);

-- Sponsored_by (only needed if idea can be co-sponsored)
-- create table sponsored_by(
-- 	clubid integer,
-- 	id integer,
-- 	PRIMARY KEY (clubid, id),
-- 	FOREIGN KEY (clubid) REFERENCES club(clubid),
-- 	FOREIGN KEY (id) REFERENCES event(id)
-- );


-- Club_topics
create table section_topics(
	sectionid integer,
	topic varchar(100),
	PRIMARY KEY (sectionid, topic),
	FOREIGN KEY (sectionid) REFERENCES section(sectionid),
	FOREIGN KEY (topic) REFERENCES keywords(topic)
);

-- Comment
create table comment(
	comment_id integer auto_increment,
	commenter varchar(30),
	ctext varchar(255),
	is_public_c boolean,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (commenter) REFERENCES person(pid)
);

-- idea comment
create table idea_comment(
	comment_id integer,
	id integer,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
	FOREIGN KEY (id) REFERENCES idea(id)
);

-- section comment
create table section_comment(
	comment_id integer,
	sectionid integer,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
	FOREIGN KEY (sectionid) REFERENCES section(sectionid)
);
--  Person Table 
INSERT INTO person (pid, passwd, fname, lname) VALUES ('25', md5('xx'), 'XX', 'XX');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('1', md5('1234'), 'Ariana', 'Anastos');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('10', md5('1234'), 'Wilso', 'Valcarcel');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('11', md5('1234'), 'Mary', 'Smith');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('12', md5('1234'), 'Linda', 'White');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('13', md5('1234'), 'Maris', 'Turner');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('14', md5('1234'), 'Susa', 'Harris');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('15', md5('1234'), 'Lisa', 'Hall');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('16', md5('1234'), 'Joh', 'Smith');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('17', md5('1234'), 'Robert', 'White');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('18', md5('1234'), 'Richard', 'Turner');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('19', md5('1234'), 'James', 'Smith');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('2', md5('1234'), 'Vincent', 'Fong');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('20', md5('1234'), 'Joseph', 'Lee');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('3', md5('1234'), 'Daniel', 'Geng');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('4', md5('1234'), 'Andrew', 'Kang');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('5', md5('1234'), 'David', 'Li');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('6', md5('1234'), 'Kenny', 'Lai');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('7', md5('1234'), 'Yati', 'Ta');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('8', md5('1234'), 'Pedro', 'Tu');
INSERT INTO person (pid, passwd, fname, lname) VALUES ('9', md5('1234'), 'Perry', 'Valotia');
;
;
-- instructor table;
INSERT INTO instructor (pid, phone) VALUES ('14', '3971569756');
INSERT INTO instructor (pid, phone) VALUES ('16', '5689226485');
INSERT INTO instructor (pid, phone) VALUES ('3', '4258696532');
INSERT INTO instructor (pid, phone) VALUES ('5', '4569875478');
INSERT INTO instructor (pid, phone) VALUES ('9', '4987256985');
;
;
-- Student Table;
INSERT INTO student (pid, gender, class) VALUES ('25', 'Female', 'Senior');
INSERT INTO student (pid, gender, class) VALUES ('1', 'Female', 'Freshma');
INSERT INTO student (pid, gender, class) VALUES ('10', 'Male', 'Senior');
INSERT INTO student (pid, gender, class) VALUES ('11', 'Female', 'Freshma');
INSERT INTO student (pid, gender, class) VALUES ('12', 'Female', 'Sophomore');
INSERT INTO student (pid, gender, class) VALUES ('13', 'Female', 'Junior');
INSERT INTO student (pid, gender, class) VALUES ('15', 'Female', 'Freshma');
INSERT INTO student (pid, gender, class) VALUES ('17', 'Male', 'Junior');
INSERT INTO student (pid, gender, class) VALUES ('18', 'Male', 'Sophomore');
INSERT INTO student (pid, gender, class) VALUES ('19', 'Male', 'Freshma');
INSERT INTO student (pid, gender, class) VALUES ('2', 'Male', 'Sophomore');
INSERT INTO student (pid, gender, class) VALUES ('20', 'Male', 'Freshma');
INSERT INTO student (pid, gender, class) VALUES ('4', 'Male', 'Senior');
INSERT INTO student (pid, gender, class) VALUES ('6', 'Female', 'Senior');
INSERT INTO student (pid, gender, class) VALUES ('7', 'Female', 'Sophomore');
INSERT INTO student (pid, gender, class) VALUES ('8', 'Male', 'Junior');
;
;
-- section Table;
-- SET IDENTITY_INSERT INTO section ON ;
INSERT INTO section (sectionid, cname, descr) VALUES (6, 'Theater section', 'Theater section founded in 2000 ');
INSERT INTO section (sectionid, cname, descr) VALUES (7, 'Frisbee section', 'section for Frisbee lovers');
INSERT INTO section (sectionid, cname, descr) VALUES (8, 'Oxford Blues section', 'Oxford Blues working your linguistics');
INSERT INTO section (sectionid, cname, descr) VALUES (9, 'Robotics section', 'Robotics and more');
-- SET IDENTITY_INSERT INTO section OFF;
;
;
-- instructor_Of Table;
INSERT INTO instructor_of (pid, sectionid) VALUES ('14', 6);
INSERT INTO instructor_of (pid, sectionid) VALUES ('14', 8);
INSERT INTO instructor_of (pid, sectionid) VALUES ('16', 7);
INSERT INTO instructor_of (pid, sectionid) VALUES ('3', 6);
INSERT INTO instructor_of (pid, sectionid) VALUES ('3', 8);
INSERT INTO instructor_of (pid, sectionid) VALUES ('5', 7);
INSERT INTO instructor_of (pid, sectionid) VALUES ('5', 9);
INSERT INTO instructor_of (pid, sectionid) VALUES ('9', 8);
INSERT INTO instructor_of (pid, sectionid) VALUES ('9', 9);
;
;
-- idea Table;
-- SET IDENTITY_INSERT INTO idea ON ;
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (1, 'Spring Gala', 'evening of dining and entertainment ', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (2, 'Fall Benefit', 'celebrate the extraordinary career  of renowned directors', CAST('2015-05-16 00:00:00.000' AS DateTime),  1);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (3, 'Spring Youth (U14) League', 'Frisbee section hosting a Youth League this spring', CAST('2015-05-16 00:00:00.000' AS DateTime), 1);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (4, 'FC Annual summit', 'FC section annual summit ', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (5, 'Spring Kickoff', 'Robotics section Spring Quarter Kickoff', CAST('2015-05-17 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (6, 'Robot Block Party', ' Hosting this years Robot Block Party at Stanford', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (7, 'Yard sale', 'Yard sale in Regna Lounge', CAST('2015-05-16 00:00:00.000' AS DateTime),  1);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (8, 'Square Book', 'Christopher Scotton at Off Square Books', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (9, 'Secret Meeting', 'Illuminati Bi-Quarterly Report', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
INSERT INTO idea (id, ename, description, edatetime,  is_active) VALUES (10, 'Floor Cleaning', 'Abandoned Area', CAST('2015-05-16 00:00:00.000' AS DateTime),  0);
-- SET IDENTITY_INSERT INTO idea OFF;
;
;
-- Keywords Table;
INSERT INTO keywords (topic) VALUES ('Accent');
INSERT INTO keywords (topic) VALUES ('Acting');
INSERT INTO keywords (topic) VALUES ('Dancing');
INSERT INTO keywords (topic) VALUES ('Drama');
INSERT INTO keywords (topic) VALUES ('Electronics');
INSERT INTO keywords (topic) VALUES ('Engineering');
INSERT INTO keywords (topic) VALUES ('Expert systems');
INSERT INTO keywords (topic) VALUES ('Frisbee');
INSERT INTO keywords (topic) VALUES ('Gala');
INSERT INTO keywords (topic) VALUES ('Language ');
INSERT INTO keywords (topic) VALUES ('Leauge');
INSERT INTO keywords (topic) VALUES ('Linguistics');
INSERT INTO keywords (topic) VALUES ('Machine Learning');
INSERT INTO keywords (topic) VALUES ('Oxford');
INSERT INTO keywords (topic) VALUES ('Robotics');
INSERT INTO keywords (topic) VALUES ('Sports');
INSERT INTO keywords (topic) VALUES ('Stage Play');
INSERT INTO keywords (topic) VALUES ('Theater');
INSERT INTO keywords (topic) VALUES ('Vocabulary');
INSERT INTO keywords (topic) VALUES ('Elephantology');
INSERT INTO keywords (topic) VALUES ('Assisted Microprobiotics');

;
-- Interested_In Table;
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Acting');
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Engineering');
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Vocabulary');
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Machine Learning');
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Robotics');
INSERT INTO interested_in (pid, topic) VALUES ('25', 'Assisted Microprobiotics');
INSERT INTO interested_in (pid, topic) VALUES ('1', 'Accent');
INSERT INTO interested_in (pid, topic) VALUES ('1', 'Acting');
INSERT INTO interested_in (pid, topic) VALUES ('1', 'Dancing');
INSERT INTO interested_in (pid, topic) VALUES ('1', 'Sports');
INSERT INTO interested_in (pid, topic) VALUES ('10', 'Frisbee');
INSERT INTO interested_in (pid, topic) VALUES ('10', 'Robotics');
INSERT INTO interested_in (pid, topic) VALUES ('10', 'Theater');
INSERT INTO interested_in (pid, topic) VALUES ('11', 'Sports');
INSERT INTO interested_in (pid, topic) VALUES ('12', 'Leauge');
INSERT INTO interested_in (pid, topic) VALUES ('12', 'Linguistics');
INSERT INTO interested_in (pid, topic) VALUES ('12', 'Machine Learning');
INSERT INTO interested_in (pid, topic) VALUES ('13', 'Electronics');
INSERT INTO interested_in (pid, topic) VALUES ('13', 'Leauge');
INSERT INTO interested_in (pid, topic) VALUES ('13', 'Vocabulary');
INSERT INTO interested_in (pid, topic) VALUES ('15', 'Engineering');
INSERT INTO interested_in (pid, topic) VALUES ('15', 'Theater');
INSERT INTO interested_in (pid, topic) VALUES ('17', 'Expert systems');
INSERT INTO interested_in (pid, topic) VALUES ('18', 'Accent');
INSERT INTO interested_in (pid, topic) VALUES ('19', 'Vocabulary');
INSERT INTO interested_in (pid, topic) VALUES ('2', 'Stage Play');
INSERT INTO interested_in (pid, topic) VALUES ('20', 'Drama');
INSERT INTO interested_in (pid, topic) VALUES ('4', 'Robotics');
INSERT INTO interested_in (pid, topic) VALUES ('6', 'Gala');
INSERT INTO interested_in (pid, topic) VALUES ('7', 'Acting');
INSERT INTO interested_in (pid, topic) VALUES ('8', 'Robotics');
;
-- Member_Of Table;
INSERT INTO member_of (pid, sectionid) VALUES ('25', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('25', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('25', 8);


INSERT INTO member_of (pid, sectionid) VALUES ('1', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('1', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('10', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('10', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('10', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('11', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('12', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('12', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('12', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('13', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('13', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('13', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('15', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('15', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('17', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('17', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('17', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('18', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('18', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('19', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('2', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('20', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('20', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('4', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('4', 8);
INSERT INTO member_of (pid, sectionid) VALUES ('6', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('6', 9);
INSERT INTO member_of (pid, sectionid) VALUES ('7', 6);
INSERT INTO member_of (pid, sectionid) VALUES ('8', 7);
INSERT INTO member_of (pid, sectionid) VALUES ('8', 8);
;
;
-- Role_In table;

INSERT INTO role_in (pid, sectionid, role) VALUES ('10', 7, 'President');
INSERT INTO role_in (pid, sectionid, role) VALUES ('12', 8, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('12', 8, 'Treasurer');
INSERT INTO role_in (pid, sectionid, role) VALUES ('25', 8, 'Treasurer');
INSERT INTO role_in (pid, sectionid, role) VALUES ('13', 7, 'Treasurer');
INSERT INTO role_in (pid, sectionid, role) VALUES ('15', 6, 'Treasurer');
INSERT INTO role_in (pid, sectionid, role) VALUES ('17', 6, 'President');
INSERT INTO role_in (pid, sectionid, role) VALUES ('18', 8, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('2', 6, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('20', 6, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('25', 6, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('25', 9, 'Admin');
INSERT INTO role_in (pid, sectionid, role) VALUES ('6', 9, 'President');
INSERT INTO role_in (pid, sectionid, role) VALUES ('8', 8, 'President');
;
;
-- Sign_up Table;
INSERT INTO sign_up (pid, id) VALUES ('25', 1);

INSERT INTO sign_up (pid, id) VALUES ('25', 5);

INSERT INTO sign_up (pid, id) VALUES ('25', 6);

INSERT INTO sign_up (pid, id) VALUES ('1', 8);
INSERT INTO sign_up (pid, id) VALUES ('10', 1);
INSERT INTO sign_up (pid, id) VALUES ('10', 4);
INSERT INTO sign_up (pid, id) VALUES ('10', 5);
INSERT INTO sign_up (pid, id) VALUES ('10', 6);
INSERT INTO sign_up (pid, id) VALUES ('10', 7);
INSERT INTO sign_up (pid, id) VALUES ('11', 8);
INSERT INTO sign_up (pid, id) VALUES ('12', 5);
INSERT INTO sign_up (pid, id) VALUES ('12', 7);
INSERT INTO sign_up (pid, id) VALUES ('13', 2);
INSERT INTO sign_up (pid, id) VALUES ('13', 3);
INSERT INTO sign_up (pid, id) VALUES ('13', 5);
INSERT INTO sign_up (pid, id) VALUES ('13', 6);
INSERT INTO sign_up (pid, id) VALUES ('14', 1);
INSERT INTO sign_up (pid, id) VALUES ('14', 2);
INSERT INTO sign_up (pid, id) VALUES ('14', 7);
INSERT INTO sign_up (pid, id) VALUES ('14', 8);
INSERT INTO sign_up (pid, id) VALUES ('15', 1);
INSERT INTO sign_up (pid, id) VALUES ('15', 4);
INSERT INTO sign_up (pid, id) VALUES ('15', 8);
INSERT INTO sign_up (pid, id) VALUES ('16', 4);
INSERT INTO sign_up (pid, id) VALUES ('16', 8);
INSERT INTO sign_up (pid, id) VALUES ('17', 1);
INSERT INTO sign_up (pid, id) VALUES ('17', 6);
INSERT INTO sign_up (pid, id) VALUES ('18', 3);
INSERT INTO sign_up (pid, id) VALUES ('19', 3);
INSERT INTO sign_up (pid, id) VALUES ('19', 4);
INSERT INTO sign_up (pid, id) VALUES ('19', 8);
INSERT INTO sign_up (pid, id) VALUES ('2', 2);
INSERT INTO sign_up (pid, id) VALUES ('20', 1);
INSERT INTO sign_up (pid, id) VALUES ('20', 2);
INSERT INTO sign_up (pid, id) VALUES ('20', 7);
INSERT INTO sign_up (pid, id) VALUES ('3', 1);
INSERT INTO sign_up (pid, id) VALUES ('3', 2);
INSERT INTO sign_up (pid, id) VALUES ('3', 8);
INSERT INTO sign_up (pid, id) VALUES ('5', 3);
INSERT INTO sign_up (pid, id) VALUES ('5', 6);
INSERT INTO sign_up (pid, id) VALUES ('5', 8);
INSERT INTO sign_up (pid, id) VALUES ('6', 5);
INSERT INTO sign_up (pid, id) VALUES ('6', 6);
INSERT INTO sign_up (pid, id) VALUES ('6', 8);
INSERT INTO sign_up (pid, id) VALUES ('8', 8);
INSERT INTO sign_up (pid, id) VALUES ('9', 5);
INSERT INTO sign_up (pid, id) VALUES ('9', 7);
;

-- section_Topics Table ;
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Acting');
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Dancing');
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Drama');
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Gala');
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Stage Play');
INSERT INTO section_topics (sectionid, topic) VALUES (6, 'Theater');
INSERT INTO section_topics (sectionid, topic) VALUES (7, 'Frisbee');
INSERT INTO section_topics (sectionid, topic) VALUES (7, 'Engineering');
INSERT INTO section_topics (sectionid, topic) VALUES (7, 'Robotics');


INSERT INTO section_topics (sectionid, topic) VALUES (7, 'Sports');
INSERT INTO section_topics (sectionid, topic) VALUES (8, 'Language ');
INSERT INTO section_topics (sectionid, topic) VALUES (8, 'Linguistics');
INSERT INTO section_topics (sectionid, topic) VALUES (8, 'Oxford');
INSERT INTO section_topics (sectionid, topic) VALUES (8, 'Vocabulary');
INSERT INTO section_topics (sectionid, topic) VALUES (9, 'Electronics');
INSERT INTO section_topics (sectionid, topic) VALUES (9, 'Engineering');
INSERT INTO section_topics (sectionid, topic) VALUES (9, 'Machine Learning');
INSERT INTO section_topics (sectionid, topic) VALUES (9, 'Robotics');



-- Comment Table;
-- SET IDENTITY_INSERT INTO comment ON ;
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (1, '1', 'Nice gala rounds', 1);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (2, '1', 'Do we have any upcoming play ', 0);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (3, '20', 'Anyone using Ardrino', 0);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (4, '20', 'Interested in dance classes any suggestion ', 0);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (5, '4', 'Reeally od collection of books', 1);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (6, '8', 'We should have more yard sales ', 1);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (7, '13', 'What are the Min dimensions of robots', 0);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (8, '25', 'Secret Comment', 0);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (9, '25', 'Im here as well', 1);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (10, '25', 'What a great idea!', 1);
INSERT INTO comment (comment_id, commenter, ctext, is_public_c) VALUES (11, '25','Can you read this?', 0);
-- SET IDENTITY_INSERT INTO comment OFF;


-- section_Comment Table;
INSERT INTO section_comment (comment_id, sectionid) VALUES (2, 6);
INSERT INTO section_comment (comment_id, sectionid) VALUES (3, 9);
INSERT INTO section_comment (comment_id, sectionid) VALUES (4, 6);
INSERT INTO section_comment (comment_id, sectionid) VALUES (8, 6);
INSERT INTO section_comment (comment_id, sectionid) VALUES (9, 6);


-- idea_Comment Table;
INSERT INTO idea_comment (comment_id, id) VALUES (1, 1);
INSERT INTO idea_comment (comment_id, id) VALUES (5, 7);
INSERT INTO idea_comment (comment_id, id) VALUES (6, 7);
INSERT INTO idea_comment (comment_id, id) VALUES (7, 5);
INSERT INTO idea_comment (comment_id, id) VALUES (10, 5);
INSERT INTO idea_comment (comment_id, id) VALUES (11, 9);






