extends Node2D

# Used as a child of an object
# Fires relative to where it is

func fire() -> void:
	var bullet_position = get_parent().position + position.rotated(get_parent().rotation) * 2
	get_parent().get_parent().add_child(Bullet.newBullet(bullet_position, get_parent().rotation))

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		fire()
