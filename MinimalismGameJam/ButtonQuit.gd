extends Button

func _ready():
	$AnimatedSprite.play("default")


func _on_Button_button_down():
	$AnimatedSprite.play("pressed")


func _on_Button_button_up():
	$AnimatedSprite.play("default")
	get_tree().quit()

