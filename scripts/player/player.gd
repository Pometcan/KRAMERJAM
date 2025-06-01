extends CharacterBody2D
class_name Player

const SPEED := 200 * 600
var direction := Vector2(0.0,0.0)
var h_axis := 0.0
var v_axis := 0.0
var fliph := false
var mouse_pos := position
var friction := 0.05
var moving_to_mouse := false
var in_bounds := true
var original_scale := scale
var inventory = []
var running = false
var form = 1

@onready var player_sprite: AnimatedSprite2D = $playerSprite
@onready var interract_area: Area2D = $interractArea

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	###
	###MOVEMENT
	###
	if velocity.length() >= 4000:
		player_sprite.play("run_"+str(form))
	elif velocity.length() != 0:
		player_sprite.play("walk_"+str(form))
	else:			
		player_sprite.play("idle_"+str(form))

	if Input.is_action_pressed("run"):
		running = true
		
	else: 
		running = false
	if Main.able_to_move and not moving_to_mouse:
		velocity = Vector2(0,0)
	if Main.able_to_move and in_bounds:
		#mouse movement
		if Input.is_action_pressed("left_click"):
			mouse_pos = get_global_mouse_position()
			direction = (mouse_pos - position).normalized()
			
			if not running:
				velocity = direction * SPEED * _delta
			else:
				velocity = direction * SPEED * _delta * 2
				
			moving_to_mouse = true
			
		if moving_to_mouse:
			if (mouse_pos - position).length() < SPEED/100:
				moving_to_mouse = false
			else:
				direction = (mouse_pos - position).normalized()
				
				if not running:
					velocity = direction * SPEED *_delta
				else:
					velocity = direction * SPEED * _delta * 2
					
		h_axis = Input.get_axis("ui_left", "ui_right")
		v_axis = Input.get_axis("ui_up", "ui_down")

		if (h_axis < 0 or velocity.x < 0):
			if fliph:
				player_sprite.flip_h = true
				interract_area.position.x = 0
			fliph = false
		elif (h_axis > 0 or velocity.x > 0):
			if !fliph:
				player_sprite.flip_h = false
				interract_area.position.x = 300
			fliph = true
		player_sprite.set_flip_h(fliph)
		
		#key based movement
		direction.x = h_axis
		direction.y = v_axis
		direction = direction.normalized()
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			if not running:
				velocity = direction * SPEED * _delta
			else:
				velocity = direction * SPEED * _delta * 2
			moving_to_mouse = false

		if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up"):
			if not running:
				velocity = direction * SPEED * _delta
			else:
				velocity = direction * SPEED * _delta * 2
			
			moving_to_mouse = false

	move_and_slide()
	if Input.is_action_just_pressed("transform"):
		form += 1
	
	
