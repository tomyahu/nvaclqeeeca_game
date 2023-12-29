extends Node2D


var default_label_origin
signal timeout

func _ready():
	default_label_origin = $Label.get_transform().origin


func _process(delta):
	self.set_value_no_fx( int( $TimeLeftTimer.get_time_left() + 0.5 ) )


# set_value_no_fx: int
# sets the value of the label without any special effects, useful for reseting
# a level, shouldn't be used though
func set_value_no_fx(num):
	$Label.text = str(num)


# set_value: int
# sets the label to a percentage based on the value given, also moves the label
# a little bit so it catches the player atention
func set_value(num):
	self.set_value_no_fx(num)
	$Label.set_position( default_label_origin - Vector2( 0, 1 ) )
	$Timer.start()


func add_noise(noise):
	var time_left = $TimeLeftTimer.get_time_left()
	time_left = max(0.1, time_left - noise)
	
	$TimeLeftTimer.stop()
	$TimeLeftTimer.start(time_left)


# set_total_time: int
# sets the wait time for the TimeLeftTimer
func set_total_time(time):
	$TimeLeftTimer.wait_time = time


# start_timer
# starts the TimeLeftTimer
func start_timer():
	$TimeLeftTimer.start()


# _on_timer_timeout()
# returns the position of the label to normal
func _on_timer_timeout():
	$Label.set_position( default_label_origin )


func _on_time_left_timer_timeout():
	timeout.emit()
