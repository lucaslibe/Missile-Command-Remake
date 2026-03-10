extends Node2D
var explosionlevel = 2
func _process(_delta: float):
	$kaboom.explosionlevel = explosionlevel
	if $kaboom.isOver == true:
		queue_free()
