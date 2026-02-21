extends Node2D


@onready var onPlayer: bool = "player" in get_parent()
@onready var bulletspawn: Vector2 = $Sprite2D.position
@onready var parent: CharacterBody2D = get_parent()
var pen_bullet_texture = preload("res://Item-Pen.png")

func fire(Player_Bullet: bool) -> void:
	var bullet_position = parent.position + bulletspawn.rotated(parent.rotation) * 4
	var bullet = Bullet.newBullet(Player_Bullet, bullet_position, parent.rotation)
	bullet.texture = pen_bullet_texture
	parent.get_parent().add_child(bullet)

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if onPlayer:
			fire(true)
