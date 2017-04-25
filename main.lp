% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 25/04/2017
% See: atoms.lp
% Version: 1.0

% ---------------------------------- GENERATOR ---------------------------------

% schedules H timeslots for unit U at timestep T
timesteps(1..4). % 4 hours in a day

% schedule for lecturers
H { roomBooked(T,U,L,R) : timesteps(T) , teaches(U,L) , room(R) } H :- hoursUnit(H,U).

% schedule for students
H { attendance(T,U,S,R) : roomBooked(T,U,_,R) } H :- hoursStudentUnit(H,U), takes(U,S).


% ------------------------------------ RULES -----------------------------------

% launchbreak at specified timestep.
launchbreak :- roomBooked(3,_,_,_).


% --------------------------------- CONSTRAINTS --------------------------------

% ------ roomBooked (lecturers)
% if same unit and room / different lecturers / any timestep
% => remove answers where the lecturer is different
:- roomBooked(_,U,L1,R), roomBooked(_,U,L2,R), L1 != L2.

% if same time and unit / different rooms / any lecturer
% => remove answers where the room is different
:- roomBooked(T,U,_,R1), roomBooked(T,U,_,R2), R1 != R2.

% if same time, lecturer, room, unit
% => remove answers where lecturer is teaching a unit that is not his
:- roomBooked(T,U,L,R), not teaches(U,L).

% if time, lecturer, room, unit same
% => remove answers where lecturer is scheduled at same timestep as his commitment
:- roomBooked(T,U,L,R), commitments(T,L).

% if time, lecturer, room same / different units
% => remove answers where the units are different (cannot be same unit)
:- roomBooked(T,U1,_,R), roomBooked(T,U2,_,R), U1 != U2.

% lecturer should have all his lectures scheduled.
% insert weak constraints here


% ------ student attendance

% students should have attend all his scheduled lectures
% insert weak constraints here


% ------- extension 1

% at timestep 3, all rooms cannot be booked for lunchbreak.
:- launchbreak.


% ----------------------------------- DISPLAY ----------------------------------

#show roomBooked/4.
#show attendance/4.
