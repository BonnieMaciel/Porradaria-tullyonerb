extends Node

const numberOfPlayers = 2
var playerList: Array[Player]

var roboxerController: RoboxerController

func _ready() -> void:
	for playerNumber in range(numberOfPlayers):
		var player = Player.new()
		playerList.append(player)
