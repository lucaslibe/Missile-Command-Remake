extends Marker2D

@export var target_node_path: NodePath
var target_node: Node2D
@onready var missile_scene = preload("res://Boolet.tscn")
var cooldown_timer = 0
var shoot_cooldown = 0.8


func _ready():
	target_node = get_node(target_node_path)
	pass 
	
func _shoot(_target_pos: Vector2):
	EconomyHandler.Current_resources_fuel -= EconomyHandler.fuel_cost
	EconomyHandler.Current_resources_gunpowder -= EconomyHandler.gunpowder_cost
	var missile = missile_scene.instantiate()
	add_child(missile)
	$shootsound.play()
	missile.global_position = $"../Gun/Muzzle".global_position
	missile.target = target_node.global_position
	missile.fuellevel = EconomyHandler.fuel_cost
	missile.bomblevel = EconomyHandler.gunpowder_cost
	$"../Crosshair".can_shoot = false
	cooldown_timer = shoot_cooldown;
	pass
func _process(delta) : 
	if cooldown_timer > 0:
		cooldown_timer -= delta
	if cooldown_timer <= 0:
		$"../Crosshair".can_shoot = true
	pass
