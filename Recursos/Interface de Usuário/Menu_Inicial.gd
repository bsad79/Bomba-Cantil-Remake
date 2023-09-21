extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Raiz.música_padrão.play()
	$"Transição".play("Entrar")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jogar_pressed():
	Raiz.som_de_botão.play()
	$"Transição".play("Sair")
	await $"Transição".animation_finished
	get_tree().change_scene_to_file("res://Recursos/Fases/fase_1.tscn")
	pass # Replace with function body.


func _on_sair_pressed():
	Raiz.som_de_botão.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_créditos_pressed():
	Raiz.som_de_botão.play()
	$"Transição".play("Sair")
	await $"Transição".animation_finished
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Créditos.tscn")
	pass # Replace with function body.
