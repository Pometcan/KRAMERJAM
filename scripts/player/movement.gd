extends CharacterBody2D

const SPEED := 100 * 500
var direction := Vector2(0.0,0.0)
var h_axis := 0.0
var v_axis := 0.0
var fliph := true
var mouse_pos := position
var moving_to_mouse := false
var friction := 0.05
var in_bounds := true
var is_ready_cooldown = true
@onready var player_sprite: AnimatedSprite2D = $playerSprite
@onready var transformationsound: AudioStreamPlayer2D = $Transformationsound
@onready var transformationfailsound: AudioStreamPlayer2D = $Transformationfailsound

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	if not moving_to_mouse:
		velocity = Vector2(0,0)
	if in_bounds:
		if Input.is_action_pressed("transform") and is_ready_cooldown:
			transformationsound.play()
			is_ready_cooldown = false
			$Cooldowntimer.start()
		if Input.is_action_pressed("transform"): 
			transformationfailsound.play()
			pass
		#mouse movement
		if Input.is_action_pressed("left_click"):
			mouse_pos = get_global_mouse_position()
			direction = (mouse_pos - position).normalized()
			velocity = direction * SPEED * _delta
			moving_to_mouse = true
		if moving_to_mouse:
			if (mouse_pos - position).length() < 0.8:
				velocity = Vector2(0,0)
				moving_to_mouse = false
			else:
				direction = (mouse_pos - position).normalized()
				velocity = direction * SPEED *_delta
		
		h_axis = Input.get_axis("ui_left", "ui_right")
		v_axis = Input.get_axis("ui_up", "ui_down")
		
		if (h_axis < 0 or velocity.x < 0):
			player_sprite.play("walk")
			fliph = false
		elif (h_axis > 0 or velocity.x > 0):
			player_sprite.play("walk")
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

func _on_cooldowntimer_timeout() -> void:
	is_ready_cooldown = true

	pass # Replace with function body.
