extends Button

var ispressed = false
var select = AudioStreamPlayer.new()
var player = AudioStreamPlayer.new()

func _ready():
	self.add_child(select)
	select.stream = load("res://select.wav")
	select.volume_db = -15
	
	self.add_child(player)
	player.stream = load("res://SpaceGameSong.wav")
	player.volume_db = -15

	if Global.firsttime == true:
		player.play()
		Global.firsttime = false

func _on_Button_pressed():
	if Global.unlocked == true:
		if Global.equiped == false:
			$Sprite.visible = true
			Global.equiped = true
			select.play()
		else:
			$Sprite.visible = false
			Global.equiped = false
			select.play()


func _on_Button3_pressed():
	if ispressed == false:
		get_node("/root/Menu/CanvasModulate/tag/Sprite2").play("2")
		ispressed = true
		Global2.player.stop()
		return

	if ispressed == true:
		get_node("/root/Menu/CanvasModulate/tag/Sprite2").play("1")
		ispressed = false
		Global2.player.play()
		return
