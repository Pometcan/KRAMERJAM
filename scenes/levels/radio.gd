extends Node2D
@onready var music: AudioStreamPlayer2D = $Music


func _ready(): 
	music.play()
	pass
