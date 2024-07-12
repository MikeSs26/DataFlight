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

const menu_scene = preload("res://escenas/menu_scene.tscn")


func comprar_aeropuerto(nombre_aeropuerto):
	if aeropuertos.has(nombre_aeropuerto):
		var aeropuerto = aeropuertos[nombre_aeropuerto]
		if aeropuerto["costo"] <= dinero_jugador and not aeropuerto["comprado"]:
			dinero_jugador -= aeropuerto["costo"]
			aeropuerto["comprado"] = true
			print("Aeropuerto comprado: ", nombre_aeropuerto)
		else:
			print("No se puede comprar el aeropuerto: ", nombre_aeropuerto, " (fondos insuficientes o ya comprado)")
	else:
		print("Aeropuerto no encontrado: ", nombre_aeropuerto)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var menu = menu_scene.instance()
		get_tree().current_scene.add_child(menu)
		menu.position = global_position  
		print("Aeropuerto clickeado en posición: ", global_position)
