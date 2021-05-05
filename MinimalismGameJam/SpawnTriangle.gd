extends Node

var timer = RandomNumberGenerator.new()

func _ready():
	$CanvasLayer/StaticBody2D/AnimationPlayer.play("fade_in")
	pass

func _physics_process(delta) -> void:
	$CanvasModulate/ParallaxLayer.scale * Global.speed123

func _on_Timer_timeout():
	pass
	#var scene2 = load("res://TriangleTop.tscn")
	#var scene = load("res://TriangleBottom.tscn")

	#var triangle2 = scene2.instance()
	#var triangle = scene.instance()

	#add_child(triangle2)
	#add_child(triangle)

func _on_Timer2_timeout():
	var scene3 = load("res://Barrel.tscn")
	var barrel = scene3.instance()
	add_child(barrel)
	
	timer.randomize()
	var timee = timer.randf_range(0.3, 2)
	$Timer2.set_wait_time(timee)



