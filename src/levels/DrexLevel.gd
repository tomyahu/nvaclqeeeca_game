extends "res://src/levels/level.gd"


func _on_victory_area_body_entered(body):
	self.completed()
