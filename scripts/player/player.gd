extends CharacterBody2D

const SPEED := 100 * 500
var direction := Vector2(0.0,0.0)
var h_axis := 0.0
var v_axis := 0.0
var fliph := false
var mouse_pos := position
var moving_to_mouse := false
var friction := 0.05
var in_bounds := true
var original_scale := scale
var inventory = []

@onready var player_sprite: AnimatedSprite2D = $playerSprite
@onready var interract_area: Area2D = $playerSprite/interractArea

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	###
	###MOVEMENT
	###
	if not moving_to_mouse:
		velocity = Vector2(0,0)
	if in_bounds:
		#mouse movement
		if Input.is_action_pressed("left_click"):
			mouse_pos = get_global_mouse_position()
			direction = (mouse_pos - position).normalized()
			velocity = direction * SPEED * _delta
			moving_to_mouse = true
		if moving_to_mouse:
			if (mouse_pos - position).length() < SPEED/100:
				moving_to_mouse = false
			else:
				direction = (mouse_pos - position).normalized()
				velocity = direction * SPEED *_delta
		
		h_axis = Input.get_axis("ui_left", "ui_right")
		v_axis = Input.get_axis("ui_up", "ui_down")
		
		if (h_axis < 0 or velocity.x < 0):
			player_sprite.play("walk")
			if fliph:
				player_sprite.flip_h = true
				interract_area.position.x = 0
			fliph = false
		elif (h_axis > 0 or velocity.x > 0):
			player_sprite.play("walk")
			if !fliph:
				player_sprite.flip_h = false
				interract_area.position.x = 300
			fliph = true
		else: 
			player_sprite.play("idle")
		player_sprite.set_flip_h(fliph)
		
		#key based movement
		direction.x = h_axis
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			velocity = direction * SPEED * _delta
			moving_to_mouse = false
			
		direction.y = v_axis
		if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up"):
			velocity = direction * SPEED * _delta
			moving_to_mouse = false
	move_and_slide()
	##
	## INVENTORY
	##
	
	
