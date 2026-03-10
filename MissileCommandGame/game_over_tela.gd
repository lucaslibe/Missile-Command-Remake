extends Panel
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
