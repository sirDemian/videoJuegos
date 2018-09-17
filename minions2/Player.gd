extends KinematicBody2D

export (float) var GRAVITY = 20
export (float) var SPEED = 200
export (float) var JUMP_HEIGTH = -400 
const UP = Vector2(0,-1)
var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_up"):
		motion.y = JUMP_HEIGTH
		
	motion = move_and_slide(motion, UP)
