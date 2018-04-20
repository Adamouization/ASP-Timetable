ASP Timetable
=======

**ASP Timetable** is a timetabling application implemented in a declarative manner using Answer Set Programming and the [Clingo](https://potassco.org/clingo/) solver my Artificial Intelligence course. Timetabling is considered a classic A.I. problem involving many constraints, and this program tackles the different challenges and considerations that go into generating timetables.

## Features

* **General**
    * Clingo output parsed and interpreted by a Python script to create a Tkinter GUI
    * Generated sets written entirely in AnsProlog
    * Program documented using LANA
* **Constraints**
	* students cannot attend two lectures at the same time
	* lecturers cannot teach two units at the same time
	* rooms can only be used for one lecture at a time
	* lecturers cannot teach when they have other commitments
	* students and lecturers have all their units schedule
* **Weak Constraints** *(add penalty points to the sets that do not accommodate this rule)*
	* lecturers can have preferred teaching times
	* timetables offer a lunch break where possible
	* no scheduled lectures on Wednesday afternoons
* **Atoms** *(user-specified in `atoms.lp`)*
	* students
	* rooms
	* units
	* lecturers
	* capacity of the rooms
	* units taken by a student
	* units taught by a lecturer
	* times that a lecturer has other commitments


## Screenshots

###### Tkinter GUI screenshot

![GUI screenshot](https://github.com/Adamouization/ASP-Timetable/blob/master/screenshots/screenshot_gui.png)

###### Command Line Clingo output screenshot

![CLI screenshot](https://github.com/Adamouization/ASP-Timetable/blob/master/screenshots/screenshot_cli.png)

## Usage

#### Basic Usage

1. Clone the project and cd to the project's `src` folder.

```
git clone https://github.com/Adamouization/ASP-Timetable
cd ASP-Timetable/src/
```

2. Generate the answer set using `Clingo` and pipe the output to the python script that will parse the data and generate a  GUI: `clingo -n 0 asp/timetable.lp asp/atoms.lp --outf=2 | python Timetable.py` where:

	* `clingo` is the command used to run generate the answer set using the AnsProlog files specified
    * `timetable.lp` contains the generators, rules, constraints and dislay options to generate the optimal timetable
    * `atoms.lp` contains all the atoms such as courses, lecturers, rooms, ...
    * `--outf=2` outputs the generated answer set in JSON format
    * `|` pipes the JSON output into the python script
    * `python Timetable.py` runs the Python script to parse the JSON output and create the Tkinter GUI with the data from the optimal answer. 

3. Wait until the timetable is generated in ASP and the GUI is launched in Python.

#### Advanced Usage

If you just wish to just generate the answer set using clingo without the Tkinter GUI:

```
clingo -n 0 asp/timetable.lp asp/atoms.lp
```

If you just wish to run the test cases, be sure you are in the "src" folder before using this command and replace <test-file> with the test case in the [`ASP-Timetable/src/asp/test_cases`](https://github.com/Adamouization/ASP-Timetable/tree/master/src/asp/test_cases) directory:

```
clingo -n 0 asp/timetable.lp asp/test_cases/<test-file>.lp --outf=2 | python Timetable.py
```

You can view the **LANA** documentation on your web browser (generated using SeaLion Eclipse extension). To do so, go to the [`documentation`](https://github.com/Adamouization/ASP-Timetable/tree/master/documentation) folder and open the `index.html` file in your web browser.

## License 
* see [LICENSE](https://github.com/Adamouization/ASP-Timetable/blob/master/LICENSE) file

## Contact
* email: adam@jaamour.com
* website: www.adam.jaamour.com
* twitter: [@Adamouization](https://twitter.com/Adamouization)
