extends Node

@export var SceneEntries: Array[SceneEntry]

func ChangeToScene(ID: int):
	var NewScene: String
	for Scenes in SceneEntries:
		if Scenes.ID == ID:
			NewScene = Scenes.ScenePath
			get_tree().change_scene_to_file(NewScene)
			return
	print("Erro! Nenhuma cena detectada. Por favor confira a biblioteca de níveis no SceneManager.")
