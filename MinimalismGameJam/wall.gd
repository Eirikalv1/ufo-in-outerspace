extends KinematicBody2D

var dead = AudioStreamPlayer.new()

func _ready():
	self.add_child(dead)
	dead.stream = load("res://dead.wav")
	dead.volume_db = -15

func _physics_process(delta) -> void:
	for body in $Area2D.get_overlapping_bodies():
		if body.name == "Player":
			get_node("/root/Node2D/CanvasLayer/StaticBody2D/AnimationPlayer").play("fade_out")
			if !Global.soundplayed:
				dead.play()
				Global.soundplayed = true
