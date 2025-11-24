extends Node3D

@export_category("Objects")
@export var SpringArm: SpringArm3D

@export_category("UI")
@export var ReturnToMenuButton: Button

@export_category("Sounds")
@export_group("Music")
@export var Song: AudioStream

@export var newPlayer = Player.new()

func  _ready() -> void:
	Transitions.LevelIn_Black()
	MusicEngine.PlayMusic(Song)
	
	ReturnToMenuButton.button_up.connect(GoToMenu)

func GoToMenu():
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(2)

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("Escape"):
		GoToMenu()

func RotateCamera():
	var delta = get_process_delta_time()
	SpringArm.rotation.y += 0.5 * delta
