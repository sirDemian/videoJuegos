extends KinematicBody2D

export(int) var high_jump = 100
export(int) var pickle_speed = 100
var jump_speed 
var real_speed 
var gravity 
var UP = Vector2(0,-1)
var velocity = Vector2()

export(NodePath) var camera_path

var world = "res://Scenes/World.tscn"

var height
var width
var camera

func _ready():
	jump_speed = 600 * high_jump
	real_speed = 300 * pickle_speed
	gravity = 1000 * high_jump
	camera = get_node(camera_path)
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y
	velocity.x = 0
	velocity.y = 0
	

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = real_speed
		get_node("Sprite").set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -real_speed
		get_node("Sprite").set_flip_h(true)
	else:
		velocity.x = 0
		
	var movement = velocity * delta

	move_and_slide(movement, UP) 

func collision(body):
	if body.is_in_group('plataforma') and velocity.y >0:
		get_tree().change_scene(world)
	if body.is_in_group('boing') and velocity.y >0:
		velocity.y = -jump_speed
		body.tirate_un_pedo()
	
func exit_screen():
	if get_global_position().y > camera.get_global_position().y + height/2:
		get_tree().change_scene(world)
	if get_global_position().x > camera.get_global_position().x and velocity.x > 0:	
		set_global_position(Vector2(-width/2-32,get_global_position().y))
	if get_global_position().x < camera.get_global_position().x and velocity.x < 0:
		set_global_position(Vector2(width/2+32,get_global_position().y))

