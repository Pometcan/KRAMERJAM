extends Control
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var start_scene = load("res://scenes/levels/main_menu.tscn")


func _ready(): 
	audio_stream_player_2d.play()
	pass
	

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene)
	pass # Replace with function body.
