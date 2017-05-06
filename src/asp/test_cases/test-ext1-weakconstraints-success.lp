% Test case name: test-ext1-weakconstraints-success.lp
% Test case goal: 
%		succeed in providing a timetable satisfying extension 1's weak constraints.
% Test case description:
% 		this test case successfully generates a timetable taking into account the requirements from extension 1.
%		with enough timesteps, the weak constraints are satisfied: 
%				_lectures are not scheduled during lunch breaks if possible
%				_lecturers teach at least once at their preferred time if possible.
% Expected output: the correctly generated timetable with:
%				_alanTurin teaching at timestep 2, fabio at timestep 12, karlMarx at timestep 9, jordanBelfort at timestep 24 and walterWhite at timestep 16.
%				_no lectures at timestep 3, 8, 13, 18 or 23.

timesteps(1..15).

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