extends CharacterBody3D
class_name Roboxer

@export var Player: Player:
	set(player): changePlayer(player)
	
@onready var nameTag = $PlayerName
@onready var boxerModel: Model = $Model

func loadImage(path):
	var image = Image.new()
	var err = image.load(path)
	if err != OK:
		print("File not loaded:",err)
	var ScreenTexture = ImageTexture.create_from_image(image)
	boxerModel.modelImage = ScreenTexture
	return image

func changePlayer(player: Player):
	if player.playerImagePath != '': loadImage(player.playerImagePath)
	nameTag.text = player.playerName
	pass
