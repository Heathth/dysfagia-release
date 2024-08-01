extends Node3D

@export var index = 0
@export var qnum := 0

var hovering = false
var hoverindex = 0

func _ready():
	$Label3D4.text = Global.m_answerlist[qnum][index]
	$quizimput/Selected.hide()

func _on_area_3d_mouse_entered():
	hoverindex = index
	hovering = true
	Global.hovering = true
	#print(index)
	$quizimput/Highlish.visible = true
	Global.listindex = index

func _on_area_3d_mouse_exited():
	hoverindex = 0
	hovering = false
	Global.hovering = false
	#print(index)
	$quizimput/Highlish.visible = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true: 

			if hoverindex == index:
				if Global.m_answerstate[qnum][index] == 0:
					Global.m_answerstate[qnum][index] = 1
					$quizimput/Selected.show()
				elif Global.m_answerstate[qnum][index] == 1:
					Global.m_answerstate[qnum][index] = 0
					$quizimput/Selected.hide()

				print(Global.m_answerstate[qnum])
