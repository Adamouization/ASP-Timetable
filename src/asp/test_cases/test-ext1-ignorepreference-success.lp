% Test case name: test-ext1-ignorepreferences-success.lp
% Test case goal: 
%		succeed in providing a timetable but ignoring lecturers' preferred teaching times.
Test case description:
% 		This test case successfully generates a timetable taking into account the requirements from extension 1 but failing to satisfying lecturers' preferred teaching times.
%		Because there aren't enough timesteps and too many preffered times, the program is forced to schedule lectures at timesteps different than the preferred ones.
% Expected output: the correctly generated timetable with lectures for a lecturer scheduled during timesteps different than their preferred one.

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
hoursUnit(2, maths).
hoursUnit(1, chemistry).

teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(economics, karlMarx).
teaches(economics, jordanBelfort).
teaches(maths, alanTurin).
teaches(chemistry, walterWhite).

preferred(1, alanTurin).
preferred(2, fabio).
preferred(3, karlMarx).
preferred(4, jordanBelfort).
preferred(5, walterWhite).