extends Node2D

var parent: CharacterBody2D
@export var max_ranged_cooldown: float = 1
var ranged_cooldown: float

func _ready() -> void:
	parent = get_parent()
	ranged_cooldown = max_ranged_cooldown

func _process(delta: float) -> void:
	ranged_cooldown -= delta
	if (parent.global_position - Globals.playerPosition).length_squared() < 250000:
		parent.look_at(Globals.playerPosition)
		parent.velocity = Vector2(0,0)
		if ranged_cooldown < 0:
			ranged_cooldown = max_ranged_cooldown
			parent.attack()
	if (parent.global_position - Globals.playerPosition).length_squared() < 50000:
		parent.velocity = -Vector2(parent.speed, 0).rotated(parent.rotation)
