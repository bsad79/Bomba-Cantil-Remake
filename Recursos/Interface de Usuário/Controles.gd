extends Control

var nome_da_ação_para_remapear = ""

var nome_ação_1 = InputMap.get_actions()[InputMap.get_actions().size() - 5]
var nome_ação_2 = InputMap.get_actions()[InputMap.get_actions().size() - 4]
var nome_ação_3 = InputMap.get_actions()[InputMap.get_actions().size() - 3]
var nome_ação_4 = InputMap.get_actions()[InputMap.get_actions().size() - 2]
var nome_ação_5 = InputMap.get_actions()[InputMap.get_actions().size() - 1]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	#obter o nome das ações
	$"Elementos de Tela/Tabela de Controles/Ações/Ação 5".text = nome_ação_5
	$"Elementos de Tela/Tabela de Controles/Ações/Ação 4".text = nome_ação_4
	$"Elementos de Tela/Tabela de Controles/Ações/Ação 3".text = nome_ação_3
	$"Elementos de Tela/Tabela de Controles/Ações/Ação 2".text = nome_ação_2
	$"Elementos de Tela/Tabela de Controles/Ações/Ação 1".text = nome_ação_1
	
	atualizar_nomes_nos_botões()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func atualizar_nomes_nos_botões():
	#obtem as teclas das ações
	$"Elementos de Tela/Tabela de Controles/Botões/Botão 5".text = InputMap.action_get_events(nome_ação_5)[0].as_text_physical_keycode()
	$"Elementos de Tela/Tabela de Controles/Botões/Botão 4".text = InputMap.action_get_events(nome_ação_4)[0].as_text_physical_keycode()
	$"Elementos de Tela/Tabela de Controles/Botões/Botão 3".text = InputMap.action_get_events(nome_ação_3)[0].as_text_physical_keycode()
	$"Elementos de Tela/Tabela de Controles/Botões/Botão 2".text = InputMap.action_get_events(nome_ação_2)[0].as_text_physical_keycode()
	$"Elementos de Tela/Tabela de Controles/Botões/Botão 1".text = InputMap.action_get_events(nome_ação_1)[0].as_text_physical_keycode()
	pass

func _on_voltar_pressed():
	Raiz.som_de_botão.play()
	Raiz.salvar_progresso()
	$"Transição".play_backwards("Aparecer")
	await $"Transição".animation_finished
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass # Replace with function body.

func _input(event):
	if (nome_da_ação_para_remapear != ""):
		$Mensagem.visible = true
		InputMap.action_erase_events(nome_da_ação_para_remapear)
		if event is InputEventKey:
			if event.as_text_physical_keycode() != "Enter":
				InputMap.action_add_event(nome_da_ação_para_remapear, event)
				nome_da_ação_para_remapear = ""
				$Mensagem.visible = false
				atualizar_nomes_nos_botões()
				pass
			pass
		#elif event is InputEventJoypadButton:
			#InputMap.action_add_event(nome_da_ação_para_remapear, event)
			#nome_da_ação_para_remapear = ""
			#$Mensagem.visible = false
			#atualizar_nomes_nos_botões()
			#pass
	pass

func _on_botão_1_pressed():
	nome_da_ação_para_remapear = nome_ação_1
	pass # Replace with function body.

func _on_botão_2_pressed():
	nome_da_ação_para_remapear = nome_ação_2
	pass # Replace with function body.


func _on_botão_3_pressed():
	nome_da_ação_para_remapear = nome_ação_3
	pass # Replace with function body.


func _on_botão_4_pressed():
	nome_da_ação_para_remapear = nome_ação_4
	pass # Replace with function body.


func _on_botão_5_pressed():
	nome_da_ação_para_remapear = nome_ação_5
	pass # Replace with function body.
