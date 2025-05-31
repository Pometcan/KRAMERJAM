extends Area2D
var area_names = [""]
var i
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
@onready var player: CharacterBody2D = $".."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	i = 0
	area_names = [""]
	for areas in get_overlapping_areas():
		area_names[i] = areas.name
		i + 1
		
	if "Ground" not in area_names and "Pickup" not in area_names:
		player.in_bounds = false
		player.velocity = Vector2(0,0)
		player.moving_to_mouse = false
		if player.velocity.length() < 0.1:
			player.position = player.position + (position - player.position).normalized()*0.05
	else:
		player.in_bounds = true
