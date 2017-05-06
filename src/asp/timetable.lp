% CM20252 Coursework
% ASP AnsProlog Timetable
% Author: XXX
% Email: XXX@bath.ac.uk
% Date: 05/05/2017
% See: atoms.lp
% Version: 1.0

%**
@block Timetable{
	Encoding of Timetabling logic.

	@atom roomBooked(T,U,L,R,C)
		represents a scheduled lecture at a timestep T, for a unit U, taught by a lecturer L, in a room R with a student capacity C.

	@atom attendance(T,U,S,R,C)
		represents a student attending a scheduled lecture at a timestep T, for a unit U, in a room R with a student capacity C.

	@atom capacity(T,R,Total)
		represents the number of students Total attending a scheduled lecture at timestep T in a room R.

	@output roomBooked/5

	@output attendance/5
*%

% ------------------------------------------------------------- GENERATORS -------------------------------------------------------------

	%**
	@block Generators{
		Schedules H lectures in a room at a specified timestep, where lecturers teach their unit and students attend it H times.
		Also satisfies some requirements for the basic functional system stated in the coursework specification, including:
		_ students should have all their units scheduled,
		_ lecturers should have all their units scheduled.
		Note: 	by including the atoms generated in the first generator into the second one, the rules/constraints applied to schedule lectures for lectures
				are inherited by students since they can only attend lectures which are correctly scheduled (fit all the requirements specified).
	*%
		%**
			@block Room_Booking{
			Schedules H lectures to be taught by a lecturer L, in a room R (with student capacity C), for a unit U, at timestep T.
			H corresponds to the H of the 'hoursUnit(H,U)' predicate found in 'atoms.lp', which corresponds to the number of lectures that should be scheduled for each unit.
		*%
	        % schedule for lecturers
	        H { roomBooked(T,U,L,R,C) : timesteps(T) , teaches(U,L) , room(R,C) } H :- hoursUnit(H,U).
        %**
		}
		*%
		
		%**
			@block Student_Attendance{
			Schedules which lectures a student S should attend for units U he is enrolled in, in a room R (with student capacity C), at timestep T. 
			Each student must attend H lectures for a unit he takees, where H corresponds to the H of the 'hoursStudentUnit(H,U)' predicate found in 'atoms.lp', 
			which corresponds to the number of lectures that a student should attend for each unit he is enrolled in.
		*%
	        % schedule for students
	        H { attendance(T,U,S,R,C) : roomBooked(T,U,_,R,C) } H :- hoursStudentUnit(H,U), takes(U,S).
         %**
		}
		*%
    %**
	}
	*%

% ------------------------------------------------------------- BASIC SYSTEM -------------------------------------------------------------

	%**
	@block Basic_Functional_System{
		Constraints & rules are used to satisfy the requirements for the basic functional system stated in the coursework specification, including:
		_ students should not be forced to attend two lectures at the same time,
		_ lecturers cannot teach two units at the same time,
		_ rooms can only be used for one lecture at the time,
		_ lecturers cannot teach when they have other commitments.
	*%
	
		%**
		@block Different_Lecturer{
			Removes answers where the lecturer is different for a lecture scheduled in the same room for the same unit.
		*%
	        :- roomBooked(_,U,L1,R,_), roomBooked(_,U,L2,R,_), L1 != L2.
        %**
		}
		*%

		%**
		@block Different_Room{
			Removes answers where the room is different for a same lecture scheduled in at same timestep for the same unit.
		*%
	        :- roomBooked(T,U,_,R1,_), roomBooked(T,U,_,R2,_), R1 != R2.
        %**
		}
		*%
		
		%**
		@block Different_Room_Bis{
			Removes answers where the room is different for a same lecture scheduled in at same timestep with the same lecturer.
		*%
	        % if same time and lecturer / different rooms / any unit and room capacity:
	        % => rempove answers where the rooms are different.
	        :- roomBooked(T,_,L,R1,_), roomBooked(T,_,L,R2,_), R1 != R2.
        %**
		}
		*%
		
		%**
		@block Different_Unit{
			Removes answers where the unit is different for a same lecture scheduled in at same timestep in the same room.
		*%
	        :- roomBooked(T,U1,_,R,_), roomBooked(T,U2,_,R,_), U1 != U2.
        %**
		}
		*%

		%**
		@block Lecturer_not_Teach_Unit{
			Removes answers where a lecturer teaches a unit that is not his.
		*%
        	:- roomBooked(T,U,L,R,_), not teaches(U,L).
        %**
		}
		*%

		%**
		@block Other_Commitments{
			Removes answers where a lecturer teaches at a timestep identical to the timesteps when he has other commitments.
		*%
	        :- roomBooked(T,U,L,R,_), commitments(T,L).
        %**
		}
		*%

		%**
		@block Room_Capacity{
			First counts number of students in a specific room R at a timestep T,
			Then removes answer where the number of students in a room exceeds the room's student capacity.
		*%
        capacity(T,R,Total) :- Total = #count {S: attendance(T,_,S,R,_)}, room(R,_), timesteps(T).
        :- roomBooked(T,_,_,R,C), capacity(T,R,Total), Total>C.
        %**
		}
		*%
	%**
	}
	*%
	
	% ------------------------------------------------------------- EXTENSION 1 -------------------------------------------------------------

    %**
	@block Extension_1{
		Weak constraints are used to satisfy the requirements for extension 1 stated in the coursework specification, including:
		_ lecturers can have preferred teaching times and the timetables take this into account as much as possible.
		_ timetables offer a lunch break where possible.
	*%
		%**
		@block LunchBreak{
			Adds 10 penalty points for each lecture that is scheduled during the lunchbreak timesteps.
			Lunch breaks are at timesteps 3, 8, 13, 18 and 23
			Weak constraints are used to schedule a lecture during the lunch break if needed, otherwise lectures are scheduled outside lunchbreaks.
			For each lecture scheduled during a lunch break period, 10 penalty points are added to the current model.
		*%
	        :~ roomBooked(T,_,_,_,_), T==3.[10,T]
	        :~ roomBooked(T,_,_,_,_), T==8.[10,T]
	        :~ roomBooked(T,_,_,_,_), T==13.[10,T]
	        :~ roomBooked(T,_,_,_,_), T==18.[10,T]
	        :~ roomBooked(T,_,_,_,_), T==23.[10,T]
        %**
		}
		*%
		
		%**
		@block PreferredTeachingTime{
			Adds 10 penalty points for each lecturer who doesn't teach at his preferred timestep.
			Preferred teaching times are specified in the 'atoms.lp' file under the 'preferred(P,L)' atoms.
		*%
	        % if same lecturer / different time / any unit, room and room capacity:
	        % => add 10 points penalty if the lecture booked is different to the lecturer's preferred teaching time.
	        :~ roomBooked(T1,_,L,_,_), preferred(T2,L), T1!=T2.[10,T1,L,T2]
        %**
		}
		*%
	%**
	}
	*%
	
	% ------------------------------------------------------------- EXTRA FEATURES -------------------------------------------------------------

    %**
	@block ExtraFeature{
		Extra feature taking into account breaks on Wednesday afternoons for extra activities.
		The rule wednesdayOff books a room at the timesteps corresponding to a wednesday afternoon, thus making sure no lectures can be scheduled during that time.
	*%
        wednesdayOff :- roomBooked(13,_,_,_,_).
        wednesdayOff :- roomBooked(14,_,_,_,_).
        wednesdayOff :- roomBooked(15,_,_,_,_).
        :- wednesdayOff.
	%**
	}
	*%
	
	% ------------------------------------------------------------- DISPLAY -------------------------------------------------------------

	%**
	@block Display{
		Outputs only the roomBooked and attendance atoms to the terminal.
	*%
        #show roomBooked/5.
        #show attendance/5.
    %**
	}
	*%

%**
}
*%