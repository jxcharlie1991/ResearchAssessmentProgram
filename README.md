# ResearchAssessmentProgram
## Application Overview
This project is a database-backed desktop application with a Windows Presentation Foundation (WPF) graphical front end, and the software is implemented in C#. It has implemented most of the functions of a real Research Assessment Program.

I have uploaded the sql document, if you want to run this software on your personal device, you need to change the database setting to your xampp's setting.

### [See Code](https://github.com/jxcharlie1991/ResearchAssessmentProgram)

## Application Introduction Video

[![](https://i.ytimg.com/an_webp/PZO3OREyG2k/mqdefault_6s.webp?du=3000&sqp=COeo-ooG&rs=AOn4CLB2Pil13fwVnegrTUMPiBi8UMGF8w)](https://youtu.be/PZO3OREyG2k)

[Click for the whole video](https://youtu.be/PZO3OREyG2k)

## SQL data
[SQL data](https://github.com/jxcharlie1991/ResearchAssessmentProgram/blob/main/localhost.sql)

## Project Description
The University of Tasmania requires the Windows Research Assessment Program (RAP). This desktop application will be used by administrative staff in the Office of Research Services to monitor and assess the research performance of staff and research students at the University using publically available information about their employment and publication outputs. The information to be presented includes, but is not limited to, a staff member’s position, past job titles, primary campus, students they are supervising and publications they have authored, as well as derived information about their performance relative to benchmarks for their level of employment. Similar information is presented about research students, although their performance is measured differently. The information, which includes both textual data and staff photos, is to be presented via a Windows 10 desktop application.

## Existing Systems
Currently some of this information is available via the University’s Web Access Research Portal 
(WARP), available at:

https://rmdb.research.utas.edu.au/public/rmdb/q/warp_home

These are three examples of the information about staff available on the WARP site that the new system will provide, but present differently:

https://rmdb.research.utas.edu.au/public/rmdb/q/indiv_detail_warp_trans/47832

https://rmdb.research.utas.edu.au/public/rmdb/q/indiv_detail_warp_trans/6

https://rmdb.research.utas.edu.au/public/rmdb/q/indiv_detail_warp_trans/4479

The new RAP desktop application will not reproduce the layout of WARP. 

There also currently exist several administration systems that allow administrative staff to record employment and publication information. This project does not include the redevelopment of these administration systems.
## Platform
The Research Assessment Program must operate within the Standard Operating Environment (SOE) of University computers, which are a mixture of Dell and Apple products that all run Windows 10. The information that the system will display is currently stored in a MySQL database, named the “Employment and Research Database”, and this database content and structure cannot be changed. As this system does not include redevelopment of the administrative entering system that facilitates input of the information into the database, the new system must work with the existing database. Details of the database will be provided in a later document.

The final system is to be developed using C# and the sources shared with technical staff from Information Technology Resources so that they may maintain it into the future.
## Users
The system will be used by professional staff from the Office of Research Services as well as senior administrative (academic) staff in the University. Both groups will have access to the same features, so there will be no need to differentiate between users.
## Components
The Research Assessment Program will consist of two main components: researcher lists
(incorporating a researcher detail view) and publications lists (for a given researcher). These may be enhanced by the addition of a report generation function.
### Researcher List
Upon application start up, the user shall be presented with an interactive list of researchers (consisting of both staff and research students), known hereafter as the Researcher List view. This list should display names in the format ‘Family Name, Given Name (Title)’, as in ‘Einstein, Albert (Dr)’.

Staff may have occupied several positions during their time at the university. Each position has a start date and associated employment level from A through E. All but the most recent position has an end date. No two positions for the same employee overlap in time. The employment levels correspond to the following job titles:
```
Level  Job title
  A    Postdoc
  B    Lecturer
  C    Senior Lecturer
  D    Associate Professor
  E    Professor
```

Research students do not have an associated employment level. They do, however, have a single recorded position in the Employment and Research Database that documents their time as a student.

The user shall be able to filter the Research List view based on a researcher’s employment level or student status. The user should be able to list all researchers, students only, level A, level B, level C, level D and level E. This would allow administrative staff to look at performance of researchers within particular employment bands more easily.

It would enhance the system’s utility if the user could filter the list by entering part of a researcher’s name. The list contents would be restricted to show only those staff whose given name or family name contains the text entered by the user. Partial matches that span combinations of given and family name do not need to be supported. The University has a large number of researchers and being able to restrict the list in this fashion will allow the user to find particular researchers quickly.
### Researcher Details
When the user selects a name in the list the researcher details view will be displayed. It will show the following basic details, some of which are only available for staff and others only for students:
```
Detail         For    Notes
Name           both
Title          both   Dr, Mr, Ms, etc.
School/Unit    both   The area in which they are employed
Campus         both   One of ‘Hobart’, ‘Launceston’ and ‘Cradle Coast’
Email          both
Photo          both   Stored as the URL of an image, but must be presented as an image
Current Job 
Title          both   A label derived from their current position’s level
Commenced with
institution    both   The start date of their earliest position
Commenced cur-
rent position  both   The start date of their current position
Tenure         both   Time in (fractional) years since the researcher commenced with the institution
Publications   both   The total number of publications authored by the researcher
3-year Average staff  The total number of publications in the previous three whole calendar years, 
                      divided by three. For example, if the current calendar year is 2019 then this
                      is the average number of publications per year in the period spanning 2016, 2017
                      and 2018.
Performance    staff  This is a metric calculated using the three-year average and staff member’s 
                      employment level (details below)
Supervisions   staff  The number of students the staff member is currently or has previously supervised.
                      This can be derived from information in the database system, which records which 
                      students a staff member has supervised at any time 
Degree        students
Supervisor    students Name of the student’s primary supervisor
```

The display should have labels for each piece of information, with the values for 3-year average, Performance and Supervisions left blank for students, and the values for Degree and Supervisor left blank for staff.

It would enhance the application if the Researcher Details view also includes a table of a staff member’s previous positions and those positions’ start and end dates (not required for students).

When displaying details for a staff member, the Researcher Details view will show that staff member’s performance, which is their three-year average for publications divided by the expected number of publications given their employment level, expressed as a percentage with one decimal place shown. The expected number of publications per year for each level is as follows:
```
Level   Expected number of publications
  A                  0.5
  B                  1
  C                  2
  D                  3.2
  E                  4
```

For example, a level D academic who has published 9 papers in the preceding three-year period—an average of 3 per year—would have a performance measure of 3/3.2 × 100 = 93.8%.

The system could allow the user to expand the number of supervisions displayed to show a list of those students’ names. This list does not need to be interactive. This function would be accessed via a button or equivalent control.
### Cumulative Publication Count
It would enhance the application if the user could display a tabular view of a researcher’s cumulative number of publications by year, starting with their earliest year of employment. This will be accessed via a button or equivalent control within the Researcher Details view and may be displayed within the main window or in a new popup window. This is essentially a numerical equivalent of the column chart displayed in the WARP system.
### Publications List
As part of the Researcher Details view, located below the researcher’s primary details, the system shall show an interactive list of that researcher’s publications. Entries in this list should be formatted with the publication year followed by its title. The list shall initially be sorted from top to bottom with the most recent publications first, based on their year of publication. Publications within the same year shall be sorted alphabetically based on title.

It would enhance the utility of the list if the user could invert the sort order to that the oldest publications appear first. It would further enhance the utility of the system if the user could specify a year range to filter the contents of the list.

When the user selects a publication in the list the Publication Details view will be displayed. This may either be part of the main window, adjacent to the researcher’s details, or in a new window. It will show the following details:
* DOI
* Title
* Authors
* Publication year
* Type (one of ‘Conference’, ‘Journal’ or ‘Other’)
* Cite as (this is a single string obtained from the Employment and Researcher Database)
* Availability date (the date when the publication was first available, which may differ from the publication year)
* Age (the days elapsed since the publication became available; this can be negative if the availability date is in the future)

### Achievement Reports
It would enhance the system if the user could generate lists of researchers performing well and those performing poorly, based on their publication performance metric. Four reports should be implemented:
* Poor: those whose performance is at or below 70%
* Below Expectations: those whose performance is above 70% and below 110%
* Meeting Minimum: those whose performance is at or above 110%
* Star Performers: those whose performance is at or above 200%

These alternative reports may be accessed via menu options or, if a tabbed view is used to organize the various application views, via buttons on dedicated tab. Reports may be incorporated into the main window (on a separate tab of tabbed view, for instance), or appear in a new window. The reports do not have to support printing. 

All reports have the same format and should be presented in a table or list, with the researcher’s performance in the left column and his or her name in the right. Other details may be included if space allows. The Poor and Below Expectations reports should be sorted by increasing order of performance, while the other two reports should be sorted by decreasing order of performance.

It would further enhance the system if the user could copy the email addresses of those listed in a report to the clipboard. This would be accessed via a button located above the report.
## Manual
The system will need to have an associated technical manual. This manual should explain the system development so that the system can be maintained by University Technical Staff.
