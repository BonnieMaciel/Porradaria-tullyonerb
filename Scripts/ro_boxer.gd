extends CharacterBody3D
class_name Roboxer

@export var Player: Player:
	set(player): changePlayer(player)
	
@onready var nameTag = $PlayerName
	
@onready var boxerModel: Model = $Model

func changePlayer(player: Player):
	boxerModel.modelImage = player.playerImage
	nameTag.text = player.playerName
	pass
