extends Node2D

# moving vars
var dist = 8
var destination = Vector2(0,0)
var moving = false


#rays stuff
onready var RayRight = $RayRight
onready var RayLeft = $RayLeft
onready var RayUp = $RayUp
onready var RayDown = $RayDown
onready var rays = [RayRight, RayLeft, RayUp, RayDown]
var currentRay

var rightMove
var leftMove
var upMove
var downMove
onready var dirMove = [rightMove, leftMove,upMove,downMove]

onready var sprites = $Sprites

func _ready():
	print(rays)
	set_process_input(true)
	set_physics_process(true)
	
	# add exception to arrays
	for item in rays:  
		item.enabled = true
	
	for item in dirMove:
		item = false
	
	print(dirMove.0)
	
func _input(event):
	var l = Input.is_action_just_pressed("ui_left")
	var r = Input.is_action_just_pressed("ui_right")
	var u = Input.is_action_just_pressed("ui_up")
	var d = Input.is_action_just_pressed("ui_down")
	
	if l or r or u or d:
		moving = true
		signalManager.eStep()
		if l:
			sprites.rotation_degrees = 0
			sprites.scale = Vector2(-1,1)
			destination = (Vector2(-dist,0))
		elif r:
			sprites.rotation_degrees = 0
			sprites.scale = Vector2(1,1)
			destination = (Vector2(dist,0))
		
		if u:
			sprites.rotation_degrees= 90
			sprites.scale = Vector2(-1,1)
			destination = (Vector2(0,-dist))
			
		elif d:
			sprites.rotation_degrees = 90
			sprites.scale = Vector2(1,1)
			destination = (Vector2(0,dist))
	else:
		moving = false

func _physics_process(delta):
	if moving:
		for item in rays:
			if item.is_colliding():
				dirMove.item = true
				print(item.is_colliding())
			else:
				dirMove.item = false
	moving = false

	if moving:
		print(currentRay)
		print(currentRay.is_colliding())
		if currentRay.is_colliding():
			moving = false
		else:
			move(destination)
	pass
	
func move(destination):
	translate(destination)
	destination = Vector2(0,0)
	moving = false
	pass
	
func _draw():
	draw_line(Vector2(0,0), destination, Color(25,25,25),1,false)