extends Control

@onready var animated_sprite_2d = %AnimatedSprite2D

func _on_button_pressed():
	var menu = animated_sprite_2d
	get_tree().current_scene.add_child(menu)
	menu.global_position = get_global_mouse_position()
	print("Menú desplegado.")
