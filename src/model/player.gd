extends CharacterBody2D


@export var SPEED = 300.0
@export var SLOW_SPEED = 100.0
var in_control = true
var walking = false


func _physics_process(delta):
	if in_control:
		var speed = SPEED
		if Input.is_action_pressed("ui_accept"):
			speed = SLOW_SPEED
		
		velocity.x = 0
		velocity.y = 0
		
		if Input.is_action_pressed("ui_up"):
			velocity.y -= speed
		if Input.is_action_pressed("ui_down"):
			velocity.y += speed
		
		if Input.is_action_pressed("ui_left"):
			velocity.x -= speed
		if Input.is_action_pressed("ui_right"):
			velocity.x += speed
		
		if abs(velocity.x) + abs(velocity.y) > SLOW_SPEED:
			if not walking:
				$AnimatedSprite2D.play("walk")
				walking = true
		else:
			if walking:
				$AnimatedSprite2D.play("idle")
				walking = false

	move_and_slide()


# move_backwards
# moves the player to the other direction
func move_backwards():
	in_control = false
	velocity *= -1
	$HitstunTimer.start()
	$ReverseTimer.start()


func _on_hitstun_timer_timeout():
	in_control = true


func _on_reverse_timer_timeout():
	velocity.x = 0
	velocity.y = 0
