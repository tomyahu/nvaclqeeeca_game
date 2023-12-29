extends Node

var last_level = "res://src/levels/Level2.tscn"
var gameover_scene = "res://src/menues/Gameover.tscn"
@export var starting_scene = gameover_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	change_scene(starting_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# change_scene: str
# removes the current main scene and adds a new scene
func change_scene(scene_path):
	for i in range(0, $Scene.get_child_count()):
		$Scene.get_child(i).queue_free()
	
	var scene = load(scene_path).instantiate()
	$Scene.add_child( scene )


# gameover
# changes the scene to a gameover_scene
func gameover():
	change_scene(gameover_scene)


# go_to_last_level
# goes to the last level
func go_to_last_level():
	change_scene(last_level)


# getter
func get_chat():
	return $UI/Chat/Chat

