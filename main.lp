% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 02/04/2017
% See: atoms.lp
% Version: 1.0

% -------------------------------ATOMS (facts)-------------------------------

% in atoms.lp file


% -------------------------GENERATOR (generate)-------------------------

timesteps(1..8). % 8 hours in a day
H { roomBooked(T,U,L,R) : timesteps(T), lecturer(L), room(R) } H :- hoursUnit(H,U).


% -------------------------RULES (define)-------------------------

%


% ------------------------- CONSTRAINTS (test)-------------------------

:- roomBooked(T,U,L1,R), roomBooked(T,U,L2,R), L1 != L2.

:- roomBooked(T,U1,L,R), roomBooked(T,U2,L,R), U1 != U2.

:- roomBooked(T,U,L,R), not teaches(U,L).

:- roomBooked(T,U,L,R), not locationUnit(R,U).


% ------------------------- DISPLAY -------------------------

#show roomBooked/4.
