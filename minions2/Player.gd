extends KinematicBody2D

export (float) var GRAVITY = 20
export (float) var MAX_SPEED = 300
export (float) var JUMP_HEIGTH = 2
export (float) var ACCELERATION = 50

const UP = Vector2(0,-1)
var motion = Vector2()
var real_jump = -425 * JUMP_HEIGTH

func _physics_process(delta):
	var hero = get_node("PlayerAnimatedSprite")
	var friction = false
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(MAX_SPEED , motion.x + ACCELERATION)
		run_rigth(hero)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(-MAX_SPEED , motion.x - ACCELERATION)
		run_left(hero)
	else:
		hero.play("Idle")
		friction = true
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = real_jump	
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.3)
			#inercia (desde, hasta, porcentaje de rozamiento)
	else:
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.1)
		if motion.y < 0:
			hero.play("Jump")
		else:
			hero.play("Fall")
		
	motion = move_and_slide(motion, UP)

func run_rigth( a_sprite):
	a_sprite.flip_h = false
	a_sprite.play("Run")
	
func run_left(a_sprite):
	a_sprite.flip_h = true
	a_sprite.play("Run")