extends Node2D

var parent: CharacterBody2D
@export var max_melee_cooldown: float = 1
var melee_cooldown: float

func _ready() -> void:
	parent = get_parent()
	melee_cooldown = max_melee_cooldown

func _process(delta: float) -> void:
	melee_cooldown -= delta
	if (parent.global_position - Globals.playerPosition).length_squared() < 250000:
		parent.look_at(Globals.playerPosition)
		parent.velocity = Vector2(parent.speed, 0).rotated(parent.rotation)
	if (parent.global_position - Globals.playerPosition).length_squared() < 25000:
		if melee_cooldown < 0:
			parent.attack()
			melee_cooldown = max_melee_cooldown
		parent.velocity = Vector2(0,0)
