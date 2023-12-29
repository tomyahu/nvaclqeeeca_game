extends Area2D

@export var noise: = 10
signal noise_made( noise_maker, player )


#getter
func get_noise():
	return self.noise


func _on_body_entered(body):
	noise_made.emit(self, body)
