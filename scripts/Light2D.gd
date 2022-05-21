extends Light2D


var origin_x
var origin_y
var timer=0

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_x = offset.x
	origin_y = offset.y

func _process(delta):
	if (timer>3):
		offset.x = origin_x + rand_range(-10,10)
		offset.y = origin_y + rand_range(-10,10)
		timer=0
	timer+=1
