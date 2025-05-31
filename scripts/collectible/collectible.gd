extends Area2D
@onready var player: CharacterBody2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (player in get_overlapping_bodies()) and Input.is_action_just_pressed("interract"):
		queue_free()
		print(get_overlapping_bodies())
