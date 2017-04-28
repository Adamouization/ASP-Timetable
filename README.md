# ASP-Timetable

Adam Jaamour

### How to run

CLINDO ONLY
clingo main.lp atoms.lp -n 0 --outf=2

COMPILE JAVA
javac -cp .:json-simple-1.1.1.jar Timetable.java

PIPE CLINGO OUTPUT INTO RUNNING JAVA PROGRAM
clingo -n 0 main.lp atoms.lp --outf=2 | java -cp .:json-simple-1.1.1.jar Timetable