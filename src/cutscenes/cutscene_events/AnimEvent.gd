extends "res://src/cutscenes/cutscene_events/ActionEvent.gd"

class_name AnimEvent

var animated_sprite_2d : AnimatedSprite2D
var animation_to_play : String


# action
# plays an animation from an AnimatedSprite2D
func action():
	print(animated_sprite_2d)
	animated_sprite_2d.play( animation_to_play )
	super.action()


#setters
func set_animated_sprite_2d( new_sprite ):
	self.animated_sprite_2d = new_sprite
	print(new_sprite)

func set_animation_to_play( new_animation ):
	self.animation_to_play = new_animation
