class_name Bullet extends Sprite2D

@export var lifeTime: float
@export var speed: int
@export var Damage: int
const BULLET_SCENE: PackedScene = preload("res://R_Safe_Folder/Bullet.tscn")
const ENEMY_BULLET_SCENE: PackedScene = preload("res://R_Safe_Folder/Enemy_Bullet.tscn")

static func newBullet(Player_Bullet: bool, Position: Vector2, Rotation: float = 0, Bullet_Damage: int = 1, LifeTime: float = 10, Speed: int = 900) -> Sprite2D:
	var newbullet
	if Player_Bullet:
		newbullet = BULLET_SCENE.instantiate()
	else:
		newbullet = ENEMY_BULLET_SCENE.instantiate()
	newbullet.position = Position
	newbullet.rotation = Rotation
	newbullet.lifeTime = LifeTime
	newbullet.speed = Speed
	newbullet.Damage = Bullet_Damage
	return newbullet

func _ready() -> void:
	get_node("HitBox").damage = Damage

func _process(delta: float) -> void:
	lifeTime -= delta
	if lifeTime < 0:
		queue_free()
	# Move
	position += Vector2(speed, 0).rotated(rotation) * delta
