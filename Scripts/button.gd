extends Button


func _on_button_up() -> void:
	$FileDialog.visible = true


func _on_file_dialog_file_selected(path: String) -> void:
	var image = Image.new()
	var err = image.load(path)
	if err != OK:
		print("File not loaded:",err)
	
	var texture = ImageTexture.create_from_image(image)
	PlayerConfig.playerList[0].playerImage = texture
	PlayerConfig.roboxerController.loadRoboxers()


func _on_line_edit_text_changed(new_text: String) -> void:
	PlayerConfig.playerList[0].playerName = new_text
	PlayerConfig.roboxerController.loadRoboxers()
	pass # Replace with function body.
