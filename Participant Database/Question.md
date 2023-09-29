1) Consider the following relations Event table and Partipant_details and define DDL, DML statement for the given relations (10)
<br><br>

>**Event Table**

| Event_ID | Event_Name      | Start_Date | End_Date   | Duration (in days) |
| -------- | --------------- | ---------- | ---------- | ------------------ |
| 1        | Solo singing    | 2-May-2019 | 5-May-2019 | 4                  |
| 2        | Solo dance      | 2-May-2019 | 7-May-2019 | 6                  |
| 3        | Debate          | 3-May-2019 | 2-May-2019 | 1                  |
| 4        | Skit            | 2-May-2019 | 7-May-2019 | 6                  |
| 5        | Stand-up Comedy | 3-May-2019 | 5-May-2019 | 3                  |

>**Participant Details**

| Event_ID | Artist_Name | No_Participants |
| -------- | ----------- | --------------- |
| 1        | PG          | 30              |
| 1        | NUR         | 25              |
| 2        | NUR         | 25              |
| 2        | PG          | 20              |
| 1        | JrKG        | 40              |
| 3        | NUR         | 20              |
| 2        | JrKG        | 30              |
| 4        | NUR         | 30              |
| 4        | NUR         | 30              |
| 4        | JrKG        | 30              |
| 5        | ABC         | 50              |
| 5        | NUR         | 35              |


2) Implement a check constraint for (5)
- &nbsp;&nbsp;&nbsp;&nbsp; start date and end date
- &nbsp;&nbsp;&nbsp;&nbsp; no_ of participant should be two digit number

3)  Answer the following __queries__ (15)<br>
a) *Arrange* the event table entries in decreasing order based on duration.<br>
b) Display *average* participants who have attended the event of the artist ‘Nur’.<br>
c) Display event id which has *maximum* no. of participant of the artist ‘Jr. KG’.<br>
d) Get artist id who have performed *at least* three events <br>
e) Get event id who have performed the events on same *date* <br>

4) Write a __procedure__ to accept start date and end date of event as inputs and print event id in ascending order which are conducted during those dates. (10)  

5) Write a __trigger__ that is fired after an insert statement is executed for the event table. The trigger writes the event_id, Event_Name, Start_Date, End_Date and Duration (in days) (10)