extends ColorRect

func playTransition():
	var screenSize = DisplayServer.screen_get_size()
	position = Vector2(0,0)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(screenSize.x,0), 0.6).set_trans(Tween.TRANS_SINE)

func playTransitionBackward():
	var screenSize = DisplayServer.screen_get_size()
	position = Vector2(screenSize.x,0)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(0,0), 0.6).set_trans(Tween.TRANS_SINE)
