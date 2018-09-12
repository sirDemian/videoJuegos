extends Node2D
export (float) var cant_boing_plataf
export (float) var high_boing_plataf
export (float) var cant_portal
export (float) var high_portal
export (int)   var large_of_game
var width
var boing  = preload("res://instance/BoingPlataform.tscn")
var portal = preload("res://instance/Platform.tscn")

func _ready():
	width = get_viewport().get_visible_rect().size.x
	var portal_y = 0
	var y = 0
	var half_width = width/2
	while y > -30 * large_of_game:
		var new_boing  = boing.instance()
		new_boing.set_global_position(Vector2( rand_range(-half_width, half_width), y))
		y -= rand_range(cant_boing_plataf, high_boing_plataf)
		add_child(new_boing)
		
#	while (y < -30 * large_of_game) && (y > -60 * large_of_game):
#		render_platforms(half_width, y, portal_y)
#		y -= rand_range(cant_boing_plataf * 1.75 , high_boing_plataf * 0.9)
#		portal_y -= rand_range(cant_portal, high_portal)
#

#	while y > -100 * large_of_game && y < -60 * large_of_game:
#		render_platforms(half_width, y, portal_y)
#		y -= rand_range(cant_boing_plataf * 2.5 , high_boing_plataf * 0.5)
#		portal_y -= rand_range(cant_portal / 5 , high_portal )


func render_platforms(half_width, y, portal_y):
		var new_boing  = boing.instance()
		var new_portal = portal.instance()
		new_boing.set_global_position(Vector2( rand_range(-half_width, half_width), y))
		new_portal.set_global_position(Vector2(rand_range(-half_width, half_width), portal_y))
		add_child(new_boing)
		add_child(new_portal)
		
#func _process(delta):
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
