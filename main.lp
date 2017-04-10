% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 02/04/2017
% See: atoms.lp
% Version: 1.0

% GENERATOR

% schedules H timeslots for unit U at timestep T
timesteps(1..3). % 8 hours in a day
H { roomBooked(T,U,L,R) : timesteps(T) ,teaches(U,L), room(R) } H :- hoursUnit(H,U), student(S).

%0 { roomBooked(U,S) } H :- student(S) , hoursUnit(H,U)


% CONSTRAINTS

% if same unit, room / different lecturers / any timestep, student
% => then remove answers where the lecturer is different
:- roomBooked(_,U,L1,R,_), roomBooked(_,U,L2,R,_), L1 != L2.

% if same time, unit / different room / any lecturer, student
% => then remove answers where the room is different
:- roomBooked(T,U,_,R1,_), roomBooked(T,U,_,R2,_), R1 != R2.

% if same time, lecturer, room, unit, any student
% => then removes answers where lecturer is teaching a unit that is not his
:- roomBooked(T,U,L,R,_), not teaches(U,L).

% if time, lecturer, room, unit same, removes answers where lecturer is scheduled at same timestep as his commitment
:- roomBooked(T,U,L,R,_), commitments(T,L).

% if time, lecturer, room same, then cannot be same unit
:- roomBooked(T,U1,_,R,_), roomBooked(T,U2,_,R,_), U1 != U2.

%:- roomBooked(_,U,_,_,S), not takes(U,S).


% DISPLAY
#show roomBooked/5.
