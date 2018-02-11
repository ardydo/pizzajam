extends Node

# the signal who runs it all
signal step

func _ready():
	pass

func eStep():
	emit_signal("step")