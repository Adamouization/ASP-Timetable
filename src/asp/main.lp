% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 27/04/2017
% See: atoms.lp
% Version: 1.0

% ---------------------------------- GENERATOR ---------------------------------

% schedules H timeslots for unit U at timestep T
timesteps(1..20). % 4 hours in a day

% schedule for lecturers
H { roomBooked(T,U,L,R,C) : timesteps(T) , teaches(U,L) , room(R,C) } H :- hoursUnit(H,U).

% schedule for students
H { attendance(T,U,S,R,C) : roomBooked(T,U,_,R,C) } H :- hoursStudentUnit(H,U), takes(U,S).


% --------------------------------- CONSTRAINTS --------------------------------

% ------- basic system

% if same unit and room / different lecturers / any timestep
% => remove answers where the lecturer is different
:- roomBooked(_,U,L1,R,_), roomBooked(_,U,L2,R,_), L1 != L2.

% if same time and unit / different rooms / any lecturer
% => remove answers where the room is different
:- roomBooked(T,U,_,R1,_), roomBooked(T,U,_,R2,_), R1 != R2.

% if same time, lecturer, room, unit
% => remove answers where lecturer is teaching a unit that is not his
:- roomBooked(T,U,L,R,_), not teaches(U,L).

% if time, lecturer, room, unit same
% => remove answers where lecturer is scheduled at same timestep as his commitment
:- roomBooked(T,U,L,R,_), commitments(T,L).

% if time, lecturer, room same / different units
% => remove answers where the units are different (cannot be same unit)
:- roomBooked(T,U1,_,R,_), roomBooked(T,U2,_,R,_), U1 != U2.

:- roomBooked(T,_,L,R1,_), roomBooked(T,_,L,R2,_), R1 != R2.

% room capacity
capacity(T,R,Total) :- Total = #count {S: attendance(T,_,S,R,_)}, room(R,_), timesteps(T).
:- roomBooked(T,_,_,R,C), capacity(T,R,Total), Total>C.


% ------- extension 1

% launchbreak at specified timestep.
% at timestep 3, all rooms cannot be booked for lunchbreak.
:~ roomBooked(T,_,_,_,_), T == 3, T==8, T==13, T=18, T=23.[10,T]

% Preferred teaching time
% if time different / same lecturer / any unit and room
% => add 10 penalty
:~ roomBooked(T1,_,L,_,_), preferred(T2,L), T1!=T2.[10,T1,L,T2]


% ------- extra
% wednesday afternoon off
wednesdayOff :- roomBooked(14,_,_,_,_), roomBooked(15,_,_,_,_).
:- wednesdayOff.


% ----------------------------------- DISPLAY ----------------------------------

#show roomBooked/5.
#show attendance/5.
