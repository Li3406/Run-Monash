--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-rm-insert.sql

--Student ID: 31190057
--Student Name: Ong Li Ching
--Unit Code: FIT3171
--Applied Class No: Tutorial 02

/* Comments for your marker:




*/

-- Task 2 Load the EMERCONTACT, COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- EMERCONTACT
-- =======================================

INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '6146352202',
    'Abijah',
    'Stepan'
);

commit;

INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '6118886616',
    'Iaris',
    'Mandawuy'
);

commit;

INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '6144002522',
    'Isha',
    'Natalia'
);

commit;

INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '6117522348',
    'Wekesa',
    'Elli'
);

commit;

INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '6118889222',
    'Elea',
    'Klaus'
);

commit;

-- =======================================
-- COMPETITOR
-- =======================================

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    1,
    'Abijah',
    'Stepan',
    'M',
    TO_DATE('03/May/2002', 'DD/MON/YYYY'),
    'cscp19233@gmail.com',
    'Y',
    '6146352202',
    'F',
    '6118886616'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    2,
    'Iaris',
    'Mandawuy',
    'M',
    TO_DATE('15/May/2001', 'DD/MON/YYYY'),
    'crawpi@gmail.com',
    'Y',
    '6118886616',
    'F',
    '6146352202'
);

commit;


INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    3,
    'Karen',
    'Robert',
    'M',
    TO_DATE('20/Dec/2002', 'DD/MON/YYYY'),
    'karenkaren@gmail.com',
    'Y',
    '6107164897',
    'F',
    '6146352202'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    4,
    'Elea',
    'Klaus',
    'F',
    TO_DATE('4/Dec/1974', 'DD/MON/YYYY'),
    'raulmar@gmail.com',
    'Y',
    '6118889222',
    'F',
    '6146352202'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    5,
    'Raul',
    'Marway',
    'M',
    TO_DATE('20/Mar/1974', 'DD/MON/YYYY'),
    'eleakla@gmail.com',
    'N',
    '6118886874',
    'T',
    '6118889222'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    6,
    'Danil',
    'Marway',
    'F',
    TO_DATE('30/Jul/2005', 'DD/MON/YYYY'),
    'daniilkonef@gmail.com',
    'N',
    '6117553748',
    'P',
    '6118889222'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    7,
    'Jeff',
    'Marway',
    'F',
    TO_DATE('10/Nov/2006', 'DD/MON/YYYY'),
    'jeffmar@gmail.com',
    'N',
    '6109889963',
    'P',
    '6118889222'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    8,
    'Wekesa',
    'Elli',
    'M',
    TO_DATE('6/Jun/2006', 'DD/MON/YYYY'),
    'rodney11@gmail.com',
    'Y',
    '6117522348',
    'G',
    '6118889222'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    9,
    'Minnie',
    'Sloan',
    'F',
    TO_DATE('11/Nov/2000', 'DD/MON/YYYY'),
    'msloan11@gmail.com',
    'Y',
    '6144000775',
    'F',
    '6117522348'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    10,
    'Alisha',
    'Ali',
    'F',
    TO_DATE('12/Apr/2002', 'DD/MON/YYYY'),
    'alishyyy5678@gmail.com',
    'Y',
    '6144002125',
    'F',
    '6117522348'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    11,
    'Jo',
    'Dunn',
    'M',
    TO_DATE('19/May/2001', 'DD/MON/YYYY'),
    'jdunn@gmail.com',
    'Y',
    '6184706878',
    'F',
    '6117522348'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    12,
    'R',
    'S',
    'U',
    TO_DATE('01/Apr/2000', 'DD/MON/YYYY'),
    'isavage00@gmail.com',
    'Y',
    '6175170974',
    'F',
    '6117522348'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    13,
    'Isha',
    'Natalia',
    'F',
    TO_DATE('02/Feb/1980', 'DD/MON/YYYY'),
    'isyn@gmail.com',
    'Y',
    '6144002522',
    'F',
    '6118886616'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    14,
    'Madelynfranciscaddlehartlaurie',
    'Thatcherlevinesolaceelshercalm',
    'M',
    TO_DATE('15/Mar/1971', 'DD/MON/YYYY'),
    'thatcherlevinesolaceelshercalm0123456789@gmail.com',
    'Y',
    '6188241491',
    'T',
    '6144002522'
);

commit;

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone,
    comp_ec_relationship,
    ec_phone
) VALUES (
    15,
    'Avisfrederickhalelangstonelrod',
    'Thatcherlevinesolaceelshercalm',
    'F',
    TO_DATE('31/Dec/2000', 'DD/MON/YYYY'),
    'avisfrederickhalelangstonelrod123456789@gmail.com',
    'Y',
    '6169797452',
    'P',
    '6144002522'
);

commit;

-- =======================================
-- ENTRY
-- =======================================

--carnival on 24 Sep 2021
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    1,
    1,
    TO_DATE('08:00','HH:MI'),
    TO_DATE('11:30','HH:MI'),
    1
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    1,
    2,
    TO_DATE('08:30','HH:MI'),
    TO_DATE('10:30','HH:MI'),
    2
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    2,
    1,
    TO_DATE('07:25','HH:MI'),
    TO_DATE('11:45','HH:MI'),
    6
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    2,
    2,
    TO_DATE('07:25','HH:MI'),
    TO_DATE('09:45','HH:MI'),
    7
);

commit;

