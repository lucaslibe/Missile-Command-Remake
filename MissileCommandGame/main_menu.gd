extends Control
@onready var panelCredits = $PanelCredits
@onready var TituloJogo = $TituloJogo
var posicao_original_y = 280
var posicao_creditos_y = 125
func _ready() -> void:
	panelCredits.visible = false

func _process(_delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_credits_button_pressed() -> void:
	panelCredits.visible = true
	TituloJogo.position.y = posicao_creditos_y

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_close_button_pressed() -> void:
	panelCredits.visible = false
	TituloJogo.position.y = posicao_original_y
