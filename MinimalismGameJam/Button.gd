extends Button

var complete = false
var play = AudioStreamPlayer.new()

func _ready():
	self.add_child(play)
	play.stream = load("res://start.wav")
	play.volume_db = -15
	
	$AnimatedSprite.play("default")
	$StaticBody2D.position = Vector2(2000, 2000)

func _physics_process(delta) -> void:
	get_node("/root/Menu/CameraTrackingObject").position.x += 3


func _on_Button_button_up():
	play.play()
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("new_scene")


func _on_Button_button_down():
	$AnimatedSprite.play("pressed")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "new_scene":
		get_tree().change_scene("res://MainScene.tscn")