--carnival on 01 Oct 2021
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    3,
    1,
    TO_DATE('08:00','HH:MI'),
    TO_DATE('09:55','HH:MI'),
    8
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    3,
    2,
    TO_DATE('08:05','HH:MI'),
    TO_DATE('10:25','HH:MI'),
    9
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    3,
    3,
    TO_DATE('08:10','HH:MI'),
    TO_DATE('10:35','HH:MI'),
    10
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    4,
    1,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('09:05','HH:MI'),
    1
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    4,
    2,
    TO_DATE('07:05','HH:MI'),
    TO_DATE('11:35','HH:MI'),
    2
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    4,
    3,
    TO_DATE('07:15','HH:MI'),
    TO_DATE('12:25','HH:MI'),
    5
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    5,
    1,
    TO_DATE('07:25','HH:MI'),
    TO_DATE('09:25','HH:MI'),
    3
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    5,
    2,
    TO_DATE('07:30','HH:MI'),
    TO_DATE('11:45','HH:MI'),
    4
);

commit;

--carnival on 05 Feb 2022
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    6,
    1,
    TO_DATE('07:40','HH:MI'),
    TO_DATE('10:15','HH:MI'),
    4
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no,
    char_id
) VALUES (
    6,
    2,
    TO_DATE('07:45','HH:MI'),
    TO_DATE('09:25','HH:MI'),
    11,
    2
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no,
    char_id
) VALUES (
    7,
    1,
    TO_DATE('07:50','HH:MI'),
    TO_DATE('11:35','HH:MI'),
    1,
    3
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no,
    char_id
) VALUES (
    7,
    2,
    TO_DATE('07:55','HH:MI'),
    TO_DATE('12:00','HH:MI'),
    2,
    4
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    8,
    1,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('08:45','HH:MI'),
    8
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    8,
    2,
    TO_DATE('07:05','HH:MI'),
    TO_DATE('11:00','HH:MI'),
    5
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no,
    char_id
) VALUES (
    9,
    1,
    TO_DATE('07:10','HH:MI'),
    TO_DATE('12:05','HH:MI'),
    6,
    2
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    9,
    2,
    TO_DATE('07:15','HH:MI'),
    TO_DATE('11:05','HH:MI'),
    10
);

commit;

--carnival on 14 Mar 2022

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    10,
    1,
    TO_DATE('07:20','HH:MI'),
    TO_DATE('12:45','HH:MI'),
    3
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    10,
    2,
    TO_DATE('07:25','HH:MI'),
    TO_DATE('11:20','HH:MI'),
    6
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    11,
    1,
    TO_DATE('07:30','HH:MI'),
    TO_DATE('12:30','HH:MI'),
    8
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    11,
    2,
    TO_DATE('07:35','HH:MI'),
    TO_DATE('10:00','HH:MI'),
    11
);

commit;

--carnival on 29 May 2022

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    12,
    1,
    TO_DATE('08:00','HH:MI'),
    TO_DATE('11:00','HH:MI'),
    1
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    12,
    2,
    TO_DATE('08:05','HH:MI'),
    TO_DATE('11:40','HH:MI'),
    4
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    13,
    1,
    TO_DATE('08:10','HH:MI'),
    TO_DATE('11:55','HH:MI'),
    9
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    13,
    2,
    TO_DATE('08:15','HH:MI'),
    TO_DATE('12:30','HH:MI'),
    11
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    comp_no
) VALUES (
    14,
    1,
    13
);

commit;

INSERT INTO entry (
    event_id,
    entry_no,
    comp_no
) VALUES (
    14,
    2,
    15
);

commit;

-- =======================================
-- TEAM
-- =======================================

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no,
    char_id 
) VALUES (
    1,
    'Hot Reapers',
    TO_DATE('01/OCT/2021', 'DD/MON/YYYY'),
    3,
    3, 
    2,
    1
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = 1 where event_id = 3 and entry_no = 2;
UPDATE entry set team_id = 1 where event_id = 3 and entry_no = 3;
UPDATE entry set team_id = 1 where event_id = 5 and entry_no = 1;

ALTER TABLE entry enable constraint team_entry;

commit;

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no
) VALUES (
    2,
    'Toxic Stars',
    TO_DATE('05/FEB/2022', 'DD/MON/YYYY'),
    4,
    6, 
    2
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = 2 where event_id = 6 and entry_no = 2;
UPDATE entry set team_id = 2 where event_id = 9 and entry_no = 1;
UPDATE entry set team_id = 2 where event_id = 7 and entry_no = 1;
UPDATE entry set team_id = 2 where event_id = 7 and entry_no = 2;

ALTER TABLE entry enable constraint team_entry;

commit;

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no
) VALUES (
    3,
    'Hot Reapers',
    TO_DATE('05/FEB/2022', 'DD/MON/YYYY'),
    1,
    8, 
    2
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = 3 where event_id = 8 and entry_no = 2;

ALTER TABLE entry enable constraint team_entry;

commit;

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no
) VALUES (
    4,
    'Lightning Reapers',
    TO_DATE('14/MAR/2022', 'DD/MON/YYYY'),
    2,
    10, 
    2
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = 4 where event_id = 10 and entry_no = 2;
UPDATE entry set team_id = 4 where event_id = 11 and entry_no = 1;

ALTER TABLE entry enable constraint team_entry;

commit;

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no,
    char_id
) VALUES (
    5,
    'Dream Rebels',
    TO_DATE('29/MAY/2022', 'DD/MON/YYYY'),
    1,
    12, 
    2,
    4
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = 5 where event_id = 12 and entry_no = 2;

ALTER TABLE entry enable constraint team_entry;


commit;
