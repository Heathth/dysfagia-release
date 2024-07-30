extends Node3D

var zoomcof := 0.3
var coef = 0.0015
@onready var camera := $Camera3D

var move_speed = .8
var move_accel = .5
var move_keeper := Vector2(0.0, 0.0)
var movedamp := 0.87

@export var zoom_max := 50.0
@export var zoom_min := 3.0
var zoom := 0.0

@export var startzoom := 1.0
@export var startzoommod := 0.0

var zoom_keeper := 0.0
var zoom_speed := 0.7
@export var zoom_accel := 0.75
var zoom_damp := 0.9
var zoomchech := false

@export var boundsx := 50
@export var boundsy := 50

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.position.z += startzoommod
	if get_parent_node_3d().name == "MainSC":
		position.x = Global.campp.x
		position.y = Global.campp.y
		camera.position.z = Global.mainzoom
	zoom_keeper = startzoom
	camera.position.z -= 9 * startzoom
	zoom = camera.position.z

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	zoomx(delta)

func move(delta):
	if Input.is_action_pressed("w"):
		move_keeper.y += move_accel 
	if Input.is_action_pressed("a"):
		move_keeper.x -= move_accel
	if Input.is_action_pressed("s"):
		move_keeper.y -= move_accel 
	if Input.is_action_pressed("d"):
		move_keeper.x += move_accel
	else:
		move_keeper.x *= movedamp
		move_keeper.y *= movedamp

	if move_keeper.length() > move_speed:
		move_keeper = move_keeper.normalized() * move_speed

	position.x += move_keeper.x * zoom / 20
	position.y += move_keeper.y * zoom / 20

	position.x = clamp(position.x, -boundsx, boundsx)
	position.y = clamp(position.y, -boundsy, boundsy)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			zoomcof = zoom * coef
			position.x -= event.relative.x * zoomcof
			position.y += event.relative.y * zoomcof

	if Input.is_action_pressed("MW_up"):
		zoom_keeper = -zoom_accel * zoom / 17
		zoomchech = true 
	if Input.is_action_pressed("MW_down"):
		zoom_keeper = zoom_accel * zoom / 12
		zoomchech = true

func zoomx(delta):
	if Input.is_action_pressed("q"):
		zoom_keeper = zoom_accel * zoom / 20
	if Input.is_action_pressed("e"):
		zoom_keeper = -zoom_accel * zoom / 20
	
	if zoomchech == false :
		zoom_keeper *= zoom_damp

	zoomchech = false

	zoom += zoom_keeper
	zoom = clamp(zoom, zoom_min, zoom_max)

	#print (zoom, " : ", zoom_keeper)
	camera.position.z = zoom
