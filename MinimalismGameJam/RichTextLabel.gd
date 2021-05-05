extends Label

var scene : String

func _physics_process(delta) -> void:
	
	scene = get_tree().get_current_scene().get_name()
	if scene == "Node2D":
		set_text(str(int(Global.score)))
	else:
		set_text(str(int(Global.highscore)))

	
