extends Node2D

func _ready():
	$CanvasModulate/Button/StaticBody2D.position = Vector2(0, 0)
	$CanvasModulate/Button/AnimationPlayer.play("fade")
	Global.soundplayed = false
