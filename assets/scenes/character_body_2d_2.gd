extends Label
@export var speed = 0.05
var message = "Ellen : "
func _ready():
	text = ""
	show_text()

func show_text():
	for i in range(message.length()):
		text += message[i]
		await get_tree().create_timer(speed).timeout
