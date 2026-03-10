extends Area2D
@onready var megumin = preload("res://Explosion.tscn")
@export var speed: float = 250.0
var target: Vector2
var fuellevel
var bomblevel

func _process(_delta):
	$Boolet._lookattargetbullet(target)
	var direction = (target - global_position).normalized()
	global_position += direction * (speed + 100 * fuellevel) * _delta
	if global_position.distance_to(target) < 5:
		var bomb = megumin.instantiate()
		get_tree().current_scene.add_child(bomb)
		bomb.explosionlevel = bomblevel
		bomb.global_position = $".".global_position
		queue_free()
