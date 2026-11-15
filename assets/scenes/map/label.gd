extends Label

@export var speed = 0.05

var statusPilihan = 0

var mainRoute = preload("res://assets/scenes/map/main_route.tscn")

var message = "Ada yang mengetuk pintu"
var message1 = "Ellen : Hmm... apa aku racun aja ya?"
var racun = "Ellen : Tapi kucing tetangga sering cari tikus di sini"
var racun2 = "Ellen : Kalau nanti kucingnya ikutan mati gimana?"

@onready var button1 = $Button
@onready var button2 = $Button2

func _ready():
	button1.hide()
	button2.hide()

	await get_tree().create_timer(5.0).timeout
	await ketik(message)
	await get_tree().create_timer(1.0).timeout
	await ketik(message1)

	statusPilihan = 0
	button1.text = "Racuni"
	button2.text = "Abaikan"
	button1.show()
	button2.show()

func ketik(dialog):
	text = ""
	for i in range(dialog.length()):
		text += dialog[i]
		await get_tree().create_timer(speed).timeout

func pilihRacun():
	button1.hide()
	button2.hide()

	await ketik(racun)
	await get_tree().create_timer(1.0).timeout
	await ketik(racun2)

	statusPilihan = 1
	button1.text = "Tetap Racuni"
	button2.text = "Batal racuni tikus,"
	button1.show()
	button2.show()
	await get_tree().create_timer(2.5).timeout
	button2.text += " minum racunnya"

func _on_button_pressed():
	if statusPilihan == 0:
		pilihRacun()
	elif statusPilihan == 1:
		get_tree().change_scene_to_packed(mainRoute)

func _on_button_2_pressed():
	if statusPilihan == 0:
		badEnd()
	elif statusPilihan == 1:
		trollEnd()

func badEnd():
	print("Bad Ending")

func trollEnd():
	print("Troll Ending")
