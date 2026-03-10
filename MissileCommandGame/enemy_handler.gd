extends Node2D
var level = 4
var bossfight
var repeat = 0
var cooldown = 0
var type = 0
var rng = RandomNumberGenerator.new()
var sway = 1
var center : Vector2
var tonextlevel = 0
var points = 0
@export var Cidade6: NodePath
@export var Cidade5: NodePath
@export var Cidade4: NodePath
@export var Cidade3: NodePath
@export var Cidade2: NodePath
@export var Cidade1: NodePath
var target_node: Node2D
var start : Vector2
@onready var enemy_scene = preload("res://enemy_fire.tscn")
func _on_bullet_destroyed():
	points += 1
	print(points)
	if points >= tonextlevel and level < 4:
		level += 1
		points = 0
		await $"../fadeLayer".fade_out(0.5)
		Globallevelup.emit_signal("level_up")
		await $"../fadeLayer".fade_in(0.5)
func _ready():
	await get_tree().process_frame
	await $"../fadeLayer".fade_in(1)
	level = 1
	center.x = global_position.x
	start.x = global_position.x
	start.y = global_position.y
func _process(delta) : 
	start.x = rng.randf_range(0, 750)
	if cooldown > 0:
		cooldown -= 1 *delta
	if cooldown <= 0:
		if level == 1:
			type = int(rng.randf_range(1,3))
			tonextlevel = 15
		if level == 2:
			type = int(rng.randf_range(1,4))
			tonextlevel = 20
		if level == 3:
			type = int(rng.randf_range(1,5))
			tonextlevel = 30
		if level == 4:
			type = int(rng.randf_range(1,6))
		var projectile = enemy_scene.instantiate()
		get_tree().current_scene.add_child(projectile)
		projectile.connect("bullet_destroyed", Callable(self, "_on_bullet_destroyed"))
		projectile.typeOfEnemy = type
		projectile.setHP(type)
		projectile.global_position = start
		match int(rng.randf_range(1,7)):
			1:
				target_node = get_node(Cidade1)
			2:
				target_node = get_node(Cidade2)
			3:
				target_node = get_node(Cidade3)
			4:
				target_node = get_node(Cidade4)
			5:
				target_node = get_node(Cidade5)
			6:
				target_node = get_node(Cidade6)
		projectile.target = target_node.global_position
		$spawnsound.play()
		if repeat == 0:
			cooldown = 5 - 0.5*level
			repeat = int(points/15.0)
		else:
			repeat -= 1
