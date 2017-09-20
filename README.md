# ASP-Timetable

Course: CM20252 (Artificial Intelligence)
Coursework: design and implement a timetabling application in a declarative manner using Answer Set Programming.
Final grade: 88%

### How to run the program

1. Go to the "src" foldr.

2. Run the python script, piping the clingo output in JSON format into the python script
`clingo -n 0 asp/timetable.lp asp/atoms.lp --outf=2 | python Timetable.py`.

3. Wait until the timetable is generated in ASP and the GUI is launched in Python.

4. Close the timetable's window to exit the program.

5. If you just wish to run the AnsProlog files, use this command
`clingo -n 0 asp/timetable.lp asp/atoms.lp`

6. If you just wish to run the test cases, be sure you are in the "src" folder before using this command and replace <test-file> with the test case:
`clingo -n 0 asp/timetable.lp asp/test_cases/<test-file>.lp --outf=2 | python Timetable.py`

7. To view the documentation on your web browser, go to the "documentation" folder and open the "index.html" file in your web browser
