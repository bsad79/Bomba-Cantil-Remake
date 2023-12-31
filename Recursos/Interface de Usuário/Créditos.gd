extends Control

var apertou_para_sair = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Dica.text = "Pressione " + InputMap.action_get_events("Bater")[0].as_text_physical_keycode() + " para voltar"
	$"Transição".play("Aparecer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("Bater") and !apertou_para_sair:
		apertou_para_sair = true
		sair()
	pass

func sair():
	$"Transição".play_backwards("Aparecer")
	await $"Transição".animation_finished
	get_tree().change_scene_to_file("res://Recursos/Interface de Usuário/Menu_Inicial.tscn")
	pass
