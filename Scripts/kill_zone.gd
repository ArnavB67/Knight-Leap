extends Area2D
@onready var timer: Timer = $Timer




func _on_body_entered(body: Node2D) -> void:
	if Global.enemy_killed==true:
		return
	timer.start()
	Engine.time_scale=0.5
	print("Player death triggered")
	body.get_node("CollisionShape2D").queue_free()
	body.velocity.y =-200
	body.move_and_slide()
	

func _on_timer_timeout() -> void:
	Engine.time_scale=1
	get_tree().reload_current_scene()
