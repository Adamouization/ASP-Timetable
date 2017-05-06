% Test case name: test-basic-fail1.lp
% Test case goal: 
%		fails in providing a timetable for the basic system requirements
% Test case description:
% 		this test case fails to generate a timetable taking into account only the basic system's requirements.
%		this test case should fail because lecturer 'alanTurin' has too many other commitments 
%		(with number of timesteps for working timetable above the minimum required of 4 for 2 rooms).
% Expected output: 	(Clingo) UNSATISFIABLE 
%					(Python) KeyError: 'Witnesses' 

timesteps(1..6).

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
commitments(2, alanTurin).
commitments(3, alanTurin).
commitments(4, alanTurin).
commitments(5, alanTurin).
commitments(6, alanTurin).
commitments(11, fabio).
commitments(13, fabio).
commitments(10, karlMarx).
commitments(11, jordanBelfort).
commitments(25, jordanBelfort).
commitments(17, walterWhite).