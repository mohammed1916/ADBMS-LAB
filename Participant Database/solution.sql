\echo ************Create Event Table
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY,
    Event_Name VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Duration INT
);

\echo ************Create Participant Details Table
CREATE TABLE Participant_Details (
    Event_ID INT,
    Artist_Name VARCHAR(255),
    No_Participants INT
);

\echo ************Insert Sample Data into Event Table
INSERT INTO Event (Event_ID, Event_Name, Start_Date, End_Date, Duration)
VALUES
    (1, 'Solo singing', '2019-05-02', '2019-05-05', 4),
    (2, 'Solo dance', '2019-05-02', '2019-05-07', 6),
    (3, 'Debate', '2019-05-03', '2019-05-02', 1),
    (4, 'Skit', '2019-05-02', '2019-05-07', 6),
    (5, 'Stand-up Comedy', '2019-05-03', '2019-05-05', 3);

\echo ************Insert Sample Data into Participant Details Table
INSERT INTO Participant_Details (Event_ID, Artist_Name, No_Participants)
VALUES
    (1, 'PG', 30),
    (1, 'NUR', 25),
    (2, 'NUR', 25),
    (2, 'PG', 20),
    (1, 'JrKG', 40),
    (3, 'NUR', 20),
    (2, 'JrKG', 30),
    (4, 'NUR', 30),
    (4, 'NUR', 30),
    (4, 'JrKG', 30),
    (5, 'ABC', 50),
    (5, 'NUR', 35);

\echo ************Implement Check Constraint for Start Date and End Date
ALTER TABLE Event
ADD CONSTRAINT Start_End_Check CHECK (Start_Date <= End_Date);

\echo ************Implement Check Constraint for No_Participants (two-digit number)
ALTER TABLE Participant_Details
ADD CONSTRAINT No_Participants_Check CHECK (No_Participants >= 10 AND No_Participants <= 99);

\echo ************Queries

\echo ************a) Arrange the event table entries in decreasing order based on duration.
SELECT * FROM Event
ORDER BY Duration DESC;

\echo ************b) Display the average participants who have attended the event of the artist 'Nur'.
SELECT AVG(No_Participants) AS Average_Participants
FROM Participant_Details
WHERE Artist_Name = 'NUR';

\echo ************c) Display the event ID which has the maximum number of participants of the artist 'Jr. KG'.
SELECT Event_ID
FROM Participant_Details
WHERE Artist_Name = 'JrKG'
GROUP BY Event_ID
HAVING COUNT(*) = (
    SELECT MAX(Count_JrKG)
    FROM (
        SELECT Event_ID, COUNT(*) AS Count_JrKG
        FROM Participant_Details
        WHERE Artist_Name = 'JrKG'
        GROUP BY Event_ID
    ) AS Subquery
);

\echo ************d) Get artist IDs who have performed at least three events.
SELECT Artist_Name
FROM Participant_Details
GROUP BY Artist_Name
HAVING COUNT(DISTINCT Event_ID) >= 3;

\echo ************e) Get event IDs that have performed events on the same date.
SELECT Event_Date, STRING_AGG(Event_ID::TEXT, ', ') AS Event_IDs
FROM (
    SELECT Event_ID, Start_Date::DATE AS Event_Date
    FROM Event
    UNION ALL
    SELECT Event_ID, End_Date::DATE AS Event_Date
    FROM Event
) AS Combined
GROUP BY Event_Date
HAVING COUNT(*) > 1;

\echo ************PL/SQL Procedure

\echo ************Create a PL/SQL Procedure to Accept Start Date and End Date and Print Event IDs
CREATE OR REPLACE PROCEDURE GetEventsByDateRange(start_date_param DATE, end_date_param DATE)
LANGUAGE plpgsql
AS $$
DECLARE
    event_record RECORD;
BEGIN
    FOR event_record IN (SELECT Event_ID FROM Event WHERE Start_Date >= start_date_param AND End_Date <= end_date_param) LOOP
        RAISE INFO 'Event ID: %', event_record.Event_ID;
    END LOOP;
END;
$$;




\echo ************Usage of the Procedure
CALL GetEventsByDateRange('2019-05-03'::DATE, '2019-05-07'::DATE);

\echo ************Trigger

\echo ************Create a Trigger That Writes Event Details
CREATE OR REPLACE FUNCTION Event_Insert_Trigger() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Event_Log (Event_ID, Event_Name, Start_Date, End_Date, Duration)
    VALUES (NEW.Event_ID, NEW.Event_Name, NEW.Start_Date, NEW.End_Date, NEW.Duration);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

\echo ************Create a Trigger on the Event Table
CREATE TRIGGER Event_Insert
AFTER INSERT ON Event
FOR EACH ROW
EXECUTE FUNCTION Event_Insert_Trigger();

CREATE TABLE Event_Log(
    Event_ID INT PRIMARY KEY,
    Event_Name VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Duration INT
);

\echo ************usage of trigger Event_Insert
INSERT INTO Event (Event_ID, Event_Name, Start_Date, End_Date, Duration)
VALUES (6, 'Drawing', '2019-05-02', '2019-05-07', 6);


