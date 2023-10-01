\echo ****************** Create Flight_Master table
CREATE TABLE Flight_Master (
    Airline_Name VARCHAR(255),
    Aeroplane_No VARCHAR(5) CHECK (Aeroplane_No ~ '[A-Za-z]{1}\d{3}'),
    Flight_Date DATE CHECK (Flight_Date IS NOT NULL),
    Airfare INT,
    Seats INT
);

\echo ****************** Create Schedule_Master table
CREATE TABLE Schedule_Master (
    Airline_Name VARCHAR(255),
    Aeroplane_No VARCHAR(5),
    Departure_City VARCHAR(255),
    Arrival_City VARCHAR(255),
    Time TIME,
    Distance INT
);

\echo ****************** Implement check constraint for Flight_Date
ALTER TABLE Flight_Master ADD CONSTRAINT Flight_Date_Check CHECK (Flight_Date IS NOT NULL);

\echo ****************** Implement check constraint for Aeroplane_No format
ALTER TABLE Flight_Master ADD CONSTRAINT Aeroplane_No_Check CHECK (Aeroplane_No ~ '[A-Za-z]{1}\d{3}');



INSERT INTO Flight_Master (Airline_Name, Aeroplane_No, Flight_Date, Airfare, Seats)
VALUES
    ('Kingfisher', 'K100', '2018-04-03', 500, 50),
    ('Jet Airways', 'J250', '2018-05-25', 700, 100),
    ('Sahara', 'SA300', '2019-02-06', 1000, 250),
    ('Air India', 'A999', '2017-05-27', 900, 350),
    ('Spice', 'SP740', '2020-07-07', 300, 90),
    ('Sahara', 'SA300', '2018-03-12', 800, 250),
    ('Kingfisher', 'K100', '2019-04-07', 600, 50),
    ('Kingfisher', 'K200', '2019-04-12', 1200, 700);

INSERT INTO Schedule_Master (Airline_Name, Aeroplane_No, Departure_City, Arrival_City, Time, Distance)
VALUES
    ('Kingfisher', 'K100', 'Delhi', 'Washington', '09:00', 250),
    ('Sahara', 'S300', 'Chennai', 'Delhi', '10:00', 600),
    ('Kingfisher', 'K200', 'Pune', 'London', '23:00', 1780),
    ('Spice', 'S740', 'Delhi', 'Pune', '00:30', 300),
    ('Air India', 'A999', 'Pune', 'Bangalore', '02:00', 700);




\echo ****************** Query 1: Retrieve Flight_Date from Flight_Master where Airline_Name does not have Departure_City as Delhi in Schedule_Master.
SELECT FM.Flight_Date
FROM Flight_Master FM
WHERE FM.Airline_Name NOT IN (
    SELECT SM.Airline_Name
    FROM Schedule_Master SM
    WHERE SM.Departure_City = 'Delhi'
);


\echo ****************** Query 2: Retrieve Aeroplane_No from Schedule_Master whose departure city is the same as the Aeroplane_No "A999".
SELECT SM.Aeroplane_No
FROM Schedule_Master SM
WHERE SM.Departure_City IN (
    SELECT SM2.Departure_City
    FROM Schedule_Master SM2
    WHERE SM2.Aeroplane_No =  'A999'
) AND SM.Aeroplane_No != 'A999';


\echo ****************** Query 3: Get all pairs of Aeroplane_No from Schedule_Master such that their Departure_City is the same.
-- Query to get unique pairs of Aeroplane_No with the same Departure_City
SELECT DISTINCT LEAST(S1.Aeroplane_No, S2.Aeroplane_No) AS Aeroplane1, GREATEST(S1.Aeroplane_No, S2.Aeroplane_No) AS Aeroplane2
FROM Schedule_Master S1, Schedule_Master S2
WHERE S1.Departure_City = S2.Departure_City AND S1.Aeroplane_No <> S2.Aeroplane_No;


\echo ****************** Query 4: Retrieve the minimum and maximum Airfare and the minimum Seats from Flight_Master
SELECT MIN(Airfare), MAX(Airfare), MIN(Seats) FROM Flight_Master;

\echo ****************** Query 5: Retrieve Airline_Name and Aeroplane_No from Flight_Master having Airfare > 700 or Seats < 100.
SELECT Airline_Name, Aeroplane_No FROM Flight_Master WHERE Airfare > 700 OR Seats < 100;

\echo ****************** Create a procedure to find vowels in a string and count them
CREATE OR REPLACE FUNCTION FindVowelsCount(input_string TEXT) RETURNS INTEGER AS $$
DECLARE
    vowel_count INTEGER := 0;
    char_count INTEGER := 0;
    ch CHAR;
BEGIN
    FOR ch IN SELECT * FROM unnest(regexp_split_to_array(input_string, '')) LOOP
        IF ch ~* '[aeiou]' THEN
            vowel_count := vowel_count + 1;
        END IF;
        char_count := char_count + 1;
    END LOOP;
    RAISE NOTICE 'Total characters: %', char_count;
    RAISE NOTICE 'Total vowels: %', vowel_count;
    RETURN vowel_count;
END;
$$ LANGUAGE plpgsql;

\echo ****************** Call the procedure
SELECT FindVowelsCount('In the relational model, data are represented in a tabular form which is called, relation (table), and they are associated with relationships.');

\echo ****************** Create a trigger to log Flight_Master inserts
CREATE OR REPLACE FUNCTION FlightMasterInsertTrigger() RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'New record inserted into Flight_Master: Airline_Name=%, Aeroplane_No=%, Flight_Date=%, Airfare=%, Seats=%',
        NEW.Airline_Name, NEW.Aeroplane_No, NEW.Flight_Date, NEW.Airfare, NEW.Seats;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

\echo ****************** Create the trigger on Flight_Master
CREATE TRIGGER Flight_Master_Insert
AFTER INSERT ON Flight_Master
FOR EACH ROW
EXECUTE FUNCTION FlightMasterInsertTrigger();

\echo ****************** Insert sample data to trigger the FlightMasterInsertTrigger
INSERT INTO Flight_Master (Airline_Name, Aeroplane_No, Flight_Date, Airfare, Seats)
VALUES ('IndiGo', 'I777', '2023-09-25', 800, 120);
