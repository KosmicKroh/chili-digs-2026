extends Node

var enemyGoal:int = 10
var killCount:int = 0
var bulletDamage:float = 1.0
var rollCooldown:float = 0.0
var stage:int = -1
var playerHealth:float = 100.0
var musicVolume:float = 70.0
var sfxVolume:float = 70.0
var playerPosition: Vector2
var rangedEnemyTextures: Array = [preload("res://enemySprites/Character-worker1.webp"),
								preload("res://enemySprites/Character-worker2.webp"),
								preload("res://enemySprites/Character-worker3.webp"),
								preload("res://enemySprites/Character-worker4.webp"),
								preload("res://enemySprites/Character-worker5.webp")
								]
var meleeEnemyTextures: Array = [preload("res://enemySprites/Character-worker6.webp"),
								preload("res://enemySprites/Character-worker7.webp"),
								preload("res://enemySprites/Character-worker8.webp"),
								preload("res://enemySprites/Character-worker9.webp"),
								preload("res://enemySprites/Character-worker10.webp")
								]
var rollSprites: Array 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rollCooldown > 0:
		rollCooldown -= delta
