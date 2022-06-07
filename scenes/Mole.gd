extends KinematicBody2D

var dir: int
var jump: bool
var velocity: Vector2
var pscale: int = 8
var gravity: int = 320 * pscale

export var run_speed: int = 40 * pscale
export var jump_force: int = -140 * pscale

var current_state := 0
enum { IDLE, RUN, JUMP, FALL }

onready var Sprite = $PlayerSheet
onready var Animation = $AnimationPlayer
onready var GroundParticles = $CPUParticles2D

var timer: float = 0

func _ready(): 
	pass

func _physics_process(delta):
	dir = 0 #Input.get_action_strength('game_left') - Input.get_action_strength('game_right')
	jump = 0 #Input.is_action_just_pressed("game_jump")

	# Implementação de Finite-State Machine para que as ações do objeto seja divididas de forma individual 
	match current_state:
		IDLE:
			_idle_state(delta)
		RUN:
			_run_state(delta)
		JUMP:
			_jump_state(delta)
		FALL:
			_fall_state(delta)

	_limit_vspeed()

# States
# Idle
func _idle_state(_delta):
	Animation.play("idle")
	velocity.x=0
	_move_and_slide()
	_apply_gravity(_delta)
	# Transitions
	if dir:
		current_state = RUN
	if jump:
		current_state = JUMP
	if velocity.y>0 and !is_on_floor():
		current_state = FALL

# Run
func _run_state(_delta):
	Animation.play("run")
	GroundParticles.emitting = true
	GroundParticles.direction.x =  2 * dir
	GroundParticles.position.x = 6 * dir
	_move_lr()
	_move_and_slide()
	_apply_gravity(_delta)

	# Transitions
	if !dir:
		GroundParticles.emitting = false
		current_state = IDLE
	if jump:
		GroundParticles.emitting = false
		current_state = JUMP
	if velocity.y>0 and !is_on_floor():
		GroundParticles.emitting = false
		current_state = FALL


# Jump
func _jump_state(_delta):
	Animation.play("jump")
	if is_on_floor():
		velocity.y = jump_force
	_move_lr()
	_move_and_slide()
	_apply_gravity(_delta)
	# Transitions
	if velocity.y >= 0:
		current_state = FALL

# Fall
func _fall_state(_delta):
	Animation.play("fall")
	_move_lr()
	_move_and_slide()
	_apply_gravity(_delta)

	# Transitions
	if is_on_floor():
		current_state = IDLE

# Helpers
# Funções basicas que vão se repetir dependendo da State
func _apply_gravity(_delta):
	velocity.y += gravity * _delta
func _move_and_slide():
	velocity = move_and_slide(velocity,Vector2(0,-1))
func _move_lr():
	velocity.x = run_speed * -dir
	if (abs(dir)>=1) || abs(dir )> abs(run_speed / pscale):
		Sprite.flip_h = dir > 0
func _limit_vspeed():
	if velocity.y>=1500:
		velocity.y=1500
