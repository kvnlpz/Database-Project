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
    unique_num   INT(20)     NOT NULL,
    name            VARCHAR(50) NOT NULL,
    telephone       INT(10)     NOT NULL,
    office_location VARCHAR(50) NOT NULL,
    chair_person    VARCHAR(20) NOT NULL,
    UNIQUE (unique_num)
);



CREATE TABLE course
(
    unique_number       INT(20)     NOT NULL,
    course_title        VARCHAR(50) NOT NULL,
    textbook            VARCHAR(50) NOT NULL,
    units               INT(50)     NOT NULL,
    prerequisite_course VARCHAR(50) NOT NULL,
    UNIQUE (unique_number)
);


CREATE TABLE sections
(
    sec_ssn        INT(20)     NOT NULL,
    course_num     INT(20)    NOT NULL,
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
    student_id        INT         NOT NULL,
    enroll_sec             INT(20)     NOT NULL,
    enroll_course      INT(20)     NOT NULL,
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

INSERT INTO Department (unique_num, name, telephone, office_location, chair_person)
VALUES ('101', 'CSE', '8083494548', 'ECS', 'Billy Maze'),
       ('102', 'ECE', '6154477067', 'ECS', 'pauly shore');

INSERT INTO professor (social_security_number, name, telephone_number, sex, title, salary,
                       college_degrees, street_address, city, state, zip_code)
VALUES ('932909873', 'BILLY MAZE', '8083494548', 'M', 'cse', '25000', 'PhD', 'Test street', 'Orange', 'CA', '97801'),
       ('673389297', 'PAULY SHORE', '6154477067', 'M', 'ece', '25000', 'PhD', 'test street road', 'Orange', 'CA','97801'),
       ('325140640', 'Annie Lederman', '3441741309', 'F', 'cse', '40000', 'PhD', 'test street', 'Orange', 'CA', '97801');

INSERT INTO course (unique_number, course_title, textbook, units, prerequisite_course)
VALUES ('501', 'C', 'C early Objects', '3', '10'),
       ('502', 'Java', 'HeadFirst Java', '3', '4'),
       ('503', 'DBMS', 'Happy SQL', '3', '5'),
       ('504', 'php', 'The PHP Bible', '3', '10');

INSERT INTO sections (sec_ssn,course_num, section_number, class_room, meeting_days, beginning_time, ending_time, seats)
VALUES ('932909873','501', '402', 'CS101', 'MW', '1PM', '2PM', '50'),
       ('932909873','502', '403', 'CS102', 'MWF', '2PM', '3PM', '60'),
       ('673389297','501', '404', 'CS103', 'TUTHU', '1PM', '2PM', '40'),
       ('673389297','502', '405', 'CS104', 'MW', '3PM', '4PM', '43'),
       ('325140640','503', '406', 'CS105', 'MWTF', '1PM', '2PM', '35'),
       ('325140640','504', '407', 'CS106', 'THU', '2PM', '3PM', '60');


INSERT INTO record (student_id,  enroll_sec,  enroll_course, grade)
VALUES ('374329797', '402', '501','A'),
       ('788177019', '402', '501','B'),
       ('162577960', '403', '502','D'),
       ('759598028', '405', '503', 'A'),
       ('567090220', '402','501', 'A'),
       ('638549896', '403','502', 'A'),
       ('866804103', '405','503', 'A'),
       ('841119866', '406','504', 'A'),
       ('374329797', '407','504', 'B'),
       ('788177019', '405','503', 'A'),
       ('162577960', '403','502', 'B'),
       ('759598028', '402','501', 'C'),
       ('567090220', '402','501', 'A'),
       ('638549896', '403','502', 'B'),
       ('866804103', '406','504', 'A'),
       ('841119866', '405','503', 'A'),
       ('567090220', '402','501', 'B'),
       ('841119866', '403','502', 'C'),
       ('374329797', '405','503', 'A'),
       ('162577960', '407','504', 'B');

SELECT social_security_number, course_title, class_room, meeting_days, beginning_time, ending_time
FROM professor,
     sections,
     course
WHERE social_security_number = $SSN
AND sec_ssn = social_security_number
AND course_num = unique_number;

 SELECT grade, COUNT(*) as 'Count'
 FROM record, course, sections
 WHERE unique_number = course_num
 AND enroll_course = course_num
 AND enroll_sec = section_number
 AND section_number =$SEC
 AND unique_number = $course
 GROUP BY grade;


SELECT unique_number, class_room, meeting_days, COUNT(student) days
FROM course,
     sections,
     record;

SELECT campus_wide_id, title, grade
FROM student,
     course,
     record;



