% Test case name: test-basic-constraint5-success.lp
% Test case goal: 
%		Successfully generates a timetable by demonstratring that the constraint: "students should have all their units scheduled" cannot be violated.
% Test case description:
%		This test case generates a timetable after attempting to violate the constraint mentioned above.
%		All the students have all their units scheduled as long as it is still possible.
%		The only case where this test fails is when there aren't enough timesteps to fit all students or there aren't enough rooms/room capacity is too small.
% Expected output: a timetable where all students have all their units scheduled and they attend them.

timesteps(1..5).

takes(computerScience, adam).
takes(computerScience, andrea).
takes(computerScience, chris).
takes(maths, adam).
takes(maths, andrea).
takes(maths, chris).

hoursStudentUnit(1, computerScience).
hoursStudentUnit(1, maths).

room(oneWest,2).
room(eightWest,2).

hoursUnit(2, computerScience).
hoursUnit(2, maths).

teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(maths, alanTurin).