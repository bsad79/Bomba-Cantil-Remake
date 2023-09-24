extends Personagem
class_name Inimigo

#variável para salvar o objeto Jogador
var jogador

var esta_em_combate
var item_vida = preload("res://Recursos/Items/Buffs/Vida.tscn")
var item_ataque = preload("res://Recursos/Items/Buffs/Ataque.tscn")
var item_velocidade = preload("res://Recursos/Items/Buffs/Velocidade.tscn")
var item_defesa = preload("res://Recursos/Items/Buffs/Defesa.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	#Executa a função _ready da classe pai
	super._ready()
	esta_em_combate = false
	
	#Obtém o objeto do jogador
	jogador = get_parent().get_node("Jogador")
	pass # Replace with function body.


	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Raiz.dialogo_está_apresentando:
		#Executa a função _process da classe pai
		super._process(delta)

		#Movimentação do inimigo
		var jogadorAux = Vector2(round(jogador.position[0]), round(jogador.position[1]))
		var positionAux = Vector2(round(position[0]), round(position[1]))
		
		#Obtem a diferença das posiões deles no eixo X e garante que seja um valor positivo
		var valor_em_x = jogadorAux[0] - positionAux[0]
		if valor_em_x < 0:
			valor_em_x *= -1

		#Obtem a diferença das posiões deles no eixo Y e garante que seja um valor positivo
		var valor_em_y = jogadorAux[1] - positionAux[1]
		if valor_em_y < 0:
			valor_em_y *= -1
		
		#Movimenta ele caso ele não esteja muito próximo do personagem em X
		if (valor_em_x > 70):
			if (jogadorAux[0] > positionAux[0]):
				vetor_de_movimento.x += 1
			elif (jogadorAux[0] < positionAux[0]):
				vetor_de_movimento.x -= 1
			else:
				vetor_de_movimento.x = 0
			
		#Afasta ele do personagem se estiverem muito próximos
		elif (valor_em_x <= 60):
			if (jogadorAux[0] > positionAux[0]):
				vetor_de_movimento.x -= 1
			if (jogadorAux[0] < positionAux[0]):
				vetor_de_movimento.x += 1
		else:
			vetor_de_movimento.x = 0
		
		#Movimenta ele caso ele não esteja muito próximo do personagem em Y
		if (valor_em_y > 60):
			if (jogadorAux[1] > positionAux[1]):
				vetor_de_movimento.y += 1
			if (jogadorAux[1] < positionAux[1]):
				vetor_de_movimento.y -= 1

		#Afasta ele do personagem se estiverem muito próximos
		elif (valor_em_y <= 30):
			vetor_de_movimento.y -= 1
		else:
			vetor_de_movimento.y = 0
		
		#Atualiza a animação do inimigo dependendo de se ele estiver em movimento
		if vetor_de_movimento.length() > 0:
			vetor_de_movimento = vetor_de_movimento.normalized()* velocidade
		
		#Faz o inimigo se movimentar
		velocity = vetor_de_movimento
		#Limita o movimento do personagem para que ele não saia da tela
		position = position.clamp(Vector2.ZERO, tamanho_da_tela)
		
		#Muda a orientação do sprite do inimigo
		if jogador.position[0] - position[0] < 0:
			$"Sprite Animado".flip_h = true
			get_node("Área do Golpe/Colisão do Golpe").position[0] = -76
		elif jogador.position[0] - position[0] > 0:
			$"Sprite Animado".flip_h = false
			get_node("Área do Golpe/Colisão do Golpe").position[0] = 76
		
		if (alvo != null and esta_em_combate and get_node("Tempo entre ataques").is_stopped() and !está_sofrendo_dano):
			if (alvo.name.begins_with("Jogador")):
				if (!alvo.está_sofrendo_dano):
					get_node("Tempo entre ataques").start()
					executar_animação_de_ataque()
					jogador.definir_vida(ataque)
					pass
				pass
			pass
		elif !está_sofrendo_dano and (!esta_em_combate or get_node("Tempo entre ataques").is_stopped()):
			if vetor_de_movimento.length() > 0:
				$"Sprite Animado".animation = "Andando"
			else:
				$"Sprite Animado".animation = "Parado"
		$"Sprite Animado".play()
	pass

func morte():
	match (randi_range(0, 10)):
		0:
			var item_escolhido
			match (randi_range(0, 3)):
				0:
					item_escolhido = item_vida.instantiate()
				1:
					item_escolhido = item_ataque.instantiate()
				2:
					item_escolhido = item_defesa.instantiate()
				3:
					item_escolhido = item_velocidade.instantiate()
			item_escolhido.position = position
			get_parent().call_deferred("add_child", item_escolhido)
	super.morte()
	jogador.pontuação += pontuação
	Raiz.pontuação_do_jogador = jogador.pontuação
	pass

func _on_área_do_golpe_body_entered(body):
	alvo = body
	if (alvo.name.begins_with("Jogador")):
		esta_em_combate = true
	pass # Replace with function body.

func _on_área_do_golpe_body_exited(body):
	esta_em_combate = false
	pass # Replace with function body.
