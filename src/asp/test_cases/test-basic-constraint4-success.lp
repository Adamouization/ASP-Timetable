% Test case name: test-basic-constraint4-success.lp
% Test case goal: 
%		Successfully generates a timetable by demonstratring that the constraint: "lecturers cannot teach when they have other commitments" cannot be violated.
% Test case description:
% 		This test case generates a timetable after attempting to violate the constraint mentioned above.
%		There are 4 timesteps, 4 lectures for 4 units that need to be scheduled, 4 lecturers and 1 room.
%		Therefore, each lecture is scheduled at a different timestep.
%		If each lecturer has only 1 other commitment, and out of the 4 lecturers' commitments at least 1 timestep remains free, then the timetable should be generated but full.
%		Changing one of the other commitments timesteps will make the test fail (see test-basic-constraint4-fail.lp)
% Expected output: 	a timetable where each lecturer doesn't teach at the same timestep as his other commitment.
%					here, alanTurin teaches at 1, nikolai teaches at 2, karlMarx teaches at 3 and walterWhite teaches at 4.

timesteps(1..4).

takes(computerScience, adam).
takes(computerScience, andrea).
takes(economics, rodolph).
takes(economics, valentin).
takes(maths, adam).
takes(maths, alice).
takes(maths, chris).
takes(chemistry, chris).

hoursStudentUnit(1, computerScience).
hoursStudentUnit(1, economics).
hoursStudentUnit(1, maths).
hoursStudentUnit(1, chemistry).

room(oneWest,5).

hoursUnit(1, computerScience).
hoursUnit(1, economics).
hoursUnit(1, maths).
hoursUnit(1, chemistry).

teaches(computerScience, alanTurin).
teaches(economics, karlMarx).
teaches(maths, nikolai).
teaches(chemistry, walterWhite).

commitments(2, alanTurin).
commitments(3, alanTurin).
commitments(4, alanTurin).
commitments(1, nikolai).
commitments(3, nikolai).
commitments(4, nikolai).
commitments(1, karlMarx).
commitments(2, karlMarx).
commitments(4, karlMarx).
commitments(1, walterWhite).
commitments(2, walterWhite).
commitments(3, walterWhite).