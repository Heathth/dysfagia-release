extends MeshInstance3D

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_O:
			if Input.is_action_pressed("e"):
				get_tree().change_scene_to_file("res://scenes/start/StartSC0.tscn")
