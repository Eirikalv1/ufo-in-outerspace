extends Label

var scene : String

func _physics_process(delta) -> void:
	
	scene = get_tree().get_current_scene().get_name()
	if scene == "Menu":
		set_text(str(int(Global.permascore)))
