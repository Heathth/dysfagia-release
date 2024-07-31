extends Node3D


# Called when the node enters the scene tree for the first time.
#func _ready():
	#var done = true
	#for n in Global.pages.size():
		#if Global.pages[n] == 0:
			#done = false
	#if  done == true:
		#$SCbutton.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_O:
			if Input.is_action_pressed("u"):
				for n in Global.progres_list.size():
					Global.progres_list.fill(2)
				get_tree().change_scene_to_file("res://scenes/endtest/q.1.anatomy.tscn")
