extends Area2D

@onready var player: Player = $"../Player"

var i = 0
var area_names = [""]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	i = 0
	for area in get_overlapping_areas():
		area_names[i] = area.name
		print(area_names)
		i += 1
		if area.name == "interractArea":
			if "interractArea" in area_names and Input.is_action_pressed("interract"):
				player.able_to_move = false
				player.velocity = Vector2.ZERO
				
				player.direction = Vector2.ZERO
				queue_free()
