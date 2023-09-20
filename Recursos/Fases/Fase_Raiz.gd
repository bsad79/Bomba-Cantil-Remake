extends Node
class_name Fase

var interface_do_jogo_cena = preload("res://Recursos/Interface de Usuário/interface_do_jogo.tscn")
var caixa_de_dialogo_cena = preload("res://Recursos/Interface de Usuário/Caixa de diálogo.tscn")

#Variáveis para controlar os elementos da cena
var cronômetro
var animação

var próxima_fase
@export var dialogo_selecionado = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	cronômetro = get_node("Cronômetro de Transição")
	animação = get_node("Transição de Fase")
	get_node("ColorRect").visible = true
	inicia_fase()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func inicia_fase():
	Raiz.dialogo_está_apresentando = true
	animação.play("Início")
	await animação.animation_finished
	
	var caixa_de_dialogo = caixa_de_dialogo_cena.instantiate()
	add_child(caixa_de_dialogo)
	caixa_de_dialogo.definir_dialogo_selecionado(dialogo_selecionado)
	caixa_de_dialogo.definir_etapa_do_dialogo(0)
	caixa_de_dialogo.atualiza_texto()
	pass

func termina_fase():
	Raiz.fase_atual += 1
	var caixa_de_dialogo = caixa_de_dialogo_cena.instantiate()
	add_child(caixa_de_dialogo)
	caixa_de_dialogo.definir_dialogo_selecionado(dialogo_selecionado)
	caixa_de_dialogo.definir_etapa_do_dialogo(1)
	caixa_de_dialogo.atualiza_texto()
	pass

func adicionar_interface_do_jogo():
	var interface = interface_do_jogo_cena.instantiate()
	add_child(interface)
	pass

func _on_cronômetro_de_transição_timeout():
	pass # Replace with function body.


func carregar_próxima_fase():
	animação.play("Fim")
	await animação.animation_finished
	get_tree().change_scene_to_file(próxima_fase)
	pass # Replace with function body.
