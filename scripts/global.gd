extends Control

var savegame = file.new()
var save_path = "user://savegame.save"

func reload():
	get_tree().reload_current_scene()


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_quit"):
		get_tree().quit()
	if event.is_action_pressed("ui_restart"):
		reload()
		
func change(a):
	print("changing screen to " + str(a))
	get_tree().change_scene(a)