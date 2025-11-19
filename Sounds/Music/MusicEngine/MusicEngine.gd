extends Node

@export_category("Stream Players")
@export var Intro: AudioStreamPlayer
@export var Loop: AudioStreamPlayer

func PlayMusic(NewMusic: AudioStream):
	if !Loop.is_playing():
		Loop.stream = NewMusic
		Loop.play()

func PlayMusicGradually(NewMusic: AudioStream):
	var v_tween = create_tween()
	v_tween.tween_property(Loop, "volume_linear", 0.0, 1.0)
	await v_tween.finished
	Loop.volume_linear = 1.0
	PlayMusic(NewMusic)
