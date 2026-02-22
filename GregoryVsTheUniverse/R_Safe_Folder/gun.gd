extends Node2D

# Used as a child of an object
# Fires relative to where it is

@onready var onPlayer: bool = "player" in get_parent()
@onready var bulletspawn: Vector2 = $Sprite2D.position
@onready var parent: CharacterBody2D = get_parent()
var gun_bullet_texture = preload("res://Item-Staple.png")

func fire(Player_Bullet: bool) -> void:
	var bullet_position = parent.position + bulletspawn.rotated(parent.rotation) * 1.1
	var new_bullet = Bullet.newBullet(Player_Bullet, bullet_position, parent.rotation)
	new_bullet.texture = gun_bullet_texture
	parent.get_parent().add_child(new_bullet)
	$StapleSound.pitch_scale = randf_range(0.8,1.2)
	$StapleSound.play()

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if onPlayer:
			fire(true)
