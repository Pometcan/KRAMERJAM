extends CharacterBody2D

const SPEED = 75
var direction = Vector2(0.0,0.0)
var mouse_pos = position
var moving_to_mouse = false
var friction = 0.05
var in_bounds = true

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
	if not moving_to_mouse:
		velocity = Vector2(0,0)
	if in_bounds:
		#mouse movement
		if Input.is_action_pressed("left_click"):
			mouse_pos = get_global_mouse_position()
			direction = (mouse_pos - position).normalized()
			velocity = direction * SPEED
			moving_to_mouse = true
		if moving_to_mouse:
			if (mouse_pos - position).length() < 0.8:
				velocity = Vector2(0,0)
				moving_to_mouse = false
			else:
				direction = (mouse_pos - position).normalized()
				velocity = direction * SPEED
		#key based movement
		if Input.is_action_pressed("ui_right"):
			direction.x = 1.0
			velocity = direction * SPEED
			moving_to_mouse = false
		elif Input.is_action_pressed("ui_left"):
			direction.x = -1.0
			velocity = direction * SPEED
			moving_to_mouse = false
		else:
			direction.x = 0
		if Input.is_action_pressed("ui_down"):
			direction.y = 1.0
			velocity = direction * SPEED
			moving_to_mouse = false
		elif Input.is_action_pressed("ui_up"):
			direction.y = -1.0
			velocity = direction * SPEED
			moving_to_mouse = false
		else:
			direction.y = 0
		
	move_and_slide()
