extends StaticBody2D


func _physics_process(delta):
	if Global.highscore == 0:
		visible = true
	else:
		visible = false
