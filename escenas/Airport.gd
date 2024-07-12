extends Control

@onready var animated_sprite_2d = %AnimatedSprite2D

var is_bought = false
var connected_airports = []
var cost: int
var origin_airport: Node2D

func _ready():
	var airport_id = get_meta("airport_id")
	match airport_id:
		"Chiriqui":
			set_airport_data("Chiriqui", 1000, Vector2(100, 100))
		"Bocas":
			set_airport_data("Bocas del Toro", 1000, Vector2(200, 200))
		"Veraguas":
			set_airport_data("Veraguas", 1000, Vector2(300, 300))
		"Panama":
			set_airport_data("Panama", 1000, Vector2(400, 400))
		"Darien":
			set_airport_data("Darien", 1000, Vector2(500, 500))
		_:
			print("Error: Aeropuerto no reconocido")

func set_airport_data(new_name: String, new_cost: int, new_position: Vector2):
	name = new_name
	cost = new_cost
	position = new_position


func _on_button_pressed():
	var menu = animated_sprite_2d
	get_tree().current_scene.add_child(menu)
	menu.global_position = get_global_mouse_position()
	print("Menú desplegado.")

func _on_Airport_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if is_bought and event.doubleclick:  # Agregué esta condición
			set_process(true) 
		else:
			set_process(false)  

func _on_Airport_drag_started():
	var route = load("res://escenas/Rutas.gd").new()
	add_child(route)
	route.set_airport(self, null) 

func _on_Airport_drag_ended():
	var route = get_child(0)
	if route.connect("airport_connected", self._on_airport_connected) == OK:
		connected_airports.append(route)
	else:
		route.queue_free()

func _on_airport_connected(airport: Node2D):
	var route = get_child(0)
	route.set_airport(origin_airport, airport)  
