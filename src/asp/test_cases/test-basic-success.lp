% Test case name: test-basic-success.lp
% Test case goal: 
%		succeed in providing a timetable for the basic system requirements
% Test case description:
% 		this test case successfully generates a timetable taking into account only the basic system's requirements, not extensions's 1
%		(excludes the lecturer's preferred teaching time except lunchbreaks since they are a constraint in main.lp)
% Expected output: the correctly generated timetable without preferred teaching times for lecturers

timesteps(1..25).

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