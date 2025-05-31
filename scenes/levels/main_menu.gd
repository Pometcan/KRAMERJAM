extends Control

@export var start_scene : PackedScene = null
@export var credits_scene : PackedScene = null
@export var settings_scene : PackedScene = null

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene)
	pass # Replace with function body.
	

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(credits_scene)
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

func _on_ayarlar_pressed() -> void:
	get_tree().change_scene_to_packed(settings_scene)
	pass # Replace with function body.
