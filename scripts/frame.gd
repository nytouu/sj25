class_name Frame

extends Node3D

@onready var mesh_painting: MeshInstance3D = $FrameMesh/Texture
@onready var mesh_frame: MeshInstance3D = $FrameMesh/pCube1

const MAT_FRAME_HIGHLIGHT = preload("res://resources/materials/mat_frame_highlight.tres")

func set_highlight(highlight: bool):
	var mat_painting = mesh_painting.get_active_material(0)
	
	if highlight:
		mat_painting.next_pass = MAT_FRAME_HIGHLIGHT
		mesh_frame.material_override = StandardMaterial3D.new()
		mesh_frame.material_override.albedo_color = Color(1.0, 1.0, 1.0)
	else:
		mat_painting.next_pass = null
		mesh_frame.material_override = null
