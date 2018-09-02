extends Node2D
export (float) var cant_plataforms
export (float) var high_pltaforms
export (int)   var large_of_game
var width
var boing  = preload("res://instance/BoingPlataform.tscn")
var portal = preload("res://instance/Platform.tscn")

func _ready():
	width = get_viewport().get_visible_rect().size.x
	#randomize()
	var y = 0
	while y > -100 * large_of_game:
		var new_boing  = boing.instance()
		var new_portal = portal.instance()
		new_boing.set_global_position(Vector2(rand_range(-width/2,width/2),y))
		new_portal.set_global_position(Vector2(rand_range(-width/2,width/2), y))
		add_child(new_boing)
		add_child(new_portal)
		y-= rand_range(cant_plataforms, high_pltaforms)


#func _process(delta):
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
