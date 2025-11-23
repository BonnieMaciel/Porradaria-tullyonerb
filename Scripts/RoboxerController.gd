extends Node3D
class_name RoboxerController

@onready var allRoboxers = get_tree().get_nodes_in_group('Roboxer')
@onready var mainScene = get_parent()

func _ready() -> void:
	PlayerConfig.roboxerController = self
	loadRoboxers()
	
func loadRoboxers():
	allRoboxers[0].Player = mainScene.newPlayer
