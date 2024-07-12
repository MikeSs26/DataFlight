extends Node2D

var origin_airport: Node2D
var destination_airport: Node2D
var line: Line2D

func _ready():
	line = Line2D.new()
	add_child(line)

func set_airport(origin: Node2D, destination: Node2D):
	origin_airport = origin
	destination_airport = destination

func _draw():
	if origin_airport && destination_airport:
		line.points = [origin_airport.position, destination_airport.position]
		line.default_color = Color(1, 1, 1)
		line.width = 2
