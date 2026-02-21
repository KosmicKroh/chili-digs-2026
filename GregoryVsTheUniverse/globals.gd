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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rollCooldown > 0:
		rollCooldown -= delta
