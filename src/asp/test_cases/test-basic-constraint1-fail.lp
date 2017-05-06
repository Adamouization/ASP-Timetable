% Test case name: test-basic-constraint1-fail.lp
% Test case goal: 
%		Fails to generate a timetable demonstratring that the constraint: "students should not be forced to to attend 2 lectures at the same time" cannot be violated.
% Test case description:
% 		This test case fails to generate a timetable after violating the constraint mentioned above.
%		There are 2 lecturers who teach 1 unit. Only 1 timestep available and 2 lectures are scheduled with 2 rooms free.
%		The constraints shouldn't allow the student to attend the two lectures that are scheduled at the same time 
%			even if they are in different rooms and taught by different lecturers.
%		This shows that the student can only take one lecture at a time. 
%		If there were 2 timesteps the timetable would be generated since he would take the first one then the second one.
% 		Expected output: 	(Clingo) UNSATISFIABLE 
%					(Python) KeyError: 'Witnesses' 

timesteps(1..1).

takes(economics, rodolph).

hoursStudentUnit(2, economics).

room(oneWest,2).
room(eightWest,2).

hoursUnit(2, economics).

teaches(economics, jordanBelfort).
teaches(economics, karlMarx).


