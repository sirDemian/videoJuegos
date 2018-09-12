extends Camera2D
var pickleRick
var score = 0
var high_score = 0
export(NodePath) var pickleRick_path

func _ready():
	pickleRick = get_node(pickleRick_path)
	

func _process(delta):
	get_node("Score/Label").set_text(String(get_score()))
	get_HighScore()
	if pickleRick.get_global_position().y < get_global_position().y:
		set_global_position(Vector2(0,pickleRick.get_global_position().y))

func get_score():
	return int(get_global_position().y * -1)

func get_HighScore():
	var score = get_score()
	if score > loadScore():
		save(score)
	get_node("HighScore/Label").set_text(String(loadScore()))
	
func save(highscore):
    var highscore_file = File.new()
    highscore_file.open("res://save_game.dat", highscore_file.WRITE)
    highscore_file.store_16(highscore)
    highscore_file.close()

func loadScore():
    var highscore_file = File.new()
    highscore_file.open("res://save_game.dat", highscore_file.READ)
    var highscore = highscore_file.get_16 ( ) 
    highscore_file.close()
    return highscore