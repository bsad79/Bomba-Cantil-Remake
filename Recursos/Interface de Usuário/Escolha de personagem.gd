extends Control

var lista_de_personagens
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Transição".play("Aparecer")
	
	if Raiz.número_de_conclusões > 0:
		lista_de_personagens = [
			"res://Recursos/Animações/Jogador.tres",
			"res://Recursos/Animações/Angel is.tres",
			"res://Recursos/Animações/Zamboss.tres",
			"res://Recursos/Animações/Inimigo_1.tres",
			"res://Recursos/Animações/Inimigo_2.tres",
			"res://Recursos/Animações/Inimigo_3.tres",
			"res://Recursos/Animações/Inimigo_4.tres",
			"res://Recursos/Animações/Inimigo_5.tres",
			"res://Recursos/Animações/Inimigo_6.tres"
		]
	if Raiz.número_de_conclusões > 1:
		lista_de_personagens = [
			"res://Recursos/Animações/Jogador.tres",
			"res://Recursos/Animações/Angel is.tres",
			"res://Recursos/Animações/Zamboss.tres",
			"res://Recursos/Animações/Inimigo_1.tres",
			"res://Recursos/Animações/Inimigo_2.tres",
			"res://Recursos/Animações/Inimigo_3.tres",
			"res://Recursos/Animações/Inimigo_4.tres",
			"res://Recursos/Animações/Inimigo_5.tres",
			"res://Recursos/Animações/Inimigo_6.tres",
			"res://Recursos/Animações/Desenvolvedores/Combate/Cota.tres",
			"res://Recursos/Animações/Desenvolvedores/Combate/Marcos.tres",
			"res://Recursos/Animações/Desenvolvedores/Combate/Matheus.tres",
			"res://Recursos/Animações/Desenvolvedores/Combate/Ori.tres",
			"res://Recursos/Animações/Desenvolvedores/Combate/Samuel.tres"
		]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_confirmar_escolha_pressed():
	Raiz.som_de_botão.play()
	$"Transição".play_backwards("Aparecer")
	Raiz.personagem_selecionado = lista_de_personagens[i]
	get_tree().change_scene_to_file("res://Recursos/Fases/fase_1.tscn")
	pass # Replace with function body.


func _on_escolha_de_personagem_pressed():
	Raiz.som_de_botão.play()
	i += 1
	if i > lista_de_personagens.size() - 1:
		i = 0
	$"Elementos da tela/Escolha de personagem/Posição do sprite/Visualização de personagem".sprite_frames = load(lista_de_personagens[i])
	$"Elementos da tela/Escolha de personagem/Posição do sprite/Visualização de personagem".play("Parado")
	pass # Replace with function body.
