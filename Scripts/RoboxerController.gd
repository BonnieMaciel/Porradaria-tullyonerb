extends Node3D
class_name RoboxerController

@onready var allRoboxers = get_tree().get_nodes_in_group('Roboxer')
@export var conditionFunction: Callable

func _ready() -> void:
	PlayerConfig.roboxerController = self
	loadRoboxers()
	
func loadRoboxers():
	allRoboxers[0].Player = PlayerConfig.playerList[0]
