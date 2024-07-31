extends MeshInstance3D

@export var path1 := "path1"
@export var path2 := "path2"
@export var path3 := "path3"
@export var path4 := "path4"

@export var path5 := "path5"
@export var path6 := "path6"
@export var path7 := "path7"
@export var path8 := "path8"

@export var path9 := "path9"
@export var path10 := "path10"
@export var path11 := "path11"
@export var path12 := "path12"

@export var path13 := "path13"


@export var secnum := 99

@onready var origscale:Vector3 = Vector3(scale)
@onready var origrot:Vector3 = Vector3(rotation)
@onready var origpos:Vector3 = Vector3(position)


var pressable:bool = false

var statekeep = 0
var scaler = 1.1
var rotamount = 0.02
var rotreturn = 0.9

func _ready():
	if Global.progres_list[secnum] == 2:
		$A.position =  Vector3(0,-8,0)
		$B.position =  Vector3(0,-10,0)
		$C.position =  Vector3(0,0,0)
		pressable = true

	elif Global.progres_list[secnum] == 1:
		$A.position = Vector3(0,0,0)
		$B.position =  Vector3(0,-10,0)
		$C.position =  Vector3(0,-8,0)
		pressable = true
#
	elif Global.progres_list[secnum] == 0:
		$A.position = Vector3(0,-10,0)
		$B.position =  Vector3(0,0,0)
		$C.position =  Vector3(0,-8,0)
		pressable = false

func _on_area_3d_mouse_entered():
	if pressable == true:
		scale = origscale * scaler
		rotation = Vector3(-rotamount/2, 0, rotamount)
		position.y =  origpos.y + 0.2

func _on_area_3d_mouse_exited():
	scale = origscale
	position.y = origpos.y

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if pressable == true:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:

				print(Global.q_1)
				if Global.m_q[12] == true:
					get_tree().change_scene_to_file(path13)
				elif Global.m_q[11] == true:
					get_tree().change_scene_to_file(path12)
				elif Global.m_q[10] == true:
					get_tree().change_scene_to_file(path11)
				elif Global.m_q[9] == true:
					get_tree().change_scene_to_file(path10)

				elif Global.m_q[8] == true:
					get_tree().change_scene_to_file(path9)
				elif Global.m_q[7] == true:
					get_tree().change_scene_to_file(path8)
				elif Global.m_q[6] == true:
					get_tree().change_scene_to_file(path7)
				elif Global.m_q[5] == true:
					get_tree().change_scene_to_file(path6)

				elif Global.m_q[4] == true:
					get_tree().change_scene_to_file(path5)
				elif Global.m_q[3] == true:
					get_tree().change_scene_to_file(path4)
				elif Global.m_q[2] == true:
					get_tree().change_scene_to_file(path3)
				elif Global.m_q[1] == true:
					print("yeah")
					get_tree().change_scene_to_file(path2)
				else:
					get_tree().change_scene_to_file(path1)



func _process(delta):
	if rotation.z > 0:
		rotation *= rotreturn
