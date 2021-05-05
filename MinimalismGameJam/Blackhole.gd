extends KinematicBody2D


func _physics_process(delta) -> void:
	$Sprite4.rotation += 0.003
	$Sprite3.rotation -= 0.005
	$Sprite2.rotation += 0.007
	$blackhole2part.rotation -= 0.009
