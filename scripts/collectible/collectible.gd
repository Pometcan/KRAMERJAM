extends Area2D

var i = 0
var area_names = [""]
var player
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
		#if area.name == "interractArea":
			#player = area.get_node("./Player")
			#if "interractArea" in area_names and Input.is_action_pressed("interract"):
				#player.inventory = ["test"]
		queue_free()
