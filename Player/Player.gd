#extends KinematicBody2D
#
#
#
#const ACCELERATION = 500
#const MAX_SPEED = 80
#const FRICTION = 500
#
##enumeration
#enum {
#		MOVE,
#		ROLL,
#		ATTACK,
#}
#
#var state = MOVE
#var velocity = Vector2.ZERO
#
##var animationPlayer = null;
#onready var animationPlayer = $AnimationPlayer
#onready var animationTree = $AnimationTree
#onready var animationState = animationTree.get("parameters/playback")
#func _ready():
#	animationTree.active = true 
##func _ready():
##	animationPlayer = $AnimationPlayer
#func _physics_process(delta):
#	match state:
#		MOVE:
#			move_state(delta)
#
#		ROLL:
#			pass
#
#		ATTACK:
#			attack_state(delta)
#
#
#func move_state(delta):
##the other method to move player	
#	var input_vector = Vector2.ZERO
#	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
#	input_vector = input_vector.normalized()
#	if input_vector != Vector2.ZERO:
#		animationTree.set("parameters/Idle/blend_position", input_vector)
#		animationTree.set("parameters/Run/blend_position", input_vector)
#		animationState.travel("Run")
##		velocity += input_vector * ACCELERATION * dela
#		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
##		velocity = velocity.clamped(MAX_SPEED * delta)
##		print(velocity)
#	else:
#		animationState.travel("Idle")
#		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
##		
#	velocity = move_and_slide(velocity)
#
#	if Input.is_action_just_pressed("attack"):
#		state = ATTACK
#
#func attack_state (delta):
#	pass
#
		
		
		#		
#simple movement
#	if Input.is_action_pressed("ui_right"):
#		velocity.x = 4
#	elif Input.is_action_pressed("ui_left"):
#		velocity.x = -4
#	elif Input.is_action_pressed("ui_up"):
#		velocity.y = -4
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y = 4
#	else:
#		velocity.x = 0
#		velocity.y = 0
	
#	move_and_collide(velocity)
extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			pass
		
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func attack_animation_finished():
	state = MOVE
	
