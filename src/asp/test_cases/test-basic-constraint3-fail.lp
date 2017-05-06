% Test case name: test-basic-constraint3-fail.lp
% Test case goal: 
%		Fails to generate a timetable demonstratring that the constraint: "rooms can only be used for 1 lecture at a time" cannot be violated.
% Test case description:
% 		This test case fails to generate a timetable after attempting to violate the constraint mentioned above.
%		There is only 1 room available, 4 timesteps and 5 lectures scheduled (amongst 2 units).
%		This shows that the room can only be used once per timestep otherwise, two different units would have been scheduled at the same time for the same timestep.
%		Adding 1 timestep makes the test succeed and generate a timetable (see test-basic-constraint3-success.lp) since rooms can only be used once per timestep/lecture.
% Expected output: Expected output: 	
%					(Clingo) UNSATISFIABLE 
%					(Python) KeyError: 'Witnesses' 

timesteps(1..4).

takes(computerScience, adam).
takes(computerScience, andrea).
takes(economics, rodolph).
takes(economics, valentin).

hoursStudentUnit(2, computerScience).
hoursStudentUnit(2, economics).

room(oneWest,2).

hoursUnit(2, computerScience).
hoursUnit(3, economics).

teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(economics, karlMarx).
teaches(economics, jordanBelfort).

commitments(1, alanTurin).
commitments(3, alanTurin).
commitments(9, alanTurin).
commitments(11, alanTurin).
commitments(11, fabio).
commitments(13, fabio).
commitments(10, karlMarx).
commitments(11, jordanBelfort).
commitments(25, jordanBelfort).