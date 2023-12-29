extends Control


@export var max_messages = 35
@export var chat_speed = 5
@export var total_users = 10
var chat_speed_multiplier = 1

var messages = []
var users = []
var colors = [
	"#8a2be2",
	"#9a8000",
	"#14a5b8",
	"#1e90ff",
	"#ff2592",
	"#568e90",
	"#e85927",
	"#ff3a3a",
	"#ff9c3a",
	"#ff3a9c",
	"#008000",
	"#3f7f00",
	"#00ba5d",
]
var adjectives = [
	"sleepy",
	"angry",
	"annoying",
	"peaceful",
	"cynical",
	"hot",
	"illegal",
	"magnificent",
	"cowardly",
	"solid",
	"misinformed",
	"thebetter",
	"hypno",
	"obnoxious",
	"accidental",
	"purple",
	"suspicious",
	"nosy",
	"pathetic",
	"wacky",
	"broken",
	"green",
	"sad",
	"divine",
	"potato",
	"cool",
	"dr",
	"dynamic"
]

var sustantives = [
	"seal",
	"puppy",
	"alligator",
	"mouse",
	"squirrel",
	"citizen",
	"goose",
	"duck",
	"president",
	"monkey",
	"guy",
	"gal",
	"coffee",
	"grape",
	"neko",
	"toaster",
	"slipper",
	"birdwatcher",
	"star",
	"peasant",
	"shinobi"
]

var hello_messages = [
	"hi",
	"hiiiiiii",
	"hey",
	"heyo",
	"o/",
	"\\o/",
]

var excited_messages = [
	"poggers",
	"pog",
	"omg",
	"lets gooooooooo",
	"lets go",
	"lets goooo",
	"lets gooooooooooooooooooooooooooooo",
	"yass",
]

var respect_messages = [
	"o7",
]

var respect_messages2 = [
	"f",
]

var silence_messages = [
	"sh",
	"shh",
	"shhh",
	"shhhh",
	"shhhhh",
	"shhhhhh",
	"shhhhhhh",
	"shhhhhhhh",
	"shhhhhhhhh",
	"shhhhhhhhhh",
	"shhhhhhhhhhh",
	"shhhhhhhhhhhh",
]

var normal_messages = [
	"spooky",
	"is that a bottle!?",
	"is this legal?",
	"[i]This message has been deleted by a moderator.[/i]",
	"I can't believe people lived here",
	"hey do you guys like smoothies?",
	"a ghost slapped my butt once >///<",
	"its so scary",
	"do people lived there?",
	"pog",
	"how old are you?",
	"I used to go into haunted houses all the time as a kid",
	"a friend got posessed by a ghost once, it made her eat all the snacks we had",
	"are you single?",
	"o/",
	"poggies",
	"poggeroni",
]

var moods = {
	"hello"=hello_messages,
	"excited"=excited_messages,
	"respect"=respect_messages,
	"respect2"=respect_messages2,
	"silence"=silence_messages,
	"normal"=normal_messages
}

var current_messages
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	messages = []
	for i in range(max_messages):
		messages.append(" ")
	
	current_messages = hello_messages
	
	for i in range(total_users):
		users.append( {
			username=get_random_username(),
			color=colors.pick_random()
		})


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rng.randf() < chat_speed*chat_speed_multiplier/100.0:
		var user = users.pick_random()
		messages.append( "[b][color=" + user.color + "]" + user.username + ":[/color][/b] " + get_random_message() )
	
	while len(messages) > max_messages:
		messages.pop_front()
	
	update_text()


func update_text():
	self.text = "\n".join( messages )


# get_random_username
func get_random_username():
	var name_components = [adjectives.pick_random().capitalize(), sustantives.pick_random().capitalize()]
	if(rng.randf() < 0.5):
		name_components += [str((randi() % 9999)+1)]
	
	var name = ""
	var r = rng.randf()
	if r < 0.1:
		name_components = ["xX"]+name_components+["Xx"]
		name = "-".join(name_components)
	else:
		name = "".join(name_components)
	
	return name


# get_random_message
func get_random_message():
	var msg = current_messages.pick_random()
	if rng.randf() < 0.2 and ( msg.find("[") != -1 ):
		msg = msg.to_upper()
	#if rng.randf() < 0.4:
	#	msg += "!".repeat( ( rng.randi() % 8 ) + 1 )
	
	return msg


# mood: str
# changes the chat mood
func mood(new_mood):
	self.current_messages = self.moods[new_mood]


# set_speed_multiplier
# sets how fast does the chat go with respect with normal speed
func set_speed_multiplier( multiplier ):
	chat_speed_multiplier = multiplier
