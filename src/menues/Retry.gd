extends "res://src/menues/GameoverOption.gd"


# action
# Starts the last level from the beginning
func action():
	var main = get_tree().get_root().get_child(0)
	var chat = main.get_chat()
	chat.mood("normal")
	main.go_to_last_level()
