extends Node3D
class_name Model

var screenMaterial = StandardMaterial3D.new()
@onready var AP: AnimationPlayer = $AnimationPlayer
@onready var bodyTracker = $Armature/Skeleton3D/BoneAttachment3D

@export var NameTrack: Node3D
@export var NameTrackOffset: float

var animationList = ['Idle', 'walk', 'Punch_R']

@export var modelImage: ImageTexture:
	set(path): changeModelImage(path)
		
func changeModelImage(image: ImageTexture):
	screenMaterial.albedo_texture = image
	$Armature/Skeleton3D/Plane_001.set_surface_override_material(0, screenMaterial)
	
func _init() -> void:
	screenMaterial.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	screenMaterial.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	
func _process(delta: float) -> void:
	NameTrack.global_position = bodyTracker.global_position
	NameTrack.global_position.y += NameTrackOffset

func _ready() -> void:
	AP.play(animationList[0])
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var n_anim_index = randi_range(0,len(animationList) - 1)
	AP.play(animationList[n_anim_index])
