extends CharacterBody2D
class_name kahveciDayi

@onready var player_sprite: AnimatedSprite2D = $playerSprite
@onready var player: Player = $"../Player"
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var denger_area: Area2D = $dengerArea
@export var pathFallow: PathFollow2D


const SPEED := 100 * 600
var direction := Vector2(0.0,0.0)
var h_axis := 0.0
var v_axis := 0.0
var fliph := false
var friction := 0.05
var in_bounds := true
var original_scale := scale
var pathLoop := true
var target: Node2D
var pathPosition: Vector2
var running = false

func _ready() -> void: 
	call_deferred("seeker_setup")
	pass
	
func seeker_setup():
	await get_tree().physics_frame
	if target: 
		navigation_agent_2d.target_position = target.global_position
	
	
func _physics_process(_delta: float) -> void:
	###
	###MOVEMENT
	###
	
	if velocity.length() != 0 or pathLoop:
		player_sprite.play("walk")
	else:			
		player_sprite.play("idle")
	
	for area in denger_area.get_overlapping_areas():
		if area.name == "gimp":
			target = player
			pathLoop = false
	
	if (h_axis < 0 or velocity.x < 0 ):
		if fliph:
			player_sprite.flip_h = true
			denger_area.position.x = 0
		fliph = false
	elif (h_axis > 0 or velocity.x > 0 ):
		if !fliph:
			player_sprite.flip_h = false
			denger_area.position.x = 1800
		fliph = true
	player_sprite.set_flip_h(fliph)
	
	
	if (pathLoop == true):
		if (pathFallow): 
			pathFallow.progress += 1000 *_delta
			h_axis = pathFallow.global_position.x - position.x
	else:
		if target: 
			navigation_agent_2d.target_position = target.global_position
			pathLoop = false
		if navigation_agent_2d.is_navigation_finished():
			return
		
		var current_agent_position = global_position
		var next_path_position = navigation_agent_2d.get_next_path_position()
		velocity = current_agent_position.direction_to(next_path_position) * SPEED * _delta
		
		var feet :Vector2= abs(target.position - position)
		if (feet.x > 4000 or feet.y > 2000):
			pathLoop = true
			velocity = Vector2.ZERO
	move_and_slide()
