extends KinematicBody2D

var velocity = Vector2(180, 30)
var jump = AudioStreamPlayer.new()
var dead = AudioStreamPlayer.new()
var notdead = true	

func _ready():
	position = Vector2(400, 450)
	self.add_child(jump)
	jump.stream = load("res://jump.wav")
	jump.volume_db = -15
	
	self.add_child(dead)
	dead.stream = load("res://dead.wav")
	dead.volume_db = -15

func _physics_process(delta) -> void:
	
	get_node("/root/Node2D/CameraTrackingObject").position.x += 3 * Global.speed123
	
	velocity.y += 15
	
	if position.x <= 400 + get_node("/root/Node2D/CameraTrackingObject").position.x:
		velocity.x = 200 * Global.speed123
	else:
		velocity.x = 180 * Global.speed123
	
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		if collision.collider.name == "Color" or collision.collider.name == "Color2":
			notdead = false
		if collision.collider.name == "Color2" and notdead == false:
			velocity = Vector2(-500, 0)
			get_node("/root/Node2D/CanvasLayer/StaticBody2D/AnimationPlayer").play("fade_out")
			if !Global.soundplayed:
				dead.play()
				Global.soundplayed = true
	
			velocity = Vector2(-500, 0)
			#get_node("/root/Node2D/CanvasLayer/StaticBody2D/AnimationPlayer").play("fade_out")
			#if !soundplayed:
				#dead.play()
				#soundplayed = true

	
	if Input.is_action_pressed("ui_up") and velocity.y >= 50 and notdead == true:
		velocity.y -= velocity.y + 450
		
	if Global.equiped == false:
		if velocity.y >= 300:
			$AnimatedSprite.play("fall")
		else:
			$AnimatedSprite.play("default")
	
	if Global.equiped == true:
		if velocity.y >= 300:
			$AnimatedSprite.play("fall2")
		else:
			$AnimatedSprite.play("default2")
	
	velocity = move_and_slide(velocity)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene("res://Menu.tscn")
