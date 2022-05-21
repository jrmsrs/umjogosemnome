extends KinematicBody2D

var dir: int
var velocity: Vector2

export var run_speed:int=36*8

onready var Sprite = $PlayerSheet
onready var AnimP = $AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	velocity.x=0
	get_input()
	velocity = move_and_slide(velocity,Vector2(0,-1))
	

func get_input():
	dir = Input.get_action_strength('ui_left') - Input.get_action_strength('ui_right')
	$CPUParticles2D.emitting = false
	if dir:
		if is_on_floor(): 
			AnimP.play("run")
			$CPUParticles2D.emitting = true
		else: AnimP.play("jump")
		$CPUParticles2D.direction.x =  2 * dir
		$CPUParticles2D.position.x = 6 * dir
		velocity.x += run_speed * -dir
		if ((abs(dir)>=1) || abs(dir)>abs(run_speed/8)):
			Sprite.flip_h = dir>0
	else: AnimP.play("idle")
