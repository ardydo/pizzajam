extends Control

# game variables
var default_timer = 3
var timer = Timer.new()


func _ready():
	var a = timer
	add_child(timer)
	a.connect("timeout", self, "go")
	a.set_one_shot(false)
	a.set_wait_time(default_timer)
	a.start()
	
	signalManager.connect("step", self, "turno")

func go():
	print("step signal sent")
	signalManager.emit_signal("step")
	

func turno():
	print("step signal recieved") 
	pass