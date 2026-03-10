extends Sprite2D

@export var target_node_path_for_spinner: NodePath
var target_node: Node2D
var target_node_spinner: Node2D

func _ready():
	target_node_spinner = get_node(target_node_path_for_spinner)
	EconomyHandler.fuel_cost = 0
	EconomyHandler.gunpowder_cost = 0
	pass 
	$soundtrack.play()


func _process(_delta):
		look_at(target_node_spinner.global_position)
