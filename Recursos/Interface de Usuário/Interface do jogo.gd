extends Control

var fase

# Called when the node enters the scene tree for the first time.
func _ready():
	fase = get_parent().get_node("Área dos personagens")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (fase.get_node("Jogador") != null):
		obter_nome_do_jogador()
		obter_pontuação()
		atualizar_barra_de_vida_do_jogador()
		if (fase.get_node("Jogador").alvo != null):
			obter_nome_do_inimigo()
			atualizar_barra_de_vida_do_inimigo()
		else:
			get_node("GridContainer/Nomes/Nome do Inimigo").visible = false
			get_node("GridContainer/Barras de vida/Vida do Inimigo").visible = false
	else:
		get_node("GridContainer/Nomes/Jogador/Nome do Jogador").visible = false
		get_node("GridContainer/Nomes/Jogador/Pontuação do Jogador").visible = false
		get_node("GridContainer/Barras de vida/Vida do Jogador").visible = false
	
	pass

func obter_nome_do_jogador():
	get_node("GridContainer/Nomes/Jogador/Nome do Jogador").visible = true
	get_node("GridContainer/Nomes/Jogador/Nome do Jogador").text = fase.get_node("Jogador").nome
	pass

func obter_pontuação():
	get_node("GridContainer/Nomes/Jogador/Pontuação do Jogador").visible = true
	get_node("GridContainer/Nomes/Jogador/Pontuação do Jogador").text = str(fase.get_node("Jogador").pontuação)
	pass

func obter_nome_do_inimigo():
	get_node("GridContainer/Nomes/Nome do Inimigo").visible = true
	get_node("GridContainer/Nomes/Nome do Inimigo").text = fase.get_node("Jogador").alvo.nome
	pass

func atualizar_barra_de_vida_do_jogador():
	get_node("GridContainer/Barras de vida/Vida do Jogador").visible = true
	get_node("GridContainer/Barras de vida/Vida do Jogador").value = fase.get_node("Jogador").vida
	pass

func atualizar_barra_de_vida_do_inimigo():
	get_node("GridContainer/Barras de vida/Vida do Inimigo").visible = true
	get_node("GridContainer/Barras de vida/Vida do Inimigo").value = fase.get_node("Jogador").alvo.vida
	pass
