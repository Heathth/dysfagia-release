extends MeshInstance3D

func _ready():
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainSC1.tscn")

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_O:
			if Input.is_action_pressed("e"):
				get_tree().change_scene_to_file("res://scenes/start/StartSC0.tscn")
