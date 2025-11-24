extends Control

@export var Song: AudioStream

var playerSelected: int = 1
var player1: Player: set = changePlayer1
var player2: Player: set = changePlayer2

func _ready() -> void:
	Transitions.LevelIn_Black()
	MusicEngine.PlayMusic(Song)
	
func loadImage(path):
	var image = Image.new()
	var err = image.load(path)
	if err != OK:
		print("File not loaded:",err)
	var ScreenTexture = ImageTexture.create_from_image(image)
	return ScreenTexture
	
func changePlayer1(player: Player):
	$TextureRect.texture = loadImage(player.playerImagePath)
	$Label2.text = player.playerName
	player1 = player
	
func changePlayer2(player: Player):
	$TextureRect2.texture = loadImage(player.playerImagePath)
	$Label3.text = player.playerName
	player2 = player
	
func _on_button_pressed() -> void:
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(0)

func _on_button_2_pressed() -> void:
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(1)


func _on_player_1_selection_pressed() -> void:
	print('player 1 selected')
	playerSelected = 1
	pass # Replace with function body.


func _on_player_2_selection_pressed() -> void:
	print('player 2 selected')
	playerSelected = 2
	pass # Replace with function body.

func _on_item_list_item_selected(index: int) -> void:
	print(PlayerConfig.playerList[index])
	if playerSelected == 1:
		player1 = PlayerConfig.playerList[index]
	if playerSelected == 2:
		player2 = PlayerConfig.playerList[index]
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	print(player1)
	print(player2)
	Players.player1 = player1
	Players.player2 = player2
	Transitions.LevelOut_Black()
	await Transitions.TransitionOutFinished
	SceneManager.ChangeToScene(3)
	pass # Replace with function body.
