extends Node2D

var dist = 8

func _ready():
	set_process_input(true)
	
func _input(event):
	var l = Input.is_action_just_pressed("ui_left")
	var r = Input.is_action_just_pressed("ui_right")
	var u = Input.is_action_just_pressed("ui_up")
	var d = Input.is_action_just_pressed("ui_down")
	
	if l or r or u or d:
		signalManager.eStep()
	
	if l:
		rotation_degrees = 0
		scale = Vector2(-1,1)
		translate(Vector2(-dist,0))
	elif r:
		rotation_degrees = 0
		scale = Vector2(1,1)
		translate(Vector2(dist,0))
	
	if u:
		rotation_degrees= 90
		scale = Vector2(-1,1)
		translate(Vector2(0,-dist))
		
	elif d:
		rotation_degrees = -90
		scale = Vector2(1,1)
		translate(Vector2(0,dist))
		