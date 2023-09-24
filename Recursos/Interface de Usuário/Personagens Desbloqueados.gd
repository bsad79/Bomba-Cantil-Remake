extends Control

var apertou_para_sair = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Tempo de visualização".start()
	$"Transição".play("Aparecer")
	
	if Raiz.número_de_conclusões == 0:
		get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Fim de Jogo.tscn")
	else:
		if Raiz.número_de_conclusões == 1:
			$"Fila dos Desenvolvedores/Posição 1/Sprite".sprite_frames = preload("res://Recursos/Animações/Angel is.tres")
			$"Fila dos Desenvolvedores/Posição 1/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 2/Sprite".sprite_frames = preload("res://Recursos/Animações/Zamboss.tres")
			$"Fila dos Desenvolvedores/Posição 2/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 3/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_1.tres")
			$"Fila dos Desenvolvedores/Posição 3/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 4/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_2.tres")
			$"Fila dos Desenvolvedores/Posição 4/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 5/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_3.tres")
			$"Fila dos Desenvolvedores/Posição 5/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 6/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_4.tres")
			$"Fila dos Desenvolvedores/Posição 6/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 7/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_5.tres")
			$"Fila dos Desenvolvedores/Posição 7/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 8/Sprite".sprite_frames = preload("res://Recursos/Animações/Inimigo_6.tres")
			$"Fila dos Desenvolvedores/Posição 8/Sprite".play("Parado")
		else:
			$"Fila dos Desenvolvedores/Posição 1/Sprite".sprite_frames = preload("res://Recursos/Animações/Desenvolvedores/Combate/Cota.tres")
			$"Fila dos Desenvolvedores/Posição 1/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 2/Sprite".sprite_frames = preload("res://Recursos/Animações/Desenvolvedores/Combate/Marcos.tres")
			$"Fila dos Desenvolvedores/Posição 2/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 3/Sprite".sprite_frames = preload("res://Recursos/Animações/Desenvolvedores/Combate/Matheus.tres")
			$"Fila dos Desenvolvedores/Posição 3/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 4/Sprite".sprite_frames = preload("res://Recursos/Animações/Desenvolvedores/Combate/Ori.tres")
			$"Fila dos Desenvolvedores/Posição 4/Sprite".play("Parado")
			$"Fila dos Desenvolvedores/Posição 5/Sprite".sprite_frames = preload("res://Recursos/Animações/Desenvolvedores/Combate/Samuel.tres")
			$"Fila dos Desenvolvedores/Posição 5/Sprite".play("Parado")
			
			$"Fila dos Desenvolvedores/Posição 6".visible = false
			$"Fila dos Desenvolvedores/Posição 7".visible = false
			$"Fila dos Desenvolvedores/Posição 8".visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_released("Bater") and !apertou_para_sair and $"Tempo de visualização".is_stopped():
		#apertou_para_sair = true
	pass

func sair():
	$"Transição".play_backwards("Aparecer")
	await $"Transição".animation_finished
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Fim de Jogo.tscn")
	pass


func _on_tempo_de_visualização_timeout():
	sair()
	pass # Replace with function body.
