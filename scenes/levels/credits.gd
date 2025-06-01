extends Control

var start_scene = load("res://scenes/levels/main_menu.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene)
	pass # Replace with function body.
