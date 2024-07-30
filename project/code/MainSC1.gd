extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var done = true
	for n in Global.pages.size():
		if Global.pages[n] == 0:
			done = false
	if  done == true:
		$SCbutton.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
