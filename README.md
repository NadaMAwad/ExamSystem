# Exam System

We did this project as a team for graduation from the Institute of Information Technology:
- Nada M Awad 
- Mohamed Almeslmani
- Osama Badr
- Radwa Yasser

## Summary:
Fully automated examination system to perform online exams by ITI instructors and students using a windows form application, starting from making the ERD according to the business case then making the database then analyzing the existing data, and creating dashboards and reports that have clear insights.
 
## Tools:
- ERD Plus.
- SQL server.
- SSIS.
- SSRS.
- Red Gate Data Generator.
- C#.
- Power BI. 
 
 ## Steps & Timeline:
 ![image](https://user-images.githubusercontent.com/58444526/200630191-0a522255-24b3-4480-bf72-5909028b9b73.png)

## Tasks & Members:
![image](https://user-images.githubusercontent.com/58444526/200630338-cb10a90b-8c31-40e8-a019-a6c50a88a5e1.png)

## ERD
The team had a good perspective on the examination system and we agreed that the system should include several entities which are the following:
Students, Instructors, Departments, Exams, Questions, Courses.

- These entities have specific relations according to the following rules:
  - Each student enrolls in one department, studies many courses, and takes many exams.
  - Each instructor works in many depts and teaches many courses.
  - Each Department is managed by one instructor and has many courses.
  - Each course has many topics and has many exams, and many questions.
  - Each Student can take many exams two trials per course, and each exam has many questions.
  - Questions can appear in many exams.

![The final ERD](https://user-images.githubusercontent.com/58444526/200630566-e6579203-d84f-4c0c-8f2d-1e46434b02d9.png)

## Database Diagram
Data Base creation using the wizard tool for making the tables with specifying the properties according to our business cases scenario we made the diagram on SQL server management studio
![image](https://user-images.githubusercontent.com/58444526/200630744-723312a9-7e93-4179-8f5e-f88e100f346a.png)
