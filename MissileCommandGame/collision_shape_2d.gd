extends CollisionShape2D

var target_radius = 16.0
@onready var _shape = shape
func _ready():
	_shape.radius = 0
func _process(delta):
	match EconomyHandler.gunpowder_cost:
		0: target_radius = 16.0
		1: target_radius = 20.0
		2: target_radius = 30.0
		3: target_radius = 50.0
	_shape.radius = lerp(float(_shape.radius), target_radius, 5.0 * delta)
