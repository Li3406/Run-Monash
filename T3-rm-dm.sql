--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 31190057
--Student Name: Ong Li Ching
--Unit Code: FIT3171
--Applied Class No: Tutorial 02

/* Comments for your marker:
There is no event start time and end time for Entry entries of Daniel and Annabelle as they are registering only



*/

--3(a)

DROP SEQUENCE comp_no_seq;
    
DROP SEQUENCE team_id_seq;

CREATE SEQUENCE comp_no_seq
    INCREMENT BY 1
    START WITH 100;
    
CREATE SEQUENCE team_id_seq
    INCREMENT BY 1
    START WITH 100;
    
--3(b)
INSERT INTO emercontact (
    ec_phone,
    ec_fname,
    ec_lname
) VALUES (
    '0476541234',
    'Jack',
    'Kai'
);

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
    comp_no_seq.nextval,
    'Daniel',
    'Kai',
    'M',
    TO_DATE('12/Apr/1999', 'DD/MON/YYYY'),
    'danicor@gmail.com',
    'Y',
    '0107728423',
    'P',
    '0476541234'
);

INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    char_id
) VALUES (
    (SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')),
    1 + (SELECT MAX(entry_no) FROM entry WHERE event_id = (SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))),
    comp_no_seq.currval,
    (SELECT char_id FROM charity WHERE char_name = 'Beyond Blue')
);


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
    comp_no_seq.nextval,
    'Annabelle',
    'Kai',
    'F',
    TO_DATE('13/May/2002', 'DD/MON/YYYY'),
    'anna1249@gmail.com',
    'Y',
    '0118893229',
    'P',
    '0476541234'
);

INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    char_id
) VALUES (
    (SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')),
    1 + (SELECT MAX(entry_no) FROM entry WHERE event_id = (SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))),
    comp_no_seq.currval,
    (SELECT char_id FROM charity WHERE char_name = 'Amnesty International')
);

commit;

--3(c)
INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    team_no_members,
    event_id,
    entry_no,
    char_id
) VALUES (
    team_id_seq.nextval,
    'Kai Speedstars',
    (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'),
    1,
    (SELECT event_id FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai')),
    (SELECT entry_no FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai')),
    (SELECT char_id FROM charity WHERE char_name = 'Beyond Blue')
);

ALTER TABLE entry disable constraint team_entry;

UPDATE entry set team_id = team_id_seq.currval
    where event_id = (SELECT event_id FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'))
    and entry_no = (SELECT entry_no FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'));

ALTER TABLE entry enable constraint team_entry;

commit;

--3(d)

INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    team_id
) VALUES (
    (SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '10 Km Run')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')),
    1 + (SELECT MAX(entry_no) FROM entry WHERE event_id = (SELECT event_id FROM event 
            WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '10 Km Run')
            and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))),
    (SELECT comp_no FROM competitor WHERE comp_fname = 'Daniel' and comp_lname = 'Kai'),
    (SELECT team_id FROM team WHERE team_name = 'Kai Speedstars')
);

DELETE FROM entry 
    WHERE event_id = (SELECT event_id 
                        FROM event 
                        WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon') 
                                and carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))
            and comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Daniel' and comp_lname = 'Kai');

commit;

--3(e)

DELETE FROM entry
    WHERE event_id IN (SELECT event_id 
                        FROM event 
                        WHERE carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')
                                and comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Daniel' and comp_lname = 'Kai'));

UPDATE entry SET team_id = null
    WHERE event_id = (SELECT event_id FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'))
        and entry_no = (SELECT entry_no FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'));

UPDATE entry SET char_id = (SELECT char_id FROM charity WHERE char_name = 'Beyond Blue')
    WHERE event_id = (SELECT event_id FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'))
        and entry_no = (SELECT entry_no FROM entry WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' and comp_lname = 'Kai'));

DELETE FROM team
    WHERE team_name = 'Kai Speedstars';

commit;
