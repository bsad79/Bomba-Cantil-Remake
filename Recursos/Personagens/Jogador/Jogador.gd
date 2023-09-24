extends Personagem

var está_andando = false
var status = {
	ataque = ataque,
	defesa = defesa,
	velocidade = velocidade
}

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	status = {ataque = ataque, defesa = defesa, velocidade = velocidade}
	$"Sprite Animado".sprite_frames = load(Raiz.personagem_selecionado)
	if Raiz.personagem_selecionado.ends_with("Angel is.tres"):
		$"Sprite Animado".position[1] = -115
	else:
		$"Sprite Animado".position[1] = -83
	if Raiz.fase_atual != 0:
		vida = Raiz.vida_do_jogador
		pontuação = Raiz.pontuação_do_jogador
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("ataque: ", ataque, " defesa: ", defesa, " velocidade: ", velocidade)
	if !Raiz.dialogo_está_apresentando:
		super._process(delta)
		
		Raiz.vida_do_jogador = vida
		Raiz.pontuação_do_jogador = pontuação
		
		if Input.is_action_pressed("Mover para baixo"):
			vetor_de_movimento.y += 1
		if Input.is_action_pressed("Mover para cima"):
			vetor_de_movimento.y -= 1
		if Input.is_action_pressed("Mover para esquerda"):
			vetor_de_movimento.x -= 1
		if Input.is_action_pressed("Mover para direita"):
			vetor_de_movimento.x += 1

		if Input.is_action_just_pressed("Bater"):
			if (!está_sofrendo_dano and get_node("Tempo entre ataques").is_stopped()):
				get_node("Tempo entre ataques").start()
				get_node("Área do Golpe/Colisão do Golpe").disabled = false
				executar_animação_de_ataque()
			pass
		if vetor_de_movimento.length() > 0:
			vetor_de_movimento = vetor_de_movimento.normalized()* velocidade
		
		if (get_node("Tempo entre ataques").is_stopped() and get_node("Tempo de invencibilidade após dano").is_stopped()):
			if vetor_de_movimento.length() > 0:
				$"Sprite Animado".animation = "Andando"
			else:
				$"Sprite Animado".animation = "Parado"
		$"Sprite Animado".play()
		
		#Atualiza a posição do personagem
		velocity = vetor_de_movimento
		#Limita o movimento do personagem para que ele não saia da tela
		position = position.clamp(Vector2.ZERO, tamanho_da_tela)
		
		if vetor_de_movimento.x < 0:
			$"Sprite Animado".flip_h = true
			get_node("Área do Golpe/Colisão do Golpe").position[0] = -100
		elif vetor_de_movimento.x > 0:
			$"Sprite Animado".flip_h = false
			get_node("Área do Golpe/Colisão do Golpe").position[0] = 100

		move_and_slide()
	pass

func _on_área_do_golpe_body_entered(body):
	if (!body.name.begins_with("Jogador") and body.get_parent().name == "Área dos personagens"):
		alvo = body
		body.definir_vida(ataque)
		pass
	pass

func morte():
	Raiz.dialogo_está_apresentando = true
	if Raiz.número_de_conclusões == 1 or Raiz.número_de_conclusões == 2:
		get_parent().get_parent().próxima_fase = "res://Recursos/Interface de Usuário/Personagens Desbloqueados.tscn"
	else:
		get_parent().get_parent().próxima_fase = "res://Recursos/Interface de Usuário/Fim de Jogo.tscn"
	get_parent().get_parent().carregar_próxima_fase()
	pass

func obtém_tempo_de_buff():
	return $"Tempo de buff".is_stopped()
	pass

func _on_tempo_entre_ataques_timeout():
	get_node("Área do Golpe/Colisão do Golpe").disabled = true
	pass # Replace with function body.


func _on_tempo_de_buff_timeout():
	$"Estado buffado".stop()
	ataque = status.ataque
	defesa = status.defesa
	velocidade = status.velocidade
	pass # Replace with function body.

func aplica_buff():
	$"Tempo de buff".start()
	$"Estado buffado".play("Buff ativo")
	pass
