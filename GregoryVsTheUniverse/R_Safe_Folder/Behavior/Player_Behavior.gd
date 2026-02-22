extends Node2D

var parent: CharacterBody2D
var max_dash_cooldown: float = 0.5
var dash_duration: float = 0.03
var dash_cooldown: float = 0
var dash_velocity: Vector2 
var dash_strength: int = 4

func _ready() -> void:
	parent = get_parent()

func _physics_process(delta: float) -> void:
	# Moving
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		parent.velocity = direction * parent.speed + dash_velocity
	else:
		parent.velocity = dash_velocity
	# Looking
	parent.look_at(get_global_mouse_position())
	# Dashing
	if dash_cooldown < max_dash_cooldown - dash_duration:
		dash_velocity = Vector2(0,0)
	dash_cooldown -= delta
	if Input.is_action_just_pressed("dash"):
		if direction == Vector2(0,0):
			return
		if dash_cooldown <= 0:
			dash_velocity = direction * 400 * dash_strength
			dash_cooldown = max_dash_cooldown
			if "player" in parent:
				parent.roll()
