extends Node2D

# Used as a child of an object
# Fires relative to where it is

@onready var onPlayer: bool = "player" in get_parent()
@onready var bulletspawn: Vector2 = $Sprite2D.position
@onready var parent: CharacterBody2D = get_parent()

func fire(Player_Bullet: bool) -> void:
	var bullet_position = parent.position + bulletspawn.rotated(parent.rotation) * 2
	parent.get_parent().add_child(Bullet.newBullet(Player_Bullet, bullet_position, parent.rotation))

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if onPlayer:
			fire(true)
