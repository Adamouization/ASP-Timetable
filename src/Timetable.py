#!/usr/bin/env python

import sys
import json
import operator
from Tkinter import *
import ttk

print 'Generating timetable...'

# load json data
parsed_input = json.load(sys.stdin)

# first JSON objects from the clingo output
solver = parsed_input['Solver']
input = parsed_input['Input']
call = parsed_input['Call']
result = parsed_input['Result']
models = parsed_input['Models']
calls = parsed_input['Calls']
timeR = parsed_input['Time']

# get the model with the optimal value of the form [value, index]
optimal_value = [0,0]
witnesses = call[0]['Witnesses']
for i in range(len(witnesses)):
	opt = witnesses[i]['Opt'][0]
	if optimal_value > opt:
		optimal_value[0] = opt
		optimal_value[1] = i

# get data for optimal model
value = witnesses[optimal_value[1]]['Value']

# initialize lists to store parsed data
roomBooked = []
attendance = []

# split roomBooked and attendance atoms into 2 seperate lists
for k in range(len(value)):
	atom = value[k]
	if atom[0] == 'r':
		atom = atom[11:]
		atom = atom[:-1]
		atom = atom.split(',')
		roomBooked.append(atom)
	elif atom[0] == 'a':
		atom = atom[11:]
		atom = atom[:-1]
		atom = atom.split(',')
		attendance.append(atom)

# sort roomBooked and attendance lists by time
def getFirst(elem):
	return int(elem[0])
roomBooked = sorted(roomBooked, key=getFirst, reverse=True)
attendance = sorted(attendance, key=getFirst, reverse=True)


# ---------------------------------- GUI

# create view
root = Tk();
root.wm_title("Generated Timetable")
style = ttk.Style(root)
style.configure('Treeview', rowheight=40)

# create tree
tree = ttk.Treeview(root)

# create columns
tree["columns"]=("one","two","three","four","five", "six")
tree.column("one", minwidth=200, width=200, stretch=True)
tree.column("two", minwidth=200, width=200, stretch=False)
tree.column("three", minwidth=200, width=200, stretch=False)
tree.column("four", minwidth=200, width=200, stretch=False)
tree.column("five", minwidth=300, width=300, stretch=False)	
tree.column("six", minwidth=75, width=75, stretch=False)	

# create headings 
tree.heading("one", text="Time")
tree.heading("two", text="Unit")
tree.heading("three", text="Room")
tree.heading("four", text="Lecturer")
tree.heading("five", text="Students")
tree.heading("six", text="Timestep")

# take whole window width
tree.grid(row=0, column=0, sticky='we')
root.grid_columnconfigure(0,weight=1)

# configure different tree lines as tags (different colors for odd and even rows)
tree.tag_configure('evenrow', background='#66A5AD', font='Arial 20')
tree.tag_configure('oddrow', background='#C4DFE6', font='Arial 20')

# generate a line for each lecture scheduled
for m in range(len(roomBooked)):
	day = ""
	time = ""
	students = ""
	temp_timestep = int(roomBooked[m][0])
	if (temp_timestep == 1) or (temp_timestep == 2) or (temp_timestep == 3) or (temp_timestep == 4) or (temp_timestep == 5):
		day = "Monday"
		if temp_timestep == 1:
			time = "8am - 10am"
		elif temp_timestep == 2:
			time = "10am - 12pm"
		elif temp_timestep == 3:
			time = "12pm - 2pm"
		elif temp_timestep == 4:
			time = "2pm - 4pm"
		elif temp_timestep == 5:
			time = "4pm - 6pm"
	elif (temp_timestep == 6) or (temp_timestep == 7) or (temp_timestep == 8) or (temp_timestep == 9) or (temp_timestep == 10):
		day = "Tuesday"
		if temp_timestep == 6:
			time = "8am - 10am"
		elif temp_timestep == 7:
			time = "10am - 12pm"
		elif temp_timestep == 8:
			time = "12pm - 2pm"
		elif temp_timestep == 9:
			time = "2pm - 4pm"
		elif temp_timestep == 10:
			time = "4pm - 6pm"
	elif (temp_timestep == 11) or (temp_timestep == 12) or (temp_timestep == 13) or (temp_timestep == 14) or (temp_timestep == 15):
		day = "Wednesday"
		if temp_timestep == 11:
			time = "8am - 10am"
		elif temp_timestep == 12:
			time = "10am - 12pm"
		elif temp_timestep == 13:
			time = "12pm - 2pm"
		elif temp_timestep == 14:
			time = "2pm - 4pm"
		elif temp_timestep == 15:
			time = "4pm - 6pm"
	elif (temp_timestep == 16) or (temp_timestep == 17) or (temp_timestep == 18) or (temp_timestep == 19) or (temp_timestep == 20):
		day = "Thursday"
		if temp_timestep == 16:
			time = "8am - 10am"
		elif temp_timestep == 17:
			time = "10am - 12pm"
		elif temp_timestep == 18:
			time = "12pm - 2pm"
		elif temp_timestep == 19:
			time = "2pm - 4pm"
		elif temp_timestep == 20:
			time = "4pm - 6pm"
	elif (temp_timestep == 21) or (temp_timestep == 22) or (temp_timestep == 23) or (temp_timestep == 24) or (temp_timestep == 25):
		day = "Friday"
		if temp_timestep == 21:
			time = "8am - 10am"
		elif temp_timestep == 22:
			time = "10am - 12pm"
		elif temp_timestep == 23:
			time = "12pm - 2pm"
		elif temp_timestep == 24:
			time = "2pm - 4pm"
		elif temp_timestep == 25:
			time = "4pm - 6pm"
	for n in range(len(attendance)):
		if (attendance[n][0] == roomBooked[m][0]) and (attendance[n][3] == roomBooked[m][3]):
			if not students:
				students = attendance[n][2]
			else:
				students = students + " - " + attendance[n][2]
	if not students:
		students = "empty"
	if (m%2 == 0):
		tree.insert("", 0, text=day, values=(time,roomBooked[m][1],roomBooked[m][3],roomBooked[m][2], students, roomBooked[m][0]), tags=('evenrow',))
	else:
		tree.insert("", 0, text=day, values=(time,roomBooked[m][1],roomBooked[m][3],roomBooked[m][2], students, roomBooked[m][0]), tags=('oddrow',))

print 'Timetable successfully generated.'

tree.pack()

# label specifying when lunchbreaks are
label_commands = Label(root, text="Highlight a row by clicking it, and use the mouse scroll to move up and down the timetable")
label_commands.pack()

label_empty = Label(root, text="  ")
label_empty.pack()

# label specifying when lunchbreaks are
label_lunch = Label(root, text="Lunch breaks are everyday from 12pm to 2pm")
label_lunch.pack()

# label specifying there are no lectures on wednesdays afternoon
label_wednesdays_off = Label(root, text="There are no lectures on Wednesday afternoons from 12pm onwards")
label_wednesdays_off.pack()

label_empty2 = Label(root, text="  ")
label_empty2.pack()

# label outputting time to generate the timetable in ASP
label_time = Label(root, text="Timetable generated in : " + str(timeR["Total"]) + "s")
label_time.pack()

# label outputting ASP files used
label_input_file = Label(root, text="ASP input files: '" + input[0] + "' and '" + input[1] + "'")
label_input_file.pack()



root.resizable(0,0)
root.mainloop()