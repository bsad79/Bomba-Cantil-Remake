extends Node2D

func _on_área_de_colsão_body_entered(body):
	if body.name.begins_with("Jogador"):
		if body.vida <= 80 and body.obtém_tempo_de_buff:
			body.vida += 20
			body.aplica_buff()
		queue_free()
	pass # Replace with function body.
