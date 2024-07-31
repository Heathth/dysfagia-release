extends MeshInstance3D

@export var path := "path"
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
				if !%Cam == null:
					Global.mainzoom = %Cam.get_child(0).position.z
					Global.campp = Vector2(%Cam.position.x, %Cam.position.y)
					Global.progres_list[secnum] = 2
					if Global.progres_list[secnum+1] == 0:
						Global.progres_list[secnum+1] = 1
					print(Global.progres_list)
				get_tree().change_scene_to_file(path)


func _process(delta):
	if rotation.z > 0:
		rotation *= rotreturn
