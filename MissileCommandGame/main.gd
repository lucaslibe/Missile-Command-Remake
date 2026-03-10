extends Node2D
var pontuacao_atual = 0
var level_atual = 0
var speed = 100
var pontuacao_meta = 1000
var spawn_rate = 1.3
#meta prox nivel, speed dos inimigos, spawn rate de inimgos, variedade de inimigos 
var nivel1 = [1000, 100,  1, 'x']
var nivel2 = [5000, 150,  0.8, 'x']
var niveis = [nivel1, nivel2]

func levelup():
	level_atual +=1
	pontuacao_meta = niveis[level_atual][0]
	speed = niveis[level_atual][1]
	spawn_rate = niveis[level_atual][2]




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if pontuacao_atual > pontuacao_meta:
		levelup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
