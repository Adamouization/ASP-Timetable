% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 27/04/2017
% See: main.lp
% Version: 1.0

% ------------------------------------ ATOMS -----------------------------------

% timesteps generated in 1 working week (5 per day)
timesteps(1..25).

% ------ students and units they takes
takes(computerScience, adam).
takes(computerScience, andrea).
takes(economics, rodolph).
takes(economics, valentin).
takes(maths, adam).
takes(maths, alice).
takes(maths, chris).
takes(chemistry, chris).

% ------ hours a student should attend for each unit
hoursStudentUnit(2, computerScience).
hoursStudentUnit(2, economics).
hoursStudentUnit(1, maths).
hoursStudentUnit(1, chemistry).

% ------ rooms and their capacity
room(oneWest,2).
room(eightWest,2).

% ------ units how many hours they are taught per week
hoursUnit(2, computerScience).
hoursUnit(3, economics).
hoursUnit(2, maths).
hoursUnit(1, chemistry).

% ------ lecturers and units they teach
teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(economics, karlMarx).
teaches(economics, jordanBelfort).
teaches(maths, alanTurin).
teaches(chemistry, walterWhite).

% ------ other lecturer commitments at timestep T
commitments(1, alanTurin).
commitments(3, alanTurin).
commitments(9, alanTurin).
commitments(11, alanTurin).
commitments(11, fabio).
commitments(13, fabio).
commitments(10, karlMarx).
commitments(11, jordanBelfort).
commitments(25, jordanBelfort).
commitments(17, walterWhite).

% ------ lecturers preferred teaching time at timestep T if possible
preferred(2, alanTurin).
preferred(12, fabio).
preferred(9, karlMarx).
preferred(24, jordanBelfort).
preferred(16, walterWhite).

% edge cases = put two for each test, one satisfiable one not, change only info between each