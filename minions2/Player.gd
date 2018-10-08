extends KinematicBody2D

export (float) var GRAVITY = 20
export (float) var width_jump = 3
export (float) var JUMP_HEIGTH = 2
export (float) var ACCELERATION = 50

const UP = Vector2(0,-1)
var motion = Vector2()
var real_jump = -425 * JUMP_HEIGTH
var MAX_SPEED = width_jump * 107
var currentState = "Idle"

func _physics_process(delta):
	var hero = $anim #get_node("anim")
	var friction = false
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(MAX_SPEED , motion.x + ACCELERATION)
		run_rigth(hero)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(-MAX_SPEED , motion.x - ACCELERATION)
		run_left(hero)
	else:
		setCurrentState("Idle")
		friction = true
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = real_jump
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.15)
			#inercia (desde, hasta, porcentaje de rozamiento)
	else:
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.01)
		if motion.y < 0:
			setCurrentState("Jump")
		else:
			setCurrentState("Hurt")
		
	motion = move_and_slide(motion, UP)

func run_rigth( a_sprite):
	#a_sprite.flip_h = false
	setCurrentState("Run")
		
func setCurrentState(newState):
	if(newState != currentState):
		currentState = newState
		$anim.play(currentState)
	
func run_left(a_sprite):
	#a_sprite.flip_h = true
	setCurrentState("Run")