extends Node2D

@onready var menu_compra = %menu_compra
@onready var bocas_del_toro_button = $bocas_del_toro_button
@onready var chiriqui_button = $chiriqui_button
@onready var veraguas_button = $veraguas_button
@onready var darien_button = $darien_button
@onready var panama_button = $panama_button
@onready var opcion_comprar = $menu_compra/opcion_comprar
@onready var opcion_salir_menu = $menu_compra/opcion_salir_menu
var menu = null

func _on_bocas_del_toro_button_pressed():
	mostrar_menu("bocas del toro")

func _on_chiriqui_button_pressed():
	mostrar_menu("chiriqui")

func _on_veraguas_button_pressed():
	mostrar_menu("veraguas")

func _on_darien_button_pressed():
	mostrar_menu("darien")

func _on_panama_button_pressed():
	mostrar_menu("panama")

func _on_opcion_comprar_pressed():
	var provincia_comprada = String(menu.animation).to_upper()
	print("Felicidades. Compraste el aeropuerto de ", provincia_comprada)
	cambiar_icono_aeropuerto(menu.animation)
	ocultar_menu()

func _on_opcion_salir_menu_pressed():
	print("Saliendo del menú de compra.")
	ocultar_menu()

func mostrar_menu(animacion):
	if not menu:
		get_tree().current_scene.add_child(menu_compra)
		menu = menu_compra
	menu.animation = animacion
	menu.show()
	menu.global_position = get_global_mouse_position()
	print("Menú desplegado.")

func ocultar_menu():
	if menu:
		menu.hide()
	else:
		print("Error: El nodo menu no está inicializado correctamente.")

func cambiar_icono_aeropuerto(opcion):
	match opcion:
		"bocas del toro":
			bocas_del_toro_button.icon = load("res://assets/AeropuertoComprado.png")
		"chiriqui":
			chiriqui_button.icon = load("res://assets/AeropuertoComprado.png")
		"veraguas":
			veraguas_button.icon = load("res://assets/AeropuertoComprado.png")
		"darien":
			darien_button.icon = load("res://assets/AeropuertoComprado.png")
		"panama":
			panama_button.icon = load("res://assets/AeropuertoComprado.png")
