extends Control

var start_scene = load("res://scenes/levels/main_menu.tscn")
@onready var label_2: Label = $MarginContainer/VBoxContainer/Label2
@onready var h_slider: HSlider = $MarginContainer/VBoxContainer/HSlider

@export_enum("Master") var bus_name: String

var bus_index : int= 0

func _ready(): 
	h_slider.value_changed.connect(on_value_changed)
	
func on_value_changed(value: float) -> void: 
	pass 
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene)
	pass # Replace with function body.
