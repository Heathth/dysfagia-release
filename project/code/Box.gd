extends Node

func box(pos1:Vector2, pos2:Vector2, width:float) -> MeshInstance3D:
	
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

	get_tree().get_root().add_child(mesh_instance)

	return mesh_instance
