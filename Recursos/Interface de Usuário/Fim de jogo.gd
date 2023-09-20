extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Raiz.música_padrão.stop()
	Raiz.música_para_chefes.stop()
	$"Elementos da tela/Pontuação/Valor".text = str(Raiz.pontuação_do_jogador)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reiniciar_pressed():
	Raiz.som_de_botão.play()
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass # Replace with function body.
