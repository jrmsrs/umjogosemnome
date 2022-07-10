extends Node

var player: Node2D
var first_position: bool = true

var reload_enemy: bool = false
var player_life_max: float = 8
var player_life = player_life_max

var progress = {
	"intro1": 			false,
	"intro2": 			false,
	"presentation1": 	false,
	"presentation2": 	false,
	"rats": 0,
}

var whip_UNLOCKED: bool = false
var carrot_UNLOCKED: bool = false
var carrot: float = 0

var dash_UNLOCKED: bool = false
var djump_UNLOCKED: bool = false
var excarrot_UNLOCKED: bool = false
var wjump_UNLOCKED: bool = false

var game_saving: bool = false
var checkpoint: Vector2
var soft_checkpoint: Vector2
var elevator_checkpoint: bool = false
var elevator_pos: String = "Pos1"
var elevator_working: bool = false

var player_out: bool = false

enum { NONE, INSOFT, INHARD, OUT }
var paused = NONE

func _ready():
	randomize()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen
