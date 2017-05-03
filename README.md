# ASP-Timetable

Course: CM20252 (Artificial Intelligence)
Coursework: design and implement a timetabling application in a declarative manner using Answer Set Programming.

### How to run the program

1. Download and unzip the json parse .jar file and move it to the root directory of the project
Download the jar file [here](http://www.java2s.com/Code/Jar/j/Downloadjsonsimple111jar.htm).

2. Go to the "src" foldr.

3. Compile the java code
`javac -cp .:lib/json-simple-1.1.1.jar Timetable.java`

4. Run the java program, piping the clingo output in JSON format into the java program
`clingo -n 0 asp/main.lp asp/atoms.lp --outf=2 | java -cp .:lib/json-simple-1.1.1.jar Timetable`

5. If you just wish to run the AnsProlog files, use this command
`clingo asp/main.lp asp/atoms.lp -n 0`
