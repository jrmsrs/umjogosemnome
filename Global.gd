extends Node

var reload_enemy: bool = false
var player_life_max: float = 8
var player_life = player_life_max
var checkpoint: Vector2
var soft_checkpoint: Vector2
var player_out: bool = false
var carrot: float = 0

var whip_UNLOCKED: bool = false
var carrot_UNLOCKED: bool = false

var dash_UNLOCKED: bool = false
var djump_UNLOCKED: bool = false
# para implementar:
var excarrot_UNLOCKED: bool = false
var wjump_UNLOCKED: bool = false

enum { NONE, INSOFT, INHARD, OUT }
var paused = NONE

func _ready():
	randomize()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen
