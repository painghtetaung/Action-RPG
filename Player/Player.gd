extends KinematicBody2D

var velocity = Vector2.ZERO

const ACCELERATION = 500
const MAX_SPEED = 800
const FRICTION = 500

func _physics_process(delta):
#	the other method to move player	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
#		velocity += input_vector * ACCELERATION * dela
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
#		velocity = velocity.clamped(MAX_SPEED * delta)
#		print(velocity)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
#		print(velocity)	
#	
#	print(velocity)
#	move_and_collide(velocity * delta)
	
#	move_and_slide will handle the delta u dont need to add delta
	velocity = move_and_slide(velocity) 
	print(velocity)
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
		

