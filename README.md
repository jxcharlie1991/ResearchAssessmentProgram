# ResearchAssessmentProgram
## Description
This desktop application will be used by administrative staff in the Office of Research Services to monitor and assess the research performance of staff and research students at the University using publically available information about their employment and publication outputs.

## Running

This project is a database-backed desktop application with a Windows Presentation Foundation (WPF) graphical front end, and the software is implemented in C#. In addition, the application needs a MySQL, the MySQL has been tested both on Sever and in XAMPP. Please download the repository and use XAMPP to run it.

### 1. Start Apache and MySQL
Start the Apache and MySQL on XAMPP Contol Panel.

### 2. Make sure database is correctly set
This project's database is default running on localhost, please set the password on [DataConnection.cs](https://github.com/jxcharlie1991/ResearchAssessmentProgram/blob/main/Research%20Assessment%20Program/Database/DataConnection.cs).

### 3. Transfer data
Firstly, create a new database MUST be called "rap" (if you don't like the name, you need to modify the [DataConnection.cs](https://github.com/jxcharlie1991/ResearchAssessmentProgram/blob/main/Research%20Assessment%20Program/Database/DataConnection.cs), then import the [Database Data](https://github.com/jxcharlie1991/CourseManagementSystem/blob/main/localhost.sql) into the database.

### 4. Open the website
This application is implemented by C#, please download [Visual Studio](https://visualstudio.microsoft.com/) to run the original code. Then, download the whole repository, then open the file "Research Assessment Program.sln".

## Test

The pictures on the database come from internet resources, sometimes the pictures' sizes and content would change, please ignore the pictures' formatting.

In addtion, this application doesn't have specific functionalities that need to be tested. Just have fun on it. 
