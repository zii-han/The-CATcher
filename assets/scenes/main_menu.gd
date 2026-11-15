extends Control

const prolog = preload("res://assets/scenes/map/prolog.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(prolog)
