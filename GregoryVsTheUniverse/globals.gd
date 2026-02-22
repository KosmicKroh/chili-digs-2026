extends Node

var enemyGoal:int = 10
var killCount:int = 0
var bulletDamage:float = 1.0
var rollCooldown:float = 0.0
var stage:int = -1
var playerHealth:float = 100.0
var musicVolume:float = 70.0
var sfxVolume:float = 70.0
var screenShake:float = 70.0
var playerPosition: Vector2
var shakeEffect:float = 0.0
var hardMode:bool = false
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

func load_data():
	var config = ConfigFile.new()
	var err = config.load("user://gvtu-config.cfg")
	if err != OK:
		return
	musicVolume = config.get_value("Settings","Music-Volume",70.0)
	sfxVolume = config.get_value("Settings","SFX-Volume",70.0)
	screenShake = config.get_value("Settings","Screen-Shake",70.0)

func save_data():
	var config = ConfigFile.new()
	config.set_value("Settings","Music-Volume",musicVolume)
	config.set_value("Settings","SFX-Volume",sfxVolume)
	config.set_value("Settings","Screen-Shake",screenShake)
	config.save("user://gvtu-config.cfg")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rollCooldown > 0:
		rollCooldown -= delta
	if shakeEffect > 0:
		shakeEffect -= 3*delta
