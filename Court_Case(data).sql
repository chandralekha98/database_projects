create database court;
use court;

CREATE TABLE court_case (case_description varchar(25) not null,case_id INT(4) not null, primary key (case_id));

INSERT INTO court_case VALUES ('criminal case', 5);
INSERT INTO court_case VALUES ('divorse case', 1);
INSERT INTO court_case VALUES ('theft', 2);
INSERT INTO court_case VALUES ('harrasment', 4);

select * from court_case;

CREATE TABLE court (
  city    varchar(15) not null, 
  zipcode    varchar(15) not null,
  address      char(9),
  case_id  INT(10),
  court_name varchar(20),
  court_id INT(4) not null,
  primary key (court_id),
  foreign key (case_id) references court_case(case_id)
);

INSERT INTO court VALUES ('dayton', '45410-0A','Ohio',5, 'High Court', 1);
INSERT INTO court VALUES ('columbus', '45410-0B','Ohio',1, 'High Court', 2);
INSERT INTO court VALUES ('columbus', '45410-0B','Ohio',1, 'Supreme Court', 3);
INSERT INTO court VALUES ('cleveland', '45410-0C','Ohio',4, 'High Court', 4);
INSERT INTO court VALUES ('medina', '45410-0F','Ohio',2, 'Supreme Court', 5);

select * from court;

CREATE TABLE clients (
  fname    varchar(15) not null, 
  lname    varchar(15) not null,
  address  varchar(50),
  sex      char,
  client_id   INT(10),
  case_id INT(4),
  primary key (client_id),
  foreign key (case_id) references court_case(case_id)
);

INSERT INTO clients VALUES ('chandra', 'chilu','Ohio','F', 1, 2);
INSERT INTO clients VALUES ('pratyusha', 'B','Ohio','F', 2, 2);
INSERT INTO clients VALUES ('mahima', 'G','California','M', 3, 5);
INSERT INTO clients VALUES ('rohit', 'G','NewYork','M', 4, 1);

select * from clients;

CREATE TABLE attorney (
  attorney_id   INT(4),
  attorney_name varchar(15), 
  address  varchar(50),
  case_id INT(4),
  primary key (attorney_id),
  foreign key (case_id) references court_case(case_id)
);

INSERT INTO attorney VALUES (111, 'John','Ohio', 5);
INSERT INTO attorney VALUES (122,'Caleb','Ohio', 5);
INSERT INTO attorney VALUES (123,'Caleb','Ohio', 1);
INSERT INTO attorney VALUES (124,'Vivek','Columbus', 4);
INSERT INTO attorney VALUES (125,'Caleb','Medina', 2);

select * from attorney;

CREATE TABLE bar_council (
  attorney_general      varchar(25) not null,
  attorney_id    INT(4),
  bar_council_id  INT(4),
  primary key (bar_council_id),
  foreign key (attorney_id) references attorney(attorney_id)
);

INSERT INTO bar_council VALUES ('John',111,1);
INSERT INTO bar_council VALUES ('Caleb',123,2);

CREATE TABLE judge (
  judge_id     INT(10),
  judge_name varchar(15),
  address   varchar(50),
  in_service INT(2),
  court_id  INT(4),
  primary key (judge_id),
  foreign key (court_id) references court(court_id)
);
 
INSERT INTO judge VALUES (22,'Russel','Dayton',10, 1);
INSERT INTO judge VALUES (11,'Phillip','Columbus',5, 5);
INSERT INTO judge VALUES (33,'Emanuel','Medina',25, 3);
INSERT INTO judge VALUES (44,'Devi','Medina',30, 4);
INSERT INTO judge VALUES (55,'Michael','Cleveland',12, 2);

select * from judge;