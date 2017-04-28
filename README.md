# ASP-Timetable

Course: CM20252 (Artificial Intelligence)
Coursework: design and implement a timetabling application in a declarative manner using Answer Set Programming.

### How to run the program

1. Download and unzip the json parse .jar file and move it to the root directory of the project
Download the jar file [here](http://www.java2s.com/Code/Jar/j/Downloadjsonsimple111jar.htm).

2. Compile the java code
`javac -cp .:json-simple-1.1.1.jar Timetable.java`

3. Run the java program, piping the clingo output in JSON format into the java program
`clingo -n 0 main.lp atoms.lp --outf=2 | java -cp .:json-simple-1.1.1.jar Timetable`

4. If you just wish to run the AnsProlog files, use this command
`clingo main.lp atoms.lp -n 0`
