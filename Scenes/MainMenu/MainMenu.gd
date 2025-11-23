extends Control

@export_category("Buttons")
@export_category("Title")
@export var TitleLabel: Label
@export var SubtitleLable: Label
@export_category("Sounds")
@export var Song: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Transitions.LevelIn_Black()
	MusicEngine.PlayMusic(Song)

func GoToCharCustom():
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(1)

func _on_button_2_pressed() -> void:
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(2)
	pass # Replace with function body.
