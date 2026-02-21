extends Node2D


@onready var onPlayer: bool = "player" in get_parent()
@onready var bulletspawn: Vector2 = $Sprite2D.position
@onready var parent: CharacterBody2D = get_parent()

func fire() -> void:
	var bullet_position = parent.position + bulletspawn.rotated(parent.rotation) * 2
	var bullet = Bullet.newBullet(bullet_position, parent.rotation)
	parent.get_parent().add_child(bullet)

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if onPlayer:
			fire()
