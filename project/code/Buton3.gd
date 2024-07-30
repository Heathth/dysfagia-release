extends Node3D

var outline := false
@export var path1 := "path"
@export var path2 := "path"
@export var path3 := "path"

func _on_area_3d_mouse_entered():

	var scal = $BBack.scale
	print(scal)

	var pos1 = Vector2((1 * scal.x) +.1, (1 * scal.y) +.1)
	var pos2 = Vector2(-(1 * scal.x) -.1, -(1 * scal.y) -.1)
	var wid = 0.2

	_box(pos1, pos2, wid)
	outline = true


func _on_area_3d_mouse_exited():
	if outline == true:
		outline = false
		if !$ButtonText.get_child(0) == null:
			$ButtonText.get_child(0).queue_free()

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			OS.shell_open("https://forms.gle/jHfi7CDb4fhzXy2K7")


func _box(pos1:Vector2, pos2:Vector2, width:float) -> MeshInstance3D:
	
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	var thick = width
	var subpos1 = 1
	var subpos2 = 1
	
	var point1x = pos1.x
	var point1y = pos1.y
	
	var point2x = pos2.x
	var point2y = pos2.y

	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLES, material)

	immediate_mesh.surface_add_vertex(Vector3(point1x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point2y + thick), 0))
	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point1y - thick), 0))

	immediate_mesh.surface_add_vertex(Vector3(point1x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point1x, point2y, 0))
	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point2y + thick), 0))

	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point2y + thick), 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x, point2y, 0))
	immediate_mesh.surface_add_vertex(Vector3((point2x + thick), (point2y + thick), 0))

	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point2y + thick), 0))
	immediate_mesh.surface_add_vertex(Vector3(point1x, point2y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x, point2y, 0))

	immediate_mesh.surface_add_vertex(Vector3(point2x, point2y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x + thick, point1y - thick, 0))

	immediate_mesh.surface_add_vertex(Vector3(point2x, point2y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x + thick, point1y - thick, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x + thick, point2y + thick, 0))

	immediate_mesh.surface_add_vertex(Vector3(point2x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point1x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x + thick, point1y - thick, 0))

	immediate_mesh.surface_add_vertex(Vector3(point1x, point1y, 0))
	immediate_mesh.surface_add_vertex(Vector3((point1x - thick), (point1y - thick), 0))
	immediate_mesh.surface_add_vertex(Vector3(point2x + thick, point1y - thick, 0))

	immediate_mesh.surface_end()

	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.WHITE

	$ButtonText.add_child(mesh_instance)

	return mesh_instance
