extends CanvasLayer

@onready var AnimPlayer: AnimationPlayer = $AnimationPlayer

signal TransitionInFinished
signal TransitionOutFinished

func _ready() -> void:
	LevelIn_Black()

func LevelIn_Black():
	AnimPlayer.play("Transitions/TransitionAnimation")
	await AnimPlayer.animation_finished
	TransitionInFinished.emit()

func LevelOut_Black():
	AnimPlayer.play("Transitions/TransitionAnimationBack")
	await AnimPlayer.animation_finished
	TransitionOutFinished.emit()
