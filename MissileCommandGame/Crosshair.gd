extends AnimatedSprite2D

@onready var _animated_sprite = $"."
var has_resources
var velocidade = 250
var centro_da_tela
var can_shoot = true
func _ready():
	centro_da_tela = get_viewport_rect().size / 2.0
	_animated_sprite.play("Good")
	EconomyHandler.Current_resources_fuel = 0
	EconomyHandler.Current_resources_gunpowder = 0

func _process(delta):
	if EconomyHandler.Current_resources_fuel < EconomyHandler.fuel_cost or EconomyHandler.Current_resources_gunpowder < EconomyHandler.gunpowder_cost:
		has_resources = false
	else:
		has_resources = true
	var direcao = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direcao.y -= 1
	if Input.is_action_pressed("ui_down"):
		direcao.y += 1
	if Input.is_action_pressed("ui_left"):
		direcao.x -= 1
	if Input.is_action_pressed("ui_right"):
		direcao.x += 1
	if Input.is_action_pressed("ui_accept"):
		if $".".global_position.y < 825:
			if can_shoot and has_resources:
				$"../Intenção"._shoot($".".global_position)
				_animated_sprite.play("Good")
	position += direcao * velocidade * delta
	if direcao != Vector2.ZERO:
		direcao = direcao.normalized()
		position += direcao * velocidade * delta
	if $".".global_position.y >= 825:
		_animated_sprite.play("Bad")
	else : 
		_animated_sprite.play("Good")
	pass
