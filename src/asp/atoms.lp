% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: XXX
% Email: XXX@bath.ac.uk
% Date: 05/05/2017
% See: timetable.lp
% Version: 1.0

%**
@block Timetable_Data{
	Encoding of the predicates used to generate the timetable.
	These include:
		_timesteps which represent a full week (1 timestep = 2 hours, 5 timesteps per day) 
		_units, how many hours they should be taught per week and how many hours each student enrolled should attend,
		_students, who take units and attend lectures,
		_lecturers, who teach units (at preferred teaching times and not when they have other commitments),
		_rooms and their student capacity.

	@term T
		T is a timestep ranging from 1 to 25 during which a lecture can be scheduled if possible

	@term U
		U is a unit taught by a single lecturer and taken by multiple students S

	@term S
		S is a student who takes units and attends lectures

	@term H
		H is the number of lectures scheduled for a unit AND the number of scheduled lectures a student must take for a single unit

	@term R
		R is a room where a lecture takes place

	@term C
		C is a room capacity to limit the number of students attending a lecture at the same time

	@term L
		L is a lecturer who teaches a unit

	@term O
		O is a timestep at which a lecturer has other commitments and therefore cannot teach

	@term P
		P is a timestep at which a lecturer would like to teach if it is possible

	@atom timesteps(T)
		the amount of slots in which lectures can be scheduled

	@atom takes(U,S)
		a student name's S and a unit U he is enrolled in

	@atom hoursStudentUnit(H,U)
		the number of hours a student should attend for each unit

	@atom room(R,C)
		a room name's R and its student capacity

	@atom hoursUnit(H,U)
		how many hours a unit is taught by a lecturer

	@atom teaches(U,L)
		the lecturer's name L and a unit U he teaches

	@atom commitments(O,L)
		the lecturer L has another commitment at timestep O and cannot teach

	@atom preferred(P,L)
		the lecturer L would like to teach at timestep P if possible
*%	

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

    preferred(2, alanTurin).
    preferred(12, fabio).
    preferred(9, karlMarx).
    preferred(24, jordanBelfort).
    preferred(16, walterWhite).
%**
}
*%