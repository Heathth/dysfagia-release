extends Node3D

@export var index = 0
@export var qnum := 0

var hovering = false

func _ready():
	$Label3D4.hide()

func _on_area_3d_mouse_entered():
	hovering = true
	Global.hovering = true
	#print(index)
	$quizimput/Highlish.visible = true
	Global.listindex = index

func _on_area_3d_mouse_exited():
	hovering = false
	Global.hovering = false
	#print(index)
	$quizimput/Highlish.visible = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true: 
			if Global.hovering == false:
				$"../../Numberer".visible = false
				Global.selected = 0
			elif Global.listindex == index:
				Global.selected = index
				#print(Global.listindex)
				$"../../Numberer".position.x = global_transform.origin.x
				$"../../Numberer".position.y = global_transform.origin.y
				$"../../Numberer".visible = true

		if Global.m_answerstate[qnum][index] > 0:
			#print(Global.answerstate[index])
			$Label3D4.text = Global.m_answerlist[qnum][Global.m_answerstate[qnum][index]]
			$Label3D4.show()
		elif Global.m_answerstate[qnum][index] == 0:
			$Label3D4.hide()

