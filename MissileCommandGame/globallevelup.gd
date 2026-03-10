extends Node
var deadcities = 0
signal level_up(new_level)
func _ready():
	deadcities = 0
func _process(_delta):
	if deadcities == 6:
		deadcities = 0
		get_tree().change_scene_to_file("res://game_over.tscn")
