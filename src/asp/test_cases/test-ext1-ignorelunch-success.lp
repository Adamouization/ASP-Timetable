% Test case name: test-ext1-ignorelunch-success.lp
% Test case goal: 
%		succeed in providing a timetable but ignoring lunch breaks.
% Test case description:
% 		This test case successfully generates a timetable taking into account the requirements from extension 1 but failing to satisfying lunch breaks.
%		Because there aren't enough timesteps, the program is forced to schedule lectures during lunch breaks.
% Expected output: the correctly generated timetable with lectures scheduled during lunchbreaks (at timestep 3, or between 12pm-2pm on the GUI).

timesteps(1..5).

takes(computerScience, adam).
takes(computerScience, andrea).
takes(economics, rodolph).
takes(economics, valentin).
takes(maths, adam).
takes(maths, alice).
takes(maths, chris).
takes(chemistry, chris).

hoursStudentUnit(2, computerScience).
hoursStudentUnit(2, economics).
hoursStudentUnit(1, maths).
hoursStudentUnit(1, chemistry).

room(oneWest,2).
room(eightWest,2).

hoursUnit(2, computerScience).
hoursUnit(3, economics).
hoursUnit(3, maths).
hoursUnit(1, chemistry).

teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(economics, karlMarx).
teaches(economics, jordanBelfort).
teaches(maths, alanTurin).
teaches(chemistry, walterWhite).

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

preferred(2, alanTurin).
preferred(12, fabio).
preferred(9, karlMarx).
preferred(24, jordanBelfort).
preferred(16, walterWhite).