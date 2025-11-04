extends Node3D

var mat = StandardMaterial3D.new()
var atualCamera = 0
var all_cameras = null

func _ready() -> void:
	PlayerConfig.player_one_node = self
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$AnimationPlayer.play("Idle")
	
func changeImage(texture):
	mat.albedo_texture = texture
	$Armature/Skeleton3D/Plane_001.set_surface_override_material(0, mat)
	pass
	
func _process(delta: float) -> void:
	$Label3D.global_position.y = $Armature/Skeleton3D/BoneAttachment3D.global_position.y + 1

func _on_line_edit_text_changed(new_text: String) -> void:
	$Label3D.text = new_text
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	all_cameras = get_tree().get_nodes_in_group("camera")
	atualCamera += 1
	if atualCamera >= len(all_cameras): atualCamera = 0
	for i in range(len(all_cameras)):
		if i == atualCamera: 
			all_cameras[i].current = true
			continue
		all_cameras[i].current = false
		pass
	
	pass # Replace with function body.
