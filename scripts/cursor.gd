extends Node3D

@onready var camera: Camera3D = %Camera
@onready var mesh: Node3D = $CursorArrow
@onready var ray_cast: RayCast3D = $CursorArrow/RayCast3D

@export var ray_length: float = 2000.0

var _last_position: Vector3
var _last_selected_frame: Frame

enum RAY_RESULT { POSITION, ROTATION }

func _screen_to_point() -> Array:
	var mouse_pos = get_viewport().get_mouse_position()
	var space_state = get_world_3d().direct_space_state

	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_pos) * ray_length

	var intersected = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(ray_origin, ray_end))	
	if intersected.has("position"):
		return [intersected["position"], intersected["normal"]]
	return [Vector3(), Vector3()]

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta: float) -> void:
	var raycast = _screen_to_point()

	if raycast[RAY_RESULT.POSITION] != Vector3.ZERO:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

		_last_position = mesh.position
		mesh.position = raycast[RAY_RESULT.POSITION]
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	match raycast[RAY_RESULT.ROTATION]:
		Vector3(0, 1, 0):
			mesh.rotation = Vector3.ZERO
		Vector3(0, 0, -1):
			mesh.rotation = Vector3(-PI / 2, 0, 0)
		Vector3(1, 0, 0):
			mesh.rotation = Vector3(0, 0, -PI / 2)
			
func _physics_process(_delta: float) -> void:
	var obj: StaticBody3D
	
	if ray_cast.is_colliding():
		obj = ray_cast.get_collider()
		if obj is StaticBody3D:
			_last_selected_frame = obj.get_parent() as Frame
			_last_selected_frame.set_highlight(true)
	else:
		if _last_selected_frame: _last_selected_frame.set_highlight(false)

	if Input.is_action_just_pressed("frame_select") && obj:
		pass
