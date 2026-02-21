extends Node2D

signal next_stage
var elevator = load("res://J_Safe_Folder/room_elevator.tscn")
var room_layouts = [
	load("res://J_Safe_Folder/room_bullpin.tscn"),
	load("res://J_Safe_Folder/room_conference.tscn"),
	load("res://J_Safe_Folder/room_hallway.tscn"),
	load("res://J_Safe_Folder/room_waiting.tscn"),
	load("res://J_Safe_Folder/room_office.tscn")
]
var enemies = [
	preload("res://R_Safe_Folder/Enemy_Melee.tscn"),
	preload("res://R_Safe_Folder/Enemy_Ranged.tscn")
]

@export var roomCount:int = 30
@export var enemyCount:int = 10
var availableExits = []
var newExitIndex:int = 0
var enemySpawns = []
var readyToGenerate:bool = false
var firstPass:bool = false
var latestRoom:Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawnRoom = elevator.instantiate()
	add_child(spawnRoom)
	for exit in spawnRoom.find_child("Exits").get_children():
		availableExits.append(exit)
	roomCount -= 1

func generate():
	readyToGenerate = true

func spawn_enemies():
	enemySpawns.shuffle()
	for e in min(len(enemySpawns),enemyCount):
		var newEnemy = enemies.pick_random().instantiate()
		add_child(newEnemy)
		newEnemy.global_transform = enemySpawns[e].global_transform

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
				if roomCount == 0:
					spawn_enemies()
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
			
		


func _on_elevator_area_body_entered(body):
	if "player" in body and Globals.killCount >= Globals.enemyGoal:
		next_stage.emit()
