extends Node

var speed123 = 1
var scenename : String
var score = 0
var highscore = 0
var permascore = 0
var unlocked = false
var equiped = false
var firsttime = true
var soundplayed = false

func _ready():
	pass


func _physics_process(delta) -> void:
	scenename = get_tree().get_current_scene().get_name()
	if scenename == "Node2D":
		speed123 += 0.03 * delta
		score += pow(speed123 * 3, 2) * 0.02
		if highscore <= score:
			highscore = score
		permascore = score
	else:
		score = 0
		speed123 = 1
	if highscore >= 1000:
		unlocked = true
	
