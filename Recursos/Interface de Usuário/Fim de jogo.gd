extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Transição".play("Entrar")
	Raiz.música_padrão.stop()
	Raiz.música_para_chefes.stop()
	
	if Raiz.pontuação_do_jogador > Raiz.maior_pontuação:
		Raiz.maior_pontuação = Raiz.pontuação_do_jogador
		pass
	$"Elementos da tela/Maior Pontuação/Valor".text = str(Raiz.maior_pontuação)
	$"Elementos da tela/Pontuação/Valor".text = str(Raiz.pontuação_do_jogador)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reiniciar_pressed():
	Raiz.som_de_botão.play()
	$"Transição".play("Sair")
	await $"Transição".animation_finished
	Raiz.vida_do_jogador = 100
	Raiz.pontuação_do_jogador = 0
	Raiz.salvar_progresso()
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass # Replace with function body.
