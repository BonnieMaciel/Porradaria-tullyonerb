extends Button


func _on_button_up() -> void:
	$FileDialog.visible = true


func _on_file_dialog_file_selected(path: String) -> void:
	var image = Image.new()
	var err = image.load(path)
	if err != OK:
		print("File not loaded:",err)
	
	var texture = ImageTexture.create_from_image(image)
	PlayerConfig.player_one_texture = texture
