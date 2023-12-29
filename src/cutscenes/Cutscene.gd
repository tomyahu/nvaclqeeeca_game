extends Node

var anim = preload("res://src/cutscenes/cutscene_events/AnimEvent.gd")

var events = []
var current_events = {}
var current_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	current_time = 0
	events = []
	current_events = {}
	
	# make dummy scene
	var drex_spin_anim = anim.new()
	drex_spin_anim.set_animated_sprite_2d($Entities/Drex)
	drex_spin_anim.set_animation_to_play( "spin" )
	events.append( [ 1.0, drex_spin_anim ] )
	
	for event_pair in events:
		var event = event_pair[1]
		event.reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_time += delta
	
	while len(events) > 0 and events[0][0] < current_time:
		current_events[ events.pop_front()[1] ] = true
	
	for event in current_events.keys():
		event.update(delta)
		
	for event in current_events.keys():
		if event.is_finished():
			current_events.erase( event )

