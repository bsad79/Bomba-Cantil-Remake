extends Node

var fala
var dialogo_selecionado
var etapa_do_dialogo
var última_fala

# Called when the node enters the scene tree for the first time.
func _ready():
	última_fala = false
	$"Tempo de transição".start()
	$"Borda/Caixa de texto/Botões".visible = false
	$"Borda/Caixa de texto/Botões/Aceita".disabled = true
	$"Borda/Caixa de texto/Botões/Recusa".disabled = true
	fala = 0
	dialogo_selecionado = 0
	etapa_do_dialogo = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  $"Tempo de transição".is_stopped():
		if Input.is_action_just_released("Bater"):
			Raiz.som_de_botão.play()
			fala += 1
			atualiza_texto()
	pass

func atualiza_texto():
	Raiz.dialogo_está_apresentando = true
	#print("fala: ", fala, " | dialogo_selecionado: ", dialogo_selecionado, " | etapa_do_dialogo: ", etapa_do_dialogo)
	match (dialogo_selecionado):
		-1:
			print("Erro")
		0:
			dialogo_portaria(etapa_do_dialogo)
		1:
			dialogo_pa(etapa_do_dialogo)
		2:
			dialogo_bandeco(etapa_do_dialogo)
		3:
			dialogo_final_ruim()
		4:
			dialogo_final_bom()
		5:
			queue_free()
			if (get_parent().name == "Fase 1" or get_parent().name == "Fase 2") and etapa_do_dialogo == 0:
				get_parent().roda_a_vinheta()
			else:
				Raiz.dialogo_está_apresentando = false
	pass

func dialogo_portaria(etapa):
	match (etapa):
		0:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "Nossa, a ft parece meio estranha hoje... O que será que está acontecendo?"
				1:
					$"Borda/Caixa de texto/Texto".text = "Oh meu Deus! O Angeli está sendo levado pelo Kotil!"
				2:
					$"Borda/Caixa de texto/Texto".text = "O que eles pensam que estão fazendo?"
					dialogo_selecionado = 5
					$"Tempo de transição".start()
		1:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "O que foi isso? O que será que o Kotil fez com ele?"
				1:
					$"Borda/Caixa de texto/Texto".text = "Perai, aquele é o Zambo? O que o Kotil está fazendo? Preciso impedi-los!"
					dialogo_selecionado = 5
					$"Tempo de transição".start()
					última_fala = true
	pass

func dialogo_pa(etapa):
	match (etapa):
		0:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "o que é isso?"
				1:
					$"Borda/Caixa de texto/Texto".text = "OH NÃO, ZAMBÕES!!!!"
					dialogo_selecionado = 5
					$"Tempo de transição".start()
		1:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "Ufa, essa foi por pouco!"
				1:
					$"Borda/Caixa de texto/Texto".text = "Preciso ir atrás do Kotil para que eles parem com seja lá o que eles tiverem fazendo!"
				2:
					$"Borda/Caixa de texto/Texto".text = "Eles seguiram em direção ao bandeco, rápido! Vou pegar meu RA!"
					dialogo_selecionado = 5
					$"Tempo de transição".start()
					última_fala = true
	pass

func dialogo_bandeco(etapa):
	match (etapa):
		0:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "Ufa, depois de muito sufoco a máquina aceitou meu dinheiro"
				1:
					$"Borda/Caixa de texto/Texto".text = "Ah é, já estava quase me esquecendo"
				2:
					$"Borda/Caixa de texto/Texto".text = "EI, KOTIL, O QUE VOCÊS PENSAM QUE ESTÃO FAZENDO?"
				3:
					$"Borda/Caixa de texto/Texto".text = "ROUBARAM NOSSO BANDECO E AGORA QUEREM ROUBAR NOSSOS PROFESSORES?"
				4:
					$"Borda/Caixa de texto/Texto".text = "GUERRA DE COMIDAAAAA"
					dialogo_selecionado = 5
					$"Tempo de transição".start()
		1:
			match (fala):
				0:
					$"Borda/Caixa de texto/Texto".text = "Isso não pode ficar assim, eu tenho que fazer algo!"
				1:
					$"Borda/Caixa de texto/Texto".text = "Devo explodir o Kotil?"
					$"Borda/Caixa de texto/Botões".visible = true
					$"Borda/Caixa de texto/Botões/Aceita".disabled = false
					$"Borda/Caixa de texto/Botões/Recusa".disabled = false
	pass

func dialogo_final_ruim():
	match (fala):
		0:
			$"Borda/Caixa de texto/Texto".text = "Você é... maluco?"
		1:
			$"Borda/Caixa de texto/Texto".text = "Você decidiu explodir... crianças? Crianças que estavam em busca de alimentação e educação? Esses são seus ideais?"
		2:
			$"Borda/Caixa de texto/Texto".text = "Você vai viver com esse peso na consciência. pra sempre... ou não"
			dialogo_selecionado = 5
			$"Tempo de transição".start()
			última_fala = true
	pass

func dialogo_final_bom():
	match (fala):
		0:
			$"Borda/Caixa de texto/Texto".text = "Você resolve ser sensato e não explodir várias crianças porém, elas não tem o mesmo senso que você mesmo lutando, eventualmente, eles, que são em muitos, acabam ganhando vantagem o que está acontecendo?"
		1:
			$"Borda/Caixa de texto/Texto".text = "Por que eles estão fazendo isso? Você não sabe, você só sabe que agora a ft está em chamas."
		2:
			$"Borda/Caixa de texto/Texto".text = "Eles ganharam. Vocês perderam"
			dialogo_selecionado = 5
			$"Tempo de transição".start()
			get_parent().final_bom = true
			get_parent().get_node("Animação de fogo").play("FT em chamas")
			get_parent().iniciar_crônometro_de_spawn()
			Raiz.música_padrão.stop()
			Raiz.música_para_chefes.play()
	pass

func definir_dialogo_selecionado(dialogo_desejado):
	dialogo_selecionado = dialogo_desejado
	pass

func definir_etapa_do_dialogo(etapa_desejada):
	etapa_do_dialogo = etapa_desejada
	pass

func _on_aceita_pressed():
	Raiz.som_de_botão.play()
	dialogo_selecionado = 3
	$"Borda/Caixa de texto/Botões".visible = false
	$"Borda/Caixa de texto/Botões/Aceita".disabled = true
	$"Borda/Caixa de texto/Botões/Recusa".disabled = true
	dialogo_final_ruim()
	pass # Replace with function body.

func _on_recusa_pressed():
	Raiz.som_de_botão.play()
	dialogo_selecionado = 4
	$"Borda/Caixa de texto/Botões".visible = false
	$"Borda/Caixa de texto/Botões/Aceita".disabled = true
	$"Borda/Caixa de texto/Botões/Recusa".disabled = true
	dialogo_final_bom()
	pass # Replace with function body.



func _on_tempo_de_transição_timeout():
	if (get_parent().name == "Fase 3" and última_fala):
		if (get_parent().final_bom == false):
			get_parent().get_node("Área dos personagens/Jogador").morte()
	elif (última_fala):
		get_parent().carregar_próxima_fase()
		última_fala = false
	pass # Replace with function body.
