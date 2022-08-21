--****PLEASE ENTER YOUR DETAILS BELOW****
--T5-rm-alter.sql

--Student ID: 31190057
--Student Name: Ong Li Ching
--Unit Code: FIT3171
--Applied Class No: Tutorial 02

/* Comments for your marker:




*/

drop procedure event_registration;

--5(a)
create or replace trigger check_add_enrolment
    before insert on entry
    for each row
    
    declare val number;
    begin
        select count(*) into val from entry natural join event where comp_no = :new.comp_no and carn_date = (select carn_date from event where event_id=:new.event_id);
        if (val >= 1)
            then raise_application_error(-20000, 'competitor has already enrolled in an event in the carnival');
        end if;
    end;
    /

    
-- Test Harness for 5(a) --

--test case 1: a competitor tries to enrolled in the same event in the same carnival 
--before
select * from entry;
--executing trigger
--insert entry for event 4
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    4,
    5,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('09:05','HH:MI'),
    1
);
--after
--raise error

--test case 2: a competitor tries to enrolled in a different event in the same carnival 
--before
select * from entry;
--executing trigger
--insert entry in evenr 13
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    13,
    3,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('09:05','HH:MI'),
    13
);
--raise error

--test case 3: a competitor tries to enrolled in an event in a different carnival 
--before
select * from entry;
--executing trigger
--insert entry in event 14
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    14,
    5,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('09:05','HH:MI'),
    10
);
--after
select event_id, entry_no, comp_no, carn_date 
    from entry natural join event 
    where comp_no = 10;

rollback;

--5(b)
ALTER TABLE eventtype
    ADD eventtype_record         NUMERIC(6,2)
    ADD eventtype_recordholder   NUMERIC(5);

COMMENT ON COLUMN eventtype.eventtype_record IS
    'Fastest elapsed time for each event type';

COMMENT ON COLUMN eventtype.eventtype_recordholder IS
    'Unique identifier for a competitor who holds the record';

update eventtype
    set eventtype_record = (select min_elapsed_time from (select eventtype_code, min(elapsed_time) as min_elapsed_time from entry natural join event group by eventtype_code) where eventtype_code = eventtype.eventtype_code);
    
update eventtype
    set eventtype_recordholder = (select comp_no from (select comp_no from entry where elapsed_time = eventtype.eventtype_record and eventtype_code = eventtype.eventtype_code) where rownum = 1);

create or replace trigger check_fastest_elapsed_time
    before insert on entry
    for each row
    declare highest_record number;
    begin
        update entry
            set elapsed_time = (:new.entry_finishtime - :new.entry_starttime) * 24 * 60 where event_id = :new.event_id and entry_no = :new.entry_no;
        
        select eventtype_record into highest_record from eventtype where eventtype_code = (select eventtype_code from event where event_id = :new.event_id);
        if ((:new.entry_finishtime - :new.entry_starttime) * 24 * 60 < highest_record) then
            update eventtype
                set eventtype_record = (:new.entry_finishtime - :new.entry_starttime) * 24 * 60 where eventtype_code = (select eventtype_code from event where event_id = :new.event_id);
            update eventtype
                set eventtype_recordholder = :new.comp_no where eventtype_code = (select eventtype_code from event where event_id = :new.event_id);
        end if;
    end;
    /


-- Test harness for 5(b)

--test case 1: new elapsed time is slower than current eventtype_record time 
--before
select * from eventtype;
--executing trigger
--insert a new entry into event 11 
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    11,
    3,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('12:55','HH:MI'),
    100
);
--after
select * from eventtype;


--test case 2: new elapsed time is faster than current eventtype_record time 
--before
select * from eventtype;
--executing trigger
--insert a new entry into event 11 
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    comp_no
) VALUES (
    11,
    4,
    TO_DATE('07:30','HH:MI'),
    TO_DATE('8:00','HH:MI'),
    101
);
--after
select * from eventtype;

rollback;
  

