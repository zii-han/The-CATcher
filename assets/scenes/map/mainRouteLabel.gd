extends Label

@export var speed = 0.05
var message = "Kamu meracuni tikusnya, tetapi kucing tetanggamu memakan bangkai tikus tersebut."
var kutukan = preload("res://assets/scenes/map/kutukan.tscn")

func _ready():
	await get_tree().create_timer(2.0).timeout
	text = ""
	show_text()

func show_text():
	for i in range(message.length()):
		text += message[i]
		await get_tree().create_timer(speed).timeout

	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_packed(kutukan)
