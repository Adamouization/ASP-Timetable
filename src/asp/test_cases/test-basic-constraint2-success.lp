% Test case name: test-basic-constraint2-success.lp
% Test case goal: 
%		Successfully generates a timetable by demonstratring that the constraint: "lecturers cannot teach 2 units at the same time" cannot be violated.
% Test case description:
% 		This test case generates a timetable after attempting to violate the constraint mentioned above.
%		There is only 1 lecturer who teaches 2 units. Only 4 timesteps available and 4 lectures are scheduled. And 2 rooms.
%		This shows that the lecturer cannot teach twice at the same time, since the 4 timesteps are occupied even though there are 2 rooms free.
%		If there was 1 timestep less, the timetable wouldn't be generated because the constraint can't be violated: (see test-basic-constraint2-fail.lp)
%			lecturer's cannot teach twice at same time and there aren't enough timesteps.
% Expected output: a timetable with a single unit per timestep

timesteps(1..4).

takes(computerScience, adam).
takes(computerScience, andrea).
takes(computerScience, jay).
takes(maths, adam).
takes(maths, alice).
takes(maths, chris).

hoursStudentUnit(2, computerScience).
hoursStudentUnit(2, maths).

room(oneWest,5).
room(eightWest,5).

hoursUnit(2, computerScience).
hoursUnit(2, maths).

teaches(computerScience, alanTurin).
teaches(maths, alanTurin).