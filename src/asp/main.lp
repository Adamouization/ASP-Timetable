% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 27/04/2017
% See: atoms.lp
% Version: 1.0

% ---------------------------------- GENERATOR ---------------------------------

% schedules H timeslots for unit U at timestep T

% schedule for lecturers
H { roomBooked(T,U,L,R,C) : timesteps(T) , teaches(U,L) , room(R,C) } H :- hoursUnit(H,U).

% schedule for students
H { attendance(T,U,S,R,C) : roomBooked(T,U,_,R,C) } H :- hoursStudentUnit(H,U), takes(U,S).


% --------------------------------- CONSTRAINTS --------------------------------

% ------- basic system

% if same unit and room / different lecturers / any timestep and room capacity:
% => remove answers where the lecturer is different.
:- roomBooked(_,U,L1,R,_), roomBooked(_,U,L2,R,_), L1 != L2.

% if same time and unit / different rooms / any lecturer and room capacity:
% => remove answers where the room is different
:- roomBooked(T,U,_,R1,_), roomBooked(T,U,_,R2,_), R1 != R2.

% if same time, lecturer, room, unit / any room capacity:
% => remove answers where lecturer is teaching a unit that is not his.
:- roomBooked(T,U,L,R,_), not teaches(U,L).

% if time, lecturer, room, unit same / any room capacity:
% => remove answers where lecturer is scheduled at same timestep as his commitment.
:- roomBooked(T,U,L,R,_), commitments(T,L).

% if same time and room / different units / any lecturer and room capacity:
% => remove answers where the units are different (cannot be same unit).
:- roomBooked(T,U1,_,R,_), roomBooked(T,U2,_,R,_), U1 != U2.

% if same time and lecturer / different rooms / any unit and room capacity:
% => rempove answers where the rooms are different.
:- roomBooked(T,_,L,R1,_), roomBooked(T,_,L,R2,_), R1 != R2.

% count number of students attending the scheduled class:
capacity(T,R,Total) :- Total = #count {S: attendance(T,_,S,R,_)}, room(R,_), timesteps(T).

% if same time, room and room capacity / any unit and lecturer:
% => remove answers where the number of students in a room exceeds the room capacity.
:- roomBooked(T,_,_,R,C), capacity(T,R,Total), Total>C.


% ------- extension 1

% launchbreak at specified timestep.
% at timestep 3,8,13,18,23: all rooms cannot be booked for lunchbreak, unless necessary (adding 10 points penalty).
%:~ roomBooked(T,_,_,_,_), T==3, T==8, T==13, T==18, T==23.[10,T]
:~ roomBooked(T,_,_,_,_), T==3.[10,T]
:~ roomBooked(T,_,_,_,_), T==8.[10,T]
:~ roomBooked(T,_,_,_,_), T==13.[10,T]
:~ roomBooked(T,_,_,_,_), T==18.[10,T]
:~ roomBooked(T,_,_,_,_), T==23.[10,T]

% take into account preferred lecturer's teaching time
% if same lecturer / different time / any unit, room and room capacity:
% => add 10 points penalty if the lecture booked is different to the lecturer's preferred teaching time.
:~ roomBooked(T1,_,L,_,_), preferred(T2,L), T1!=T2.[10,T1,L,T2]


% ------- extra features

% nothing can be booked on wednesday afternoons.
wednesdayOff :- roomBooked(13,_,_,_,_).
wednesdayOff :- roomBooked(14,_,_,_,_).
wednesdayOff :- roomBooked(15,_,_,_,_).
:- wednesdayOff.


% ----------------------------------- DISPLAY ----------------------------------

#show roomBooked/5.
#show attendance/5.
