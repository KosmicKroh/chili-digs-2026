extends Node2D

var room_layouts = [
	load("res://J_Safe_Folder/room_bullpin.tscn")
]

@export var roomCount:int = 10
@export var enemyCount:int = 10
var availableExits = []
var newExitIndex:int = 0
var enemySpawns = []
var readyToGenerate:bool = false
var firstPass:bool = false
var latestRoom:Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawnRoom = room_layouts[0].instantiate()
	add_child(spawnRoom)
	for exit in spawnRoom.find_child("Exits").get_children():
		availableExits.append(exit)
	roomCount -= 1
	generate()

func generate():
	readyToGenerate = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if readyToGenerate:
		if roomCount > 0 and firstPass:
			if latestRoom.find_child("Overlap").has_overlapping_areas():
				latestRoom.queue_free()
			else:
				availableExits[newExitIndex].get_child(0).queue_free()
				availableExits.remove_at(newExitIndex)
				for exit in latestRoom.find_child("Exits").get_children():
					availableExits.append(exit)
				for spawn in latestRoom.find_child("Spawns").get_children():
					enemySpawns.append(spawn)
				roomCount -= 1
		if roomCount > 0:
			firstPass = true
			var newRoom = room_layouts.pick_random().instantiate()
			var newEntrance = newRoom.find_child("Exits").get_children().pick_random()
			newExitIndex = randi_range(0,len(availableExits)-1)
			var newExit = availableExits[newExitIndex]
			add_child(newRoom)
			newEntrance.get_child(0).queue_free()
			newRoom.global_transform = newExit.global_transform
			newRoom.rotation += PI - newEntrance.rotation
			newRoom.global_position += newExit.global_position - newEntrance.global_position
			latestRoom = newRoom
			
		
