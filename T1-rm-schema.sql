--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-rm-schema.sql

--Student ID: 31190057
--Student Name: Ong Li Ching
--Unit Code: FIT3171
--Applied Class No: Tutorial 02

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no                NUMERIC(5) NOT NULL,
    comp_fname             VARCHAR2(30),
    comp_lname             VARCHAR2(30),
    comp_gender            CHAR(1) NOT NULL,
    comp_dob               DATE NOT NULL,
    comp_email             VARCHAR2(50) NOT NULL,
    comp_unistatus         CHAR(1) NOT NULL,
    comp_phone             CHAR(10) NOT NULL,
    comp_ec_relationship   CHAR(1) NOT NULL,
    ec_phone               CHAR(10) NOT NULL
);

COMMENT ON COLUMN competitor.comp_no IS
    'Unique identifier for a competitor';

COMMENT ON COLUMN competitor.comp_fname IS 
    'Competitors first name';

COMMENT ON COLUMN competitor.comp_lname IS 
    'Competitors last name';

COMMENT ON COLUMN competitor.comp_gender IS 
    'Competitors gender (M for male, F for female, or U for Undisclosed)';

COMMENT ON COLUMN competitor.comp_dob IS 
    'Competitors date of birth';

COMMENT ON COLUMN competitor.comp_email IS 
    'Competitors email';

COMMENT ON COLUMN competitor.comp_unistatus IS 
    'Competitors university student/staff status (Y for Yes or N for No)';

COMMENT ON COLUMN competitor.comp_phone IS 
    'Competitors phone number';

COMMENT ON COLUMN competitor.comp_ec_relationship IS 
    'Emergency contact relationship to competitor (P for Parent, G for Guardian, T for Partner, or F for Friend)';

COMMENT ON COLUMN competitor.ec_phone IS
    'Emergency contacts phone number (unique identifier)';


ALTER TABLE competitor ADD CONSTRAINT competitor_pk PRIMARY KEY ( comp_no );

ALTER TABLE competitor ADD CONSTRAINT comp_gender_check CHECK (comp_gender IN ( 'M', 'F', 'U' ));

ALTER TABLE competitor ADD CONSTRAINT comp_unistatus_check CHECK (comp_unistatus IN ( 'Y', 'N' ));

ALTER TABLE competitor ADD CONSTRAINT comp_ec_relationship_check CHECK (comp_ec_relationship IN ( 'P', 'G', 'T', 'F' ));


-- EMERCONTACT
CREATE TABLE emercontact (
    ec_phone     CHAR(10) NOT NULL,
    ec_fname     VARCHAR2(30),
    ec_lname     VARCHAR2(30)
);

COMMENT ON COLUMN emercontact.ec_phone IS
    'Emergency contacts phone number (unique identifier)';

COMMENT ON COLUMN emercontact.ec_fname IS
    'Emergency contacts first name';


COMMENT ON COLUMN emercontact.ec_lname IS
    'Emergency contacts last name';

ALTER TABLE emercontact ADD CONSTRAINT emercontact_pk PRIMARY KEY ( ec_phone );


--ENTRY
CREATE TABLE entry (
    event_id            NUMERIC(6) NOT NULL,
    entry_no            NUMERIC(5) NOT NULL,
    entry_starttime     DATE,
    entry_finishtime    DATE,
    comp_no             NUMERIC(5) NOT NULL,
    team_id             NUMERIC(3),
    char_id             NUMERIC(3)
);

COMMENT ON COLUMN entry.event_id IS
    'Event id (surrogate primary key)';

COMMENT ON COLUMN entry.entry_no IS
    'Entry number (unique for each event)';

COMMENT ON COLUMN entry.entry_starttime IS
    'The entrant start time';

COMMENT ON COLUMN entry.entry_finishtime IS
    'The entrant finish time';

COMMENT ON COLUMN entry.comp_no IS
    'Unique identifier for a competitor';
    
COMMENT ON COLUMN entry.team_id IS
    'Team identifier (unique)';

COMMENT ON COLUMN entry.char_id IS
    'Charity unique identifier';

ALTER TABLE entry ADD CONSTRAINT entry_pk PRIMARY KEY ( event_id, entry_no );


--TEAM
CREATE TABLE team (
    team_id            NUMERIC(3) NOT NULL,
    team_name          VARCHAR(30) NOT NULL,
    carn_date          DATE NOT NULL,
    team_no_members    NUMERIC(2) NOT NULL,
    event_id           NUMERIC(6) NOT NULL,
    entry_no           NUMERIC(5) NOT NULL,
    char_id            NUMERIC(3) 
);

COMMENT ON COLUMN team.team_id IS
    'Team identifier (unique)';

COMMENT ON COLUMN team.team_name IS
    'Team name';

COMMENT ON COLUMN team.carn_date IS
    'Date of carnival (unique identifier)';

COMMENT ON COLUMN team.team_no_members IS
    'Number of team members';
    
COMMENT ON COLUMN team.event_id IS
    'Event id (surrogate primary key)';

COMMENT ON COLUMN team.entry_no IS
    'Entry number (unique for each event)';

COMMENT ON COLUMN charity.char_id IS
    'Charity unique identifier';


ALTER TABLE team ADD CONSTRAINT team_pk PRIMARY KEY ( team_id );

ALTER TABLE team ADD CONSTRAINT team_uq UNIQUE ( team_name,carn_date );


-- Add all missing FK Constraints below here
ALTER TABLE competitor
    ADD CONSTRAINT emercontact_competitor FOREIGN KEY ( ec_phone )
        REFERENCES emercontact ( ec_phone );

ALTER TABLE entry
    ADD CONSTRAINT event_entry FOREIGN KEY ( event_id )
        REFERENCES event ( event_id );
        
ALTER TABLE entry
    ADD CONSTRAINT competitor_entry FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );

ALTER TABLE entry
    ADD CONSTRAINT team_entry FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );

ALTER TABLE entry
    ADD CONSTRAINT charity_entry FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

--ALTER TABLE team
--    ADD CONSTRAINT event_team FOREIGN KEY ( event_id )
--        REFERENCES entry ( event_id );
        
ALTER TABLE team
    ADD CONSTRAINT entry_team FOREIGN KEY ( event_id, entry_no )
        REFERENCES entry ( event_id, entry_no );

ALTER TABLE team
    ADD CONSTRAINT charity_team FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

ALTER TABLE team
    ADD CONSTRAINT carnival_team FOREIGN KEY (carn_date)
        REFERENCES carnival (carn_date);

commit;
