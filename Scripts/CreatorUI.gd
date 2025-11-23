extends Control

@onready var mainScene = get_parent()

func _on_back_button_pressed() -> void:
	pass

func _on_add_image_buttom_pressed() -> void:
	var dialog = FileDialog.new()
	dialog.set_file_mode(FileDialog.FILE_MODE_OPEN_FILE)
	dialog.set_access(FileDialog.ACCESS_FILESYSTEM)
	dialog.filters = PackedStringArray(['*.png','*.jpg'])
	dialog.set_use_native_dialog(true)
	dialog.connect("file_selected", _on_file_dialog_file_selected)
	add_child(dialog)
	dialog.popup_centered_ratio()

func _on_file_dialog_file_selected(path: String) -> void:
	mainScene.newPlayer.playerImagePath = path
	PlayerConfig.roboxerController.loadRoboxers()

func _on_name_text_area_text_changed(new_text: String) -> void:
	mainScene.newPlayer.playerName = new_text
	PlayerConfig.roboxerController.loadRoboxers()


func _on_create_buttom_pressed() -> void:
	PlayerConfig.playerList.append(mainScene.newPlayer)
	SaveSystem.savePlayers()
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(2)
	pass # Replace with function body.
