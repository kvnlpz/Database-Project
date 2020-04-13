CREATE TABLE professor
(
    social_security_number INT(20)      NOT NULL,
    name                   VARCHAR(100) NOT NULL,
    telephone_number       INT(10)      NOT NULL,
    sex                    VARCHAR(1)   NOT NULL,
    title                  VARCHAR(10)  NOT NULL,
    salary                 INT(100)     NOT NULL,
    college_degrees        VARCHAR(50)  NOT NULL,
    street_address         VARCHAR(20)  NOT NULL,
    city                   VARCHAR(20)  NOT NULL,
    state                  VARCHAR(20)  NOT NULL,
    zip_code               INT(6)       NOT NULL
)
;



CREATE TABLE Department
(
    unique_number   INT(20)     NOT NULL,
    name            VARCHAR(50) NOT NULL,
    telephone       INT(10)     NOT NULL,
    office_location VARCHAR(50) NOT NULL,
    chair_person    VARCHAR(20) NOT NULL,
    UNIQUE (unique_number)
);



CREATE TABLE course
(
    unique_number       INT(20)     NOT NULL,
    title               VARCHAR(50) NOT NULL,
    textbook            VARCHAR(50) NOT NULL,
    units               INT(50)     NOT NULL,
    prerequisite_course VARCHAR(50) NOT NULL,
    UNIQUE (unique_number)
);


CREATE TABLE sections
(
    section_number INT(20)     NOT NULL,
    class_room     VARCHAR(30) NOT NULL,
    meeting_days   VARCHAR(20) NOT NULL,
    beginning_time VARCHAR(4)     NOT NULL,
    ending_time    VARCHAR(4)     NOT NULL,
    seats          INT(20)     NOT NULL
);



CREATE TABLE student
(
    campus_wide_id   INT         NOT NULL,
    first_name       VARCHAR(20) NOT NULL,
    last_name        VARCHAR(11) NOT NULL,
    telephone_number INT         NOT NULL,
    address          VARCHAR(50) NOT NULL
);

CREATE TABLE record
(
    student        VARCHAR(20) NOT NULL,
    course_section VARCHAR(50) NOT NULL,
    grade          VARCHAR(2)  NOT NULL
);



INSERT INTO student (campus_wide_id, first_name, last_name, telephone_number, address)
VALUES ('374329797', 'Kevin', 'lopez', '1523641898', 'Orange'),
       ('788177019', 'alvin', 'chipmunk', '5125238315', 'Orange'),
       ('162577960', 'samantha', 'lee', '0745584187', 'Orange'),
       ('759598028', 'ericka', 'macias', '5429361758', 'Orange'),
       ('567090220', 'chris', 'delia', '0721869140', 'Orange'),
       ('638549896', 'theo', 'von', '9609695446', 'Orange'),
       ('866804103', 'joey', 'diaz', '9352151304', 'Orange'),
       ('841119866', 'brendan', 'schaub', '9201232927', 'Orange');

INSERT INTO Department (unique_number, name, telephone, office_location, chair_person)
VALUES ('101', 'CSE', '8083494548', 'ECS', 'Billy Maze'),
       ('102', 'ECE', '6154477067', 'ECS', 'pauly shore');

INSERT INTO professor (social_security_number, name, telephone_number, sex, title, salary,
                       college_degrees, street_address, city, state, zip_code)
VALUES ('932909873', 'BILLY MAZE', '8083494548', 'M', 'cse', '25000', 'PhD', 'Test street', 'Orange', 'CA', '97801'),
       ('673389297', 'PAULY SHORE', '6154477067', 'M', 'ece', '25000', 'PhD', 'test street road', 'Orange', 'CA','97801'),
       ('325140640', 'Annie Lederman', '3441741309', 'F', 'cse', '40000', 'PhD', 'test street', 'Orange', 'CA', '97801');

INSERT INTO course (unique_number, title, textbook, units, prerequisite_course)
VALUES ('501', 'C', 'C early Objects', '3', '10'),
       ('502', 'Java', 'HeadFirst Java', '3', '4'),
       ('503', 'DBMS', 'Happy SQL', '3', '5'),
       ('504', 'php', 'The PHP Bible', '3', '10');

INSERT INTO sections (section_number, class_room, meeting_days, beginning_time, ending_time, seats)
VALUES ('402', 'CS101', 'MW', '1PM', '2PM', '50'),
       ('403', 'CS102', 'MWF', '2PM', '3PM', '60'),
       ('404', 'CS103', 'TUTHU', '1PM', '2PM', '40'),
       ('405', 'CS104', 'MW', '3PM', '4PM', '43'),
       ('406', 'CS105', 'MWTF', '1PM', '2PM', '35'),
       ('407', 'CS106', 'THU', '2PM', '3PM', '60');

INSERT INTO record (student, course_section, grade)
VALUES ('gilbert', 'cse', 'A'),
       ('george', 'ece', 'A'),
       ('khalyla', 'ece', 'D'),
       ('andrew', 'me', 'A'),
       ('eddie', 'ece', 'A'),
       ('derick', 'cse', 'A'),
       ('cattien', 'ece', 'A'),
       ('Bert', 'ece', 'A'),
       ('Tom', 'cse', 'B'),
       ('Christina', 'cse', 'A'),
       ('Ennie', 'me', 'B'),
       ('jessica', 'me', 'C'),
       ('drew', 'civil', 'A'),
       ('brian', 'civil', 'B'),
       ('stevie', 'ece', 'A'),
       ('Lee', 'ece', 'A'),
       ('David', 'cse', 'B'),
       ('erik', 'cse', 'C'),
       ('josh', 'me', 'A'),
       ('will', 'me', 'B');

SELECT social_security_number, title, class_room, meeting_days, beginning_time, ending_time
FROM professor,
     sections;

SELECT unique_number, section_number, count(student)
FROM course,
     sections,
     student,
     record;

SELECT unique_number, class_room, meeting_days, COUNT(student) days
FROM course,
     sections,
     record;

SELECT campus_wide_id, title, grade
FROM student,
     course,
     record;



