extends Fase

@export var cena_do_inimigo1 : PackedScene
@export var cena_do_inimigo2 : PackedScene
@export var cena_do_inimigo3 : PackedScene
@export var cena_do_inimigo4 : PackedScene
@export var cena_do_inimigo5 : PackedScene
@export var cena_do_inimigo6 : PackedScene

var final_bom
var fase_encerrada = false
var tem_inimigos = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Raiz.música_para_chefes.stop()
	Raiz.música_padrão.play()
	final_bom = false
	super._ready()
	adicionar_interface_do_jogo()
	próxima_fase = "res://Recursos/Fases/fase_3.tscn"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	tem_inimigos = false
	for i in get_node("Área dos personagens").get_child_count() - 1:
		if get_node("Área dos personagens").get_child(i).name.begins_with("Inimigo"):
			tem_inimigos = true
		pass
	if !tem_inimigos and !fase_encerrada:
		fase_encerrada = true
		termina_fase()
	pass

func _on_intervalo_para_o_spawn_de_inimigos_timeout():
	if final_bom:
		var local_de_spawn = get_node("Área dos personagens/Rota de spawn dos inimigos/PathFollow2D")
		local_de_spawn.progress_ratio = randf()
		
		var inimigo
		match (randi_range(1, 7)):
			0:
				inimigo = cena_do_inimigo1.instantiate()
			1:
				inimigo = cena_do_inimigo1.instantiate()
			2:
				inimigo = cena_do_inimigo2.instantiate()
			3:
				inimigo = cena_do_inimigo3.instantiate()
			4:
				inimigo = cena_do_inimigo4.instantiate()
			5:
				inimigo = cena_do_inimigo5.instantiate()
			6:
				inimigo = cena_do_inimigo6.instantiate()
			7:
				inimigo = cena_do_inimigo6.instantiate()
		
		inimigo.position[0] = local_de_spawn.position[0]
		inimigo.position[1] = local_de_spawn.position[1]
		inimigo.scale = Vector2(0.5, 0.5)
		
		if get_node("Área dos personagens").get_child_count() <= 50:
			get_node("Área dos personagens").add_child(inimigo)
		iniciar_crônometro_de_spawn()
	pass # Replace with function body.

func iniciar_crônometro_de_spawn():
	$"Área dos personagens/Intervalo para o spawn de inimigos".start()
	pass
