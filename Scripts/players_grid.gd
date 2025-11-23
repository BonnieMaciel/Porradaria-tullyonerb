extends ItemList

func loadPlayerImage(path):
	var image = Image.new()
	var err = image.load(path)
	if err != OK:
		print("File not loaded:",err)
	var ScreenTexture = ImageTexture.create_from_image(image)
	
	return ScreenTexture

func _ready() -> void:
	for player in PlayerConfig.playerList:
		if player.playerImagePath == '': continue
		var playerTexture = loadPlayerImage(player.playerImagePath)
		add_item(player.playerName, playerTexture)
	pass
