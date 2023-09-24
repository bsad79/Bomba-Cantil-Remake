extends Node

var configuração = ConfigFile.new()

var teste = "hmm"
var vida_do_jogador
var pontuação_do_jogador = 0
var maior_pontuação = 0
var dialogo_está_apresentando
var fase_atual
var número_de_conclusões = 0
var personagem_selecionado = "res://Recursos/Animações/Jogador.tres"

@onready var som_de_botão = $"Som de botão pressionado"
@onready var música_para_chefes = $"Música para Chefes"
@onready var música_padrão = $"Múscia padrão"

# Called when the node enters the scene tree for the first time.
func _ready():
	carregar_progresso()
	
	fase_atual = 0
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func salvar_progresso():
	configuração.set_value("Dados", "maior_pontuação", maior_pontuação)
	configuração.set_value("Dados", "número_de_conclusões", número_de_conclusões)
	for i in InputMap.get_actions().size():
		configuração.set_value("Dados", "controles"+str(i), InputMap.action_get_events(InputMap.get_actions()[i]))
		pass
	configuração.save("res://save.cfg")
	pass

func carregar_progresso():
	if !configuração.load("res://save.cfg"):
		configuração.load("res://save.cfg")
		maior_pontuação = configuração.get_value("Dados", "maior_pontuação")
		número_de_conclusões = configuração.get_value("Dados", "número_de_conclusões")
		for i in InputMap.get_actions().size():
			InputMap.action_erase_events( InputMap.get_actions()[i])
			for j in configuração.get_value("Dados", "controles"+str(i)).size():
				InputMap.action_add_event(InputMap.get_actions()[i] ,configuração.get_value("Dados", "controles"+str(i))[j])
				pass
			pass
	pass
