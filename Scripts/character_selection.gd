extends Control

func _ready() -> void:
	Transitions.LevelIn_Black()
	

func _on_button_pressed() -> void:
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(0)


func _on_button_2_pressed() -> void:
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(1)
