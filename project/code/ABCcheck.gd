extends Node3D

@export var number = 1
@export var namee = "tyhjä"
@onready var hovering = false

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

				Global.answerstate2[Global.selected] = Global.listnumber
				print(Global.answerstate2)
