-- This file allow to write SQL commands that will be emitted in test and dev.
-- The commands are commented as their support depends oN the database
-- insert into myentity (id, field) values(1, 'field-1');
-- insert into myentity (id, field) values(2, 'field-2');
-- insert into myentity (id, field) values(3, 'field-3');
-- alter sequence myentity_seq restart with 4;

DROP SEQUENCE IF EXISTS OCCUPATION_ID_SEQ;
DROP TABLE IF EXISTS OCCUPATION;
DROP SEQUENCE IF EXISTS STAFF_ID_SEQ;
DROP TABLE IF EXISTS STAFF;

CREATE SEQUENCE IF NOT EXISTS OCCUPATION_ID_SEQ
    START 1
    INCREMENT BY 1
    NO MAXVALUE
    CACHE 1;

CREATE TABLE OCCUPATION (
    ID INTEGER NOT NULL ,
    NAME VARCHAR(100) NOT NULL,
    ABBREVIATION VARCHAR(10),
    PRIMARY KEY (ID)
);

CREATE SEQUENCE STAFF_ID_SEQ
    START 1
    INCREMENT BY 1
    NO MAXVALUE
    CACHE 1;

CREATE TABLE STAFF (
    ID INTEGER NOT NULL,
    TITLE VARCHAR(50),
    FIRST_NAME VARCHAR(80),
    LAST_NAME  VARCHAR(80),
    EMAIL VARCHAR(100),
    WORK_PHONE VARCHAR(15),
--     MOBILE_PHONE VARCHAR(15),
    DESCRIPTION JSONB,
    ACCREDITATIONS JSONB,
    SPOKEN_LANGUAGES JSONB,
    AVAILABILITY JSONB,
    DOCTOR BOOLEAN DEFAULT FALSE,
    BOOKING_ALLOWED BOOLEAN,
    BOOKING_ID VARCHAR(50),
    OCCUPATION_ID INT,
    ENABLED BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (ID),
    FOREIGN KEY(OCCUPATION_ID) REFERENCES OCCUPATION(ID)

);

insert into OCCUPATION(ID, NAME, ABBREVIATION)
values (nextval('OCCUPATION_ID_SEQ'), 'Doctor','Dr');
insert into OCCUPATION(ID, NAME, ABBREVIATION)
values (nextval('OCCUPATION_ID_SEQ'), 'Practice Manager','Pm');
insert into OCCUPATION(ID, NAME, ABBREVIATION)
values (nextval('OCCUPATION_ID_SEQ'), 'Nursing Manager','Nm');
insert into OCCUPATION(ID, NAME, ABBREVIATION)
values (nextval('OCCUPATION_ID_SEQ'), 'Practice Nurse','Pn');
insert into OCCUPATION(ID, NAME, ABBREVIATION)
values (nextval('OCCUPATION_ID_SEQ'), 'Receptionist','');


insert into STAFF(ID, TITLE, FIRST_NAME, LAST_NAME, EMAIL, WORK_PHONE, DESCRIPTION, ACCREDITATIONS, SPOKEN_LANGUAGES, AVAILABILITY, DOCTOR, BOOKING_ALLOWED, BOOKING_ID, OCCUPATION_ID, ENABLED)
values (nextval('STAFF_ID_SEQ'),
        'Ms',
        'Carmen',
        'Padilla',
        'abc@gmail.com',
        '0427313048',
        '["Dr. Padilla has been a General Practitioner in the Wodonga area for 10 years.", "Carmen has a special interest in women’s health, children''s health, chronic disease management and men’s health."]',
        '["FRACGP", "MBBS", "Diploma of Child Heath"]',
        '["English", "Spanish"]',
        null,
        true,
        true,
        'dr-carmen-padilla-1',
        1 ,
        true);

insert into STAFF(ID, TITLE, FIRST_NAME, LAST_NAME, EMAIL, WORK_PHONE, DESCRIPTION, ACCREDITATIONS, SPOKEN_LANGUAGES, AVAILABILITY, DOCTOR, BOOKING_ALLOWED, BOOKING_ID, OCCUPATION_ID, ENABLED)
values (nextval('STAFF_ID_SEQ'),
        'Ms',
        'Liz',
        'Caunt',
        'cbd@gmail.com',
        '0427313049',
        '["Our administration Team is managed by our Practice Manager Liz.", "Liz has extensive experience working in health management, and believes that patient care is a priority of the practice.", "She is very passionate about maintaining a high level of Customer Service for the patients of doctors we support and will maintain open lines of communication."]',
        '["Advanced Diploma in Business Management ", "Justice of the Peace."]',
        '["English"]',
        null,
        false,
        false,
        null,
        2,
        true);
