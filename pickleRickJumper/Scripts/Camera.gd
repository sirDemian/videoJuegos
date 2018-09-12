extends Camera2D
var pickleRick
export(NodePath) var pickleRick_path

func _ready():
	pickleRick = get_node(pickleRick_path)
	

func _process(delta):
	get_node("Score/Label").set_text(String(get_score()))
	if pickleRick.get_global_position().y < get_global_position().y:
		set_global_position(Vector2(0,pickleRick.get_global_position().y))

func get_score():
	return int(get_global_position().y * -1)
	