extends Node3D

func  _ready() -> void:
	var callable = Callable(self, "choosePlayer")
	PlayerConfig.roboxerController.conditionFunction = callable
	
func choosePlayer(allRoboxers: Array[Roboxer]):
	
	pass
