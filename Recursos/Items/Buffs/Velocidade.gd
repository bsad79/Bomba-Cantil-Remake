extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_área_de_colsão_body_entered(body):
	if body.name.begins_with("Jogador"):
		if body.obtém_tempo_de_buff:
			body.velocidade += 100
			body.aplica_buff()
		queue_free()
	pass # Replace with function body.
