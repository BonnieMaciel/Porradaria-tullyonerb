extends Node3D

@export var Song: AudioStream

@export var SpringArm: SpringArm3D

func  _ready() -> void:
	var callable = Callable(self, "choosePlayer")
	PlayerConfig.roboxerController.conditionFunction = callable
	
	Transitions.LevelIn_Black()
	MusicEngine.PlayMusic(Song)

func GoToMenu():
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenu.tscn")


func _process(delta: float) -> void:
	SpringArm.rotation.y += 0.5 * delta
	
	if Input.is_action_just_pressed("Escape"):
		GoToMenu()
