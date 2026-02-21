extends CharacterBody2D

@export var speed = 200
@export var weapon: Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	move_and_slide()

func attack():
	weapon.fire(false)
