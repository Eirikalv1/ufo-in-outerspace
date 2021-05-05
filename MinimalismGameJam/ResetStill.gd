extends KinematicBody2D


func _ready():
	$AnimatedSprite.play("default")
	
func _physics_process(delta):
	if Global.highscore == 0:
		visible = true
	else:
		visible = false
