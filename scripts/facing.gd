extends Node

enum {UP, DOWN, RIGHT, LEFT}
var dir = RIGHT

func _ready():
	signalManager.connect("step", self, "update")
	
func spin(a):
	self.rotate(deg2rad(a))

func update():
	var a = 90
	match dir:
		UP:
			spin(a)
		DOWN:
			spin(3*a)
		RIGHT:
			spin(0)
		LEFT:
			spin(2*a)
		
	Trans