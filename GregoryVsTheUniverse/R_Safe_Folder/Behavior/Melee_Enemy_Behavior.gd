extends Node2D

var parent: CharacterBody2D

func _ready() -> void:
	parent = get_parent()

func _process(delta: float) -> void:
	parent.look_at(Globals.playerPosition)
	parent.velocity = Vector2(parent.speed, 0).rotated(rotation) * delta
