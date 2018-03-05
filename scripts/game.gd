extends Control

# game variables
var tick = 5
var scoreTotal = 0
var scoreTick = 10

# timer variables
var timer = Timer.new()
var hudTimer = Timer.new()

# labels
onready var labelTime = $HUD/dynamic/time
onready var labelScore = $HUD/dynamic/score
onready var labelTurn = $HUD/dynamic/turn

# paddings
var pad = "%02d"
var scorePad = "%013d"



func _ready():
	var a = timer
	add_child(timer)
	a.connect("timeout", self, "timer_expire")
	a.set_one_shot(false)
	a.set_wait_time(tick)
	a.start()
	
	var b = hudTimer
	add_child(b)
	b.connect("timeout", self, "HUD_update")
	b.set_one_shot(false)
	b.set_wait_time(1)
	b.start()
	
	signalManager.connect("step", self, "turno")

func timer_expire():
	print("timer expired")
	signalManager.emit_signal("step")

func turno():
	print("signal recieved") 
	timer.start()
	score_increase()

func score_increase():
	scoreTotal += scoreTick
	labelScore.text = str(scorePad % (scoreTotal))
	labelTurn.text = str(scorePad % (scoreTick))

func HUD_update():
	labelTime.text = str(pad % timer.time_left)