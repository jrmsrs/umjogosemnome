extends Node

var reload_enemy: bool = false
var player_life_max: float = 8
var player_life = player_life_max
var soft_checkpoint: Vector2
var player_out: bool = false
var carrot: int = 11

func _ready():
	randomize()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen
