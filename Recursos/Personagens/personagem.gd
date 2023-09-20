extends CharacterBody2D
class_name Personagem

@export var nome = "Fulano"
@export var velocidade = 0
@export var vida = 100
@export var defesa = 0
@export var ataque = 10
@export var pontuação = 0

var está_sofrendo_dano = false
var alvo

var tamanho_da_tela
var vetor_de_movimento

# Called when the node enters the scene tree for the first time.
func _ready():
	tamanho_da_tela = get_viewport_rect().size
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vetor_de_movimento = Vector2.ZERO
	if !Raiz.dialogo_está_apresentando:
		move_and_slide()
	pass

func inicializar(posição_inicial):
	position = posição_inicial
	$"Colisão do Corpo".disabled = false
	pass

func definir_vida(dano):
	dano = defesa - dano
	if dano < 0:
		dano *= -1
	vida -= dano
	
	if (vida <= 0):
		morte();
	
	$"Sprite Animado".animation = "Apanhando"
	$"Tempo de invencibilidade após dano".start()
	await $"Sprite Animado".animation_finished
	$"Sprite Animado".animation = "Parado"
	pass

func morte():
	queue_free()
	pass

func executar_animação_de_ataque():
	$"Sprite Animado".animation = "Batendo"
	await $"Sprite Animado".animation_finished
	$"Sprite Animado".animation = "Parado"
	pass

func _on_área_do_golpe_body_entered(body):
	pass # Replace with function body.


func _on_tempo_de_invencibilidade_após_dano_timeout():
	está_sofrendo_dano = false
	pass # Replace with function body.


func _on_área_do_golpe_body_exited(body):
	pass # Replace with function body.
