extends Node

var teste = "hmm"
var vida_do_jogador
var pontuação_do_jogador
var dialogo_está_apresentando
var fase_atual

@onready var som_de_botão = $"Som de botão pressionado"
@onready var música_para_chefes = $"Música para Chefes"
@onready var música_padrão = $"Múscia padrão"

# Called when the node enters the scene tree for the first time.
func _ready():
	fase_atual = 0
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
