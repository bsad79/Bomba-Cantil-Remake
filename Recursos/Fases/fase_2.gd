extends Fase

# Called when the node enters the scene tree for the first time.
func _ready():
	Raiz.música_padrão.stop()
	Raiz.música_para_chefes.play()
	super._ready()
	adicionar_interface_do_jogo()
	próxima_fase = "res://Recursos/Fases/fase_3.tscn"
	pass # Replace with function body.

func roda_a_vinheta():
	$Control.visible = true
	$Control/AnimationPlayer.play("Intro")
	await $Control/AnimationPlayer.animation_finished
	$Control.visible = false
	$"Control/Imagem da intro".z_index = 0
	Raiz.dialogo_está_apresentando = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	pass
