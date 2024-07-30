extends Node3D

@export var number = 1
@export var namee = "tyhjä"
@onready var hovering = false

@export var qnum := 0

func _ready():
	$Label3D4.text = namee

func _on_area_3d_mouse_entered():
	#print(index)
	Global.listnumber = number
	hovering = true
	$quizimput/Highlish.visible = true

func _on_area_3d_mouse_exited():
	##print(index)
	hovering = false
	$quizimput/Highlish.visible = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true: 
			if hovering == true:
				if Global.listnumber == number:
					for n in Global.m_answerstate[qnum].size():
						if  Global.m_answerstate[qnum][n] == Global.listnumber:
							Global.m_answerstate[qnum][n] = 0

				Global.m_answerstate[qnum][Global.selected] = Global.listnumber

		var ok = false
		for n in Global.m_answerstate[qnum].size():
			if  Global.m_answerstate[qnum][n] == number:
				$quizimput/Used.show()
				ok = true
		if ok == false:
				$quizimput/Used.hide()
