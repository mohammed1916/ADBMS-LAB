# Database Schema

1)Consider the following relations Flight_Master and Schedule_Master and define DDL, DML statement for the given relations (10)

#### (i) Flight_Master (Details of all flights)
| **Airline_Name** | **Aeroplane_No** | **Flight_Date** | **Airfare** | **Seats** |
| ---------------- | ---------------- | --------------- | ----------- | --------- |
| Kingfisher       | K100             | *3.4.2018*      | **500**     | *50*      |
| Jet Airways      | J250             | *25.5.2018*     | **700**     | **100**   |
| Sahara           | SA300            | *6.2.2019*      | **1000**    | **250**   |
| Air India        | A999             | *27.5.2017*     | **900**     | **350**   |
| Spice            | SP740            | *7.7.2020*      | **300**     | **90**    |
| Sahara           | SA300            | *12.3.2018*     | **800**     | **250**   |
| Kingfisher       | K100             | *7.4.2019*      | **600**     | **50**    |
| Kingfisher       | K200             | *12.4.2019*     | **1200**    | **700**   |

#### (ii) Schedule_Master (Schedules of all flights)
| **Airline_Name** | **Aeroplane_No** | **Departure_City** | **Arrival_City** | **Time** | **Distance** |
| ---------------- | ---------------- | ------------------ | ---------------- | -------- | ------------ |
| Kingfisher       | K100             | Delhi              | Washington       | 9.00     | 250          |
| Sahara           | S300             | Chennai            | Delhi            | 10.00    | 600          |
| Kingfisher       | K200             | Pune               | London           | 23.00    | 1780         |
| Spice            | S740             | Delhi              | Pune             | 00.30    | 300          |
| Air India        | A999             | Pune               | Bangalore        | 2.00     | 700          |

# Constraints

2) Implement a check constraint for (5)
<br> • Flight date
<br> • Aeroplane_no can take values as a character followed with 3 digit number.

# Queries

3)  Answer the following queries (15)
<br> 
a) Retrieve all Flight_Date from Flight_Master where departure city is not Delhi.
<br> 
b) Retrieve Aeroplane_No from Schedule_ Master whose departure city is same as of Aeroplane_No “A999”.
<br> 
c) Get all pairs of Aeroplane_No from Schedule_Master such that their departure city is same.
<br> 
d) Retrieve *minimum, maximum* Airfare and minimum seats from Flight_Master
<br> 
e) Retrieve Airlines name and Aeroplane numbers from table Flight_Master having airfare *more than* 700 or seats less than 100.

# PL/SQL Procedure

4) Write a Pl/Sql procedure to find vowels in the following sentence. And also count the vowels present in it. (10)
<br>
“In the relational model, data are represented in a tabular form which is called, relation (table), and they are associated with relationships.”

# Trigger

5) Write a trigger that is fired after an insert statement is executed for the  Flight_Master table. The trigger writes the Airline_Name,	 Aeroplane_No,	Flight_Date  Airfare and	Seats. (10)
