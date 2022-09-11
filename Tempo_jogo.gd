extends Node2D

export(int) var minuto = 2
export(int) var segundo = 60

func _process(delta: float) -> void:
	if minuto > 0 and segundo == -1:
		minuto -=1
		segundo = 59
	
	if segundo >= 10:
		$segundo.set_text(":" + str(segundo))
	else:
		$segundo.set_text(":0" + str(segundo))
		
	if minuto >= 10:
		$minuto.set_text(str(minuto))
	else:
		$minuto.set_text("0" + str(minuto))
		
	if segundo < 0:
		$Timer.stop()
		$segundo.set_text(":00")
		get_tree().paused = true
		get_tree().change_scene("res://game_over.tscn")

func _on_Timer_timeout() -> void:
	segundo -= 1
