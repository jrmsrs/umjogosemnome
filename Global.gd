extends Node

var player: Node2D
var first_position: bool = true

var reload_enemy: bool = false
var player_life_max: float = 8
var player_life = player_life_max

var debug: bool = false

var progress = {
	"intro1": true if debug else false,
	"intro2": true if debug else false,
	"presentation1": true if debug else false,
	"presentation2": true if debug else false,
	"rats": 4 if debug else 0,
}

var whip_UNLOCKED: bool = true if debug else false
var carrot_UNLOCKED: bool = true if debug else false
var carrot: float = 12 if debug else 0

var dash_UNLOCKED: bool = true if debug else false
var djump_UNLOCKED: bool = true if debug else false
var excarrot_UNLOCKED: bool = true if debug else false
var wjump_UNLOCKED: bool = true if debug else false

var game_saving: bool = false
var checkpoint: Vector2
var soft_checkpoint: Vector2
var elevator_checkpoint: bool = true
var elevator_pos: String = "Pos1"
var elevator_working: bool = false

var player_out: bool = false

enum { NONE, INSOFT, INHARD, OUT }
var paused = NONE

func _reset():
	progress = {
		"intro1": true if debug else false,
		"intro2": true if debug else false,
		"presentation1": true if debug else false,
		"presentation2": true if debug else false,
		"rats": 4 if debug else 0,
	}

	whip_UNLOCKED = true if debug else false
	carrot_UNLOCKED = true if debug else false
	carrot = 12 if debug else 0

	dash_UNLOCKED = true if debug else false
	djump_UNLOCKED = true if debug else false
	excarrot_UNLOCKED = true if debug else false
	wjump_UNLOCKED = true if debug else false

func _ready():
	randomize()

func _process(delta):
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_just_pressed("ui_home"):
		debug = !debug
		_reset()
