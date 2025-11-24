extends Node3D

@export var roboxer_1: Roboxer
@export var roboxer_2: Roboxer

@export var Song: AudioStream

func _ready() -> void:
	Transitions.LevelIn_Black()
	MusicEngine.PlayMusic(Song)
	print(Players.player1)
	print(Players.player2)
	roboxer_1.Player = Players.player1
	roboxer_2.Player = Players.player2
