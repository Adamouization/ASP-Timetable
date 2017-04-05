% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: Adam Jaamour
% Email: aj645@bath.ac.uk
% Date: 02/04/2017
% See: main.lp
% Version: 1.0

% -------------------------------ATOMS (facts )-------------------------------

student(adam).
student(valentin).
student(stanislas).
student(chris).

room(oneWest).
room(eightWest).
room(threeEast).
room(sixSouth).
room(chancellorBuilding).

hoursUnit(2, computerScience).
hourUnit(1, finance).

locationUnit(oneWest, computerScience).
locationUnit(eightWest, finance).

%unit(computerScience).
%unit(finance).
% unit(economics).
% unit(chemistry).
% unit(mathematics).
% unit(physics).

lecturer(alanTurin).
lecturer(steveJobs).
% lecturer(karlMarx).
% lecturer(walterWhite).

takes(computerScience, adam).
takes(finance, stanislas).
takes(economics, valentin).
takes(chemistry, chris).
takes(physics, adam).
takes(physics, chris).
takes(mathematics, adam).
takes(mathematics, stanislas).
takes(mathematics, valentin).
takes(mathematics, chris).

teaches(computerScience, alanTurin).
teaches(mathematics, alanTurin).
teaches(finance, steveJobs).
teaches(economics, karlMarx).
teaches(chemistry, walterWhite).
teaches(physics, walterWhite).

capacity(2, oneWest).
capacity(2, eightWest).
capacity(2, threeEast).
capacity(3, sixSouth).
capacity(4, chancellorBuilding).

% corresponds to specific timestep where lecturer has other commitments
othercommitments(1, alanTurin).
othercommitments(4, steveJobs).
othercommitments(6, karlMarx).
othercommitments(8, walterWhite).
