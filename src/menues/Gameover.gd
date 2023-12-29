extends Control


var option_list
var option_index

# Called when the node enters the scene tree for the first time.
func _ready():
	option_list = [ $Options/Retry, $Options/Exit ]
	option_index = 0
	option_list[option_index].select()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var old_option = option_index
	
	if Input.is_action_just_pressed("ui_down"):
		option_index += 1
	
	if Input.is_action_just_pressed("ui_up"):
		option_index += len(option_list) - 1
	
	option_index %= len(option_list)
	
	if option_index != old_option:
		option_list[old_option].unselect()
		option_list[option_index].select()
		
	if Input.is_action_just_pressed("ui_accept"):
		option_list[option_index].action()
	
