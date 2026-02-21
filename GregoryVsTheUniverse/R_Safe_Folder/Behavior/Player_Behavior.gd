extends Node2D

var parent: CharacterBody2D

func _ready() -> void:
	parent = get_parent()

func _physics_process(_delta: float) -> void:
	# Moving
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		parent.velocity = direction * parent.speed
	else:
		parent.velocity = Vector2(0,0)
	# Looking
	parent.look_at(get_global_mouse_position())
