extends Node

const NOISE_THRESHOLD = 100
var random = RandomNumberGenerator.new()
var connected_noise_makers = false
@export var next_scene = ""
@export var total_time = 60


# _ready
# resets the noise index
# registers all noise makers
# resets the player position
func _ready():
	$NoiseIndex.set_total_time(total_time)
	$NoiseIndex.start_timer()
	random.randomize()
	
	if not connected_noise_makers:
		for child in $NoiseMakers.get_children():
			child.noise_made.connect(add_noise_with_noise_maker)
		connected_noise_makers = true
	
	$Player.position = $Positions/PlayerPosition.position


func _process(delta):
	pass


# completed
# goes to the next scene if exists, resets the level otherwise
func completed():
	if next_scene == "":
		return _ready()
	else:
		get_tree().get_root().get_child(0).change_scene(next_scene)


# gameover
# goes to gameover screen
func gameover():
	var main = get_tree().get_root().get_child(0)
	var chat = main.get_chat()
	chat.mood("respect")
	chat.set_speed_multiplier(1)
	main.gameover()


# add_noise_index: int
# adds noise to the noise index
func add_noise_index(noise):
	var chat = get_tree().get_root().get_child(0).get_chat()
	chat.mood("silence")
	chat.set_speed_multiplier(3)
	$ChatSilenceTimer.start()
	$SFXPlayers/GlassCracking.play()
	$NoiseIndex.add_noise(noise)


# add_noise_with_noise_maker: NoiseMaker, Player
# takes a noise maker and adds its noise to the noise index
func add_noise_with_noise_maker( noise_maker, player ):
	self.add_noise_index(noise_maker.get_noise())
	player.move_backwards()



func _on_noise_index_timeout():
	gameover()


func _on_chat_silence_timer_timeout():
	var chat = get_tree().get_root().get_child(0).get_chat()
	chat.mood("normal")
	chat.set_speed_multiplier(1)
