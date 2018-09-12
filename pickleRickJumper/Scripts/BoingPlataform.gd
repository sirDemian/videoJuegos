extends StaticBody2D

func _ready():
	pass

func exit_screen():
	queue_free()

func tirate_un_pedo():
	$AnimatedSprite.play("animacion")


func sprite_base():
	$AnimatedSprite.play("base")
