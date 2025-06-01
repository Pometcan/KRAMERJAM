extends Area2D

@onready var player: Player = $"../Player"
@export var dialogue_resource: DialogueResource
var i = 0
var area_names = [""]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for area in get_overlapping_areas():
		if area.name == "interractArea":
			if "interractArea" in area_names and Input.is_action_pressed("interract"):
				Main.able_to_move = false
				DialogueManager.show_example_dialogue_balloon(load("res://assets/dialog/signs.dialogue"), "Dur")
				player.velocity = Vector2.ZERO
				player.direction = Vector2.ZERO
				queue_free()
