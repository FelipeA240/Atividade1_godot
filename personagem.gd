extends KinematicBody2D

onready var timer := $Timer as Timer
var contador = 0
var velocity = Vector2()
var vida = 3
export(int) var speed = 200


func _ready():
	get_parent().get_node("placar").text = "Baus Coletados: " + str(contador)
	get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
			
	velocity = velocity.normalized() * speed
	return velocity
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):

	if "Bau1" in body.name:
		get_parent().get_node("Bau1").hide() 
		get_parent().get_node("Bau1/col_bau1").set_deferred("disabled", true)
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
	if "Bau2" in body.name:
		get_parent().get_node("Bau2").hide() 
		get_parent().get_node("Bau2/col_bau2").set_deferred("disabled", true)
		
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
	if "Bau3" in body.name:
		get_parent().get_node("Bau3").hide() 
		get_parent().get_node("Bau3/col_bau3").set_deferred("disabled", true)
		
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
	if "Bau4" in body.name:
		get_parent().get_node("Bau4").hide() 
		get_parent().get_node("Bau4/col_bau4").set_deferred("disabled", true)
		
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
	if "Bau5" in body.name:
		get_parent().get_node("Bau5").hide() 
		get_parent().get_node("Bau5/col_bau5").set_deferred("disabled", true)
		
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
	if "Bau6" in body.name:
		get_parent().get_node("Bau6").hide() 
		get_parent().get_node("Bau6/col_bau6").set_deferred("disabled", true)
		
		contador += 1
		get_parent().get_node("placar").text = "Baus coletados: " + str(contador)
		
		
	if "inimigos" in body.name:
		vida -=1
		get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
		
	if "Vida_extra" in body.name:
		vida +=1
		get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
		get_parent().get_node("Vida_extra").hide() 
		get_parent().get_node("Vida_extra/col_vida1").set_deferred("disabled", true)
		
	if "vida_extra2" in body.name:
		vida +=1
		get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
		get_parent().get_node("vida_extra2").hide() 
		get_parent().get_node("vida_extra2/col_vida2").set_deferred("disabled", true)
		
	if "vida_extra3" in body.name:
		vida +=1
		get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
		get_parent().get_node("vida_extra3").hide() 
		get_parent().get_node("vida_extra3/col_vida3").set_deferred("disabled", true)
		
	if "vida_extra4" in body.name:
		vida +=1
		get_parent().get_node("vida").text = "Vidas disponiveis: " + str(vida)
		get_parent().get_node("vida_extra4").hide() 
		get_parent().get_node("vida_extra4/col_vida4").set_deferred("disabled", true)


	Vitoria()
func Vitoria ():
	if contador >= 6:
		get_tree().change_scene("res://game_over.tscn")
		
	Morte()
func Morte ():
	if vida < 1:
		get_tree().change_scene("res://game_over.tscn")
		
