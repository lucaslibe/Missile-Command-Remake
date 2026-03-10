extends Sprite2D

@export var target_node_path: NodePath
var target_node: Node2D
var velocidade = 10000000
var movendo = false

func _ready():
	target_node = get_node(target_node_path)
	pass 


 
func _process(delta):
	$".".global_position = $".".global_position.move_toward(target_node.global_position, velocidade * delta)
	if $".".global_position.y >= 825:
		$".".global_position.y = 825
	pass
