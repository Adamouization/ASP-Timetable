% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 27/04/2017
% See: main.lp
% Version: 1.0

% ------------------------------------ ATOMS -----------------------------------

% ------ students and units they takes
takes(computerScience, adam).
takes(computerScience, andrea).
takes(economics, rodolph).
takes(economics, valentin).
takes(maths, adam).
takes(maths, alice).
takes(maths, chris).
takes(chemistry, chris).

% ------ hours a student should take for each unit
hoursStudentUnit(2, computerScience).
hoursStudentUnit(2, economics).
hoursStudentUnit(1, maths).
hoursStudentUnit(1, chemistry).


% ------ rooms and their capacity
room(oneWest,2).
room(eightWest,2).
room(threeEast,2).

% ------ units and hours taught per week
hoursUnit(2, computerScience).
hoursUnit(3, economics).
hoursUnit(2, maths).
hoursUnit(1, chemistry).

% ------ lecturers and units they teach
teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(economics, karlMarx).
teaches(maths, alanTurin).
teaches(chemistry, walterWhite).

% ------ other lecturer commitments at timestep T
commitments(1, alanTurin).
commitments(10, alanTurin).
commitments(2, fabio).
commitments(1, karlMarx).
commitments(3, walterWhite).
commitments(4, walterWhite).

% ------ lecturers preferred teaching time at timestep T
preferred(4, alanTurin).
preferred(3, fabio).
preferred(7, karlMarx).
preferred(8, walterWhite).

% edge cases = put two for each test, one satisfiable one not, change only info between each