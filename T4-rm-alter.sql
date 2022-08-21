--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-alter.sql

--Student ID: 31190057
--Student Name: Ong Li Ching
--Unit Code: FIT3171
--Applied Class No: Tutorial 02

/* Comments for your marker:
4(a)
* Total number of minutes is 1440 and total number of seconds in a minute is 60. Hence, it has a precision of 6 and scale of 2. 
* entry_finishtime - entry_starttime will return the difference in days. We need to multiply by 24 to get the difference in hours and then multiply by 60 to get the difference in minutes. 

4(b)
* Create a new table because a team can support multiple charity, hence multivalue.
* Percentage of total raised funds that goes to each charity has a percision of 3 and scale of 1. It is a percision of 3 because the maximum is 100.

4(c)
* comp_no attribute can be null because not all officials are competitors.

*/

DROP TABLE team_charity CASCADE CONSTRAINTS;
DROP TABLE carnival_official CASCADE CONSTRAINTS;
DROP TABLE official CASCADE CONSTRAINTS;
DROP TABLE role CASCADE CONSTRAINTS;

--4(a)
ALTER TABLE entry 
    ADD elapsed_time NUMBER(6,2);

COMMENT ON COLUMN entry.elapsed_time IS
    'The entrant elapsed time (finish time - start time)';

UPDATE entry
    SET elapsed_time = (entry_finishtime - entry_starttime) * 24 * 60;
    
commit;  

--4(b)
CREATE TABLE team_charity (
    team_id              NUMERIC(3) NOT NULL,
    char_id              NUMERIC(3) NOT NULL,
    raised_funds_pct     NUMERIC(4,1)
);


COMMENT ON COLUMN team_charity.team_id IS
    'Team identifier (unique)';

COMMENT ON COLUMN team_charity.char_id IS
    'Charity unique identifier';
    
ALTER TABLE team_charity ADD CONSTRAINT team_charity_pk PRIMARY KEY ( team_id,char_id );

ALTER TABLE team_charity
    ADD CONSTRAINT team_team_charity FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );

ALTER TABLE team_charity
    ADD CONSTRAINT charity_team_charity FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

commit;
 
--4(c)
CREATE TABLE carnival_official (
    carn_date        DATE NOT NULL,
    official_no      NUMERIC(3) NOT NULL,
    role_no          NUMERIC(3) NOT NULL
);

COMMENT ON COLUMN carnival_official.carn_date IS
    'Date of carnival (unique identifier)';
    
COMMENT ON COLUMN carnival_official.official_no IS
    'Unique identifier for an official';

COMMENT ON COLUMN carnival_official.role_no IS
    'Role unique identifier';

ALTER TABLE carnival_official ADD CONSTRAINT carnival_official_pk PRIMARY KEY ( carn_date,official_no );

CREATE TABLE official (
    official_no      NUMERIC(3) NOT NULL,
    comp_no          NUMERIC(3)
);

COMMENT ON COLUMN official.official_no IS
    'Unique identifier for an official';

COMMENT ON COLUMN official.comp_no IS
    'Unique identifier for a competitor';

ALTER TABLE official ADD CONSTRAINT official_pk PRIMARY KEY ( official_no );

CREATE TABLE role (
    role_no          NUMERIC(3) NOT NULL,
    role_desc        VARCHAR2(50)
);

COMMENT ON COLUMN role.role_no IS
    'Role unique identifier';
    
COMMENT ON COLUMN role.role_desc IS
    'Description of a role';

ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY ( role_no );

--All FK constraints
ALTER TABLE official
    ADD CONSTRAINT competitor_official FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );

ALTER TABLE carnival_official
    ADD CONSTRAINT carnival_carnival_official FOREIGN KEY ( carn_date )
        REFERENCES carnival ( carn_date );

ALTER TABLE carnival_official
    ADD CONSTRAINT official_carnival_official FOREIGN KEY ( official_no )
        REFERENCES official ( official_no );

ALTER TABLE carnival_official
    ADD CONSTRAINT role_carnival_official FOREIGN KEY ( role_no )
        REFERENCES role ( role_no );

commit;
