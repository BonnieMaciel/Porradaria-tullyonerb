extends Control

@export_category("Buttons")
@export var CharacterCustomizationButton: Button
@export_category("Title")
@export var TitleLabel: Label
@export var SubtitleLable: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Transitions.LevelIn_Black()
	CharacterCustomizationButton.button_up.connect(GoToCharCustom)

func GoToCharCustom():
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	get_tree().change_scene_to_file("res://Main.tscn")
