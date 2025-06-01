extends Control
@export var start_scene : PackedScene = null



func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene)
	pass # Replace with function body.
