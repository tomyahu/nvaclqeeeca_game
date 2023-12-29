extends "res://src/cutscenes/cutscene_events/CutsceneEvent.gd"

class_name ActionEvent

var finished = false

# reset
# resets the variable finished
func reset():
	finished = false


# action
# the action of the event
func action():
	finished = true


# update
# does an action on the first frame this event is updated
func update(delta):
	if not finished:
		action()


# is_finished
# returns the variable finished
func is_finished():
	return finished

