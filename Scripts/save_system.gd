extends Node

func _ready() -> void:
	loadPlayers()
	
func savePlayers():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	for player in PlayerConfig.playerList:	
		var playerInfo = player.playerName.uri_encode() + ' ' + player.playerImagePath.uri_encode()
		save_file.store_line(playerInfo)

func loadPlayers():
	if not FileAccess.file_exists("user://savegame.save"):
		return 
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		json_string = json_string.split(' ')
		for i in len(json_string):
			json_string[i] = json_string[i].uri_decode()
		var player = Player.new()
		player.playerName = json_string[0]
		player.playerImagePath = json_string[1]
		PlayerConfig.playerList.append(player)
