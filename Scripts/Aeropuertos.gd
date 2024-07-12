extends Area2D

const AEROPUERTO = preload("res://assets/Aeropuerto.png")   
const AEROPUERTO_COMPRADO = preload("res://assets/AeropuertoComprado.png")
var dinero_jugador = 2000

var aeropuertos = {
	"Chiriqui": {"costo": 1000, "comprado": false},
	"Panama": {"costo": 1000, "comprado": false},
	"Veraguas": {"costo": 1000, "comprado": false},
	"Darien": {"costo": 1000, "comprado": false},
	"Bocas del Toro": {"costo": 1000, "comprado": false},
}

var menu_scene = preload("res://escenas/Menu.tscn")

func _ready():
	self.pickable = true
	connect("input_event", self, "_on_Area2D_input_event")

func _process(delta):
	pass

func comprar_aeropuerto(nombre_aeropuerto):
	var aeropuerto = aeropuertos[nombre_aeropuerto]
	if aeropuerto["costo"] <= dinero_jugador and not aeropuerto["comprado"]:
		dinero_jugador -= aeropuerto["costo"]
		aeropuerto["comprado"] = true
		print("Aeropuerto comprado: ", nombre_aeropuerto)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		var menu = menu_scene.instance()
		get_tree().current_scene.add_child(menu)

		menu.position = global_position  
		print("Aeropuerto clickeado")
