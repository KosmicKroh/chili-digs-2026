extends CharacterBody2D

@export var speed = 200
@export var weapon: Node2D

func _ready() -> void:
	var random = randi() % 5
	$Sprite2D.texture = Globals.meleeEnemyTextures[random]

func _process(_delta: float) -> void:
	move_and_slide()

func attack():
	weapon.fire(false)