--5(c)
create or replace procedure event_registration (
    input_comp_no         in NUMERIC, 
    input_carn_date       in DATE, 
    input_eventtype_desc  in VARCHAR2, 
    input_team_name       in VARCHAR2,
    out_message           out VARCHAR2
    ) as 
        count_event       number;
        count_eventtype   number;
        count_carn        number;
        count_team        number;
        val_event_id      number;
        val_entry_no      number;
        count_member      number;
    begin
        select count(*) into count_carn from carnival where carn_date = input_carn_date;
        select count(*) into count_eventtype from eventtype where eventtype_desc = input_eventtype_desc;
        select count(*) into count_team from team where team_name = input_team_name and carn_date = input_carn_date;
        select count(*) into count_event from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date;
        
        if (count_carn = 0) then 
            out_message := 'Invalid carnival date. New event registration process cancelled';
        else
            if (count_eventtype = 0) then 
                out_message := 'Invalid event name. New event registration process cancelled';
            else
                if (count_event = 0) then 
                    out_message := 'Registering carnival does not have this event. New event registration process cancelled';
                
                else
                    --select event_id into val_event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date;
                    --select max(entry_no) into val_entry_no from entry where event_id = val_event_id;
                       
                    insert into entry (
                        event_id,
                        entry_no,
                        comp_no
                    )
                    values (
                        (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date),
                        1+(select max(entry_no) from entry where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date)),
                        input_comp_no
                    );
                    
                    if (count_team = 0) then 
                         insert into team (
                            team_id,
                            team_name,
                            carn_date,
                            team_no_members,
                            event_id,
                            entry_no
                         ) values (
                            team_id_seq.nextval,
                            input_team_name,
                            input_carn_date,
                            1,
                            (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date),
                            (select max(entry_no) from entry where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date))
                         );
                         
                         update entry
                            set team_id = team_id_seq.currval where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date)
                                                                    and entry_no =  (select max(entry_no) from entry where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date));
                    else
                        update entry
                            set team_id = (select team_id from team where team_name = input_team_name) 
                                where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date)
                                    and entry_no =  (select max(entry_no) from entry where event_id = (select event_id from event where eventtype_code = (select eventtype_code from eventtype where eventtype_desc = input_eventtype_desc) and carn_date = input_carn_date));
                        
                        update team
                            set team_no_members = (select team_no_members from team where team_name = input_team_name) + 1
                                where team_name = input_team_name;
                                
                    end if;
                          
                    out_message := 'New event registration process successful'; 
                
                end if;
            end if;
        end if;
        
            
    end event_registration;
    /

-- Test Harness for 5(c)
--set serveroutput on;

--test case 1
--before
select count(*) from entry;
select count(*) from team;
--execute the procedure 
--insert entry 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid carnival date
    event_registration (100, to_date('02/Oct/2021','DD/Mon/YYYY'), '10 Km Run', 'Starlight', output);
    dbms_output.put_line(output);
END;
/
--after
select count(*) from entry;
select count(*) from team;

--test case 2
--before
select count(*) from entry;
select count(*) from team;
--execute the procedure 
--insert entry 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid event name
    event_registration (100, to_date('01/Oct/2021','DD/Mon/YYYY'), '500 Km Run', 'Starlight', output);
    dbms_output.put_line(output);
END;
/
--after
select count(*) from entry;
select count(*) from team;

--test case 3
--before
select count(*) from entry;
select count(*) from team;
--execute the procedure 
--insert entry 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - valid event name and valid carnival date but on that carnival date, carnival does not have the event 
    event_registration (101, to_date('01/Oct/2021','DD/Mon/YYYY'), '3 Km Community Run/Walk', 'Starlight', output);
    dbms_output.put_line(output);
END;
/
--after
select count(*) from entry;
select count(*) from team;

--test case 4
--before
select count(*) from entry;
select count(*) from team;
--execute the procedure 
--insert entry 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - valid inputs and team does not exist
    event_registration (100, to_date('01/OCT/2021','DD/MON/YYYY'), '10 Km Run', 'Starlight', output);
    dbms_output.put_line(output);
END;
/
--after
select count(*) from entry;
select count(*) from team;
select * from entry where comp_no = 100;
select * from team where team_name = 'Starlight' and carn_date = to_date('01/Oct/2021','DD/Mon/YYYY');
select * from team;
select * from entry;

--test case 5
--before
select count(*) from entry;
select count(*) from team;
--execute the procedure 
--insert entry 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - valid inputs and team exists
    event_registration (100, to_date('14/MAR/2022', 'DD/MON/YYYY'), '3 Km Community Run/Walk', 'Lightning Reapers', output);
    dbms_output.put_line(output);
END;
/
--after
select count(*) from entry;
select count(*) from team;
select * from entry where comp_no = 100;
select * from team;

rollback;
