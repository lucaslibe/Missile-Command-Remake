extends AnimatedSprite2D
var isOver = false
@onready var _animated_sprite = $"."
var explosionlevel
func _ready():
	_animated_sprite.connect("animation_finished", Callable(self, "_on_animation_finished"))
	$explosionaudio.play()
func _process(_delta):
	match explosionlevel:
		0:
			_animated_sprite.play("level 0")
		1:
			_animated_sprite.play("level 1")
		2:
			_animated_sprite.play("level 2")
		3:
			_animated_sprite.play("level 3")
func _on_animation_finished():
	isOver = true
	pass
