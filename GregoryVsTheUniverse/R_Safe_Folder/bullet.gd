class_name Bullet extends Sprite2D

@export var lifeTime: float
@export var speed: int
const BULLET_SCENE: PackedScene = preload("res://R_Safe_Folder/Bullet.tscn")

static func newBullet(Position: Vector2, Rotation: float = 0, LifeTime: float = 10, Speed: int = 100) -> Sprite2D:
	var newbullet = BULLET_SCENE.instantiate()
	newbullet.position = Position
	newbullet.rotation = Rotation
	newbullet.lifeTime = LifeTime
	newbullet.speed = Speed
	return newbullet

func _process(delta: float) -> void:
	lifeTime -= delta
	if lifeTime < 0:
		queue_free()
	# Move
	position += Vector2(speed, 0).rotated(rotation) * delta
