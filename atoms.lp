% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 25/04/2017
% See: main.lp
% Version: 1.0

% ------------------------------------ ATOMS -----------------------------------

% ------ students and units they takes
takes(computerScience, adam).
takes(computerScience, andrea).
takes(finance, stan).
takes(finance, valentin).
takes(maths, alice).

% ------ hours a student should take for each unit
hoursStudentUnit(2, computerScience).
hoursStudentUnit(1, finance).
hoursStudentUnit(1, maths).

% ------ rooms and their capacity
room(oneWest).
room(eightWest).
%room(sixSouth).

% ------ units and hours taught per week
hoursUnit(2,computerScience).
hoursUnit(1,finance).
hoursUnit(2,maths).

% ------ lecturers and units they teach
teaches(computerScience, alanTurin).
teaches(computerScience, fabio).
teaches(finance, steveJobs).
teaches(maths, alanTurin).

% ------ other lecturer commitments at timestep T
commitments(1,alanTurin).
commitments(2,fabio).
commitments(4,steveJobs).

% ------ lecturers preferred teaching time at timestep T
preferred(2, alanTurin).
preferred(3, fabio).
preferred(1, steveJobs).
