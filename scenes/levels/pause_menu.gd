extends Control

@onready var main: Node2D = $"../.."
@onready var pause_menu: Control = $"."


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_dewam_pressed() -> void:
	main.pauseMenu()
	pass # Replace with function body.
