extends Area2D
@onready var timer: Timer = $Timer




func _on_body_entered(body: Node2D) -> void:
	Global.Health-=1
	if Global.enemy_killed==true:
		return
	if Global.Health==0:
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale=0.5
		body.velocity.y =-200
		body.move_and_slide()
		timer.start()
	if Global.checkpoint!=null:
		print(Global.checkpoint)
		body.position=Global.checkpoint



func _on_timer_timeout() -> void:
	Engine.time_scale=1
	get_tree().reload_current_scene()
