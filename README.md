# ASP-Timetable

Course: CM20252 (Artificial Intelligence)
Coursework: design and implement a timetabling application in a declarative manner using Answer Set Programming.

### How to run the program

1. Go to the "src" foldr.

2. Run the python script, piping the clingo output in JSON format into the pythong script
`clingo -n 0 asp/main.lp asp/atoms.lp --outf=2 | python Timetable.py`.

3. Wait a few seconds until the timetable is generated in ASP and the GUI is launched in Python.

4. Close the timetable's window to exit the program.

5. If you just wish to run the AnsProlog files, use this command
`clingo -n 0 asp/main.lp asp/atoms.lp`
