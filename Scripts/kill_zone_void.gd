extends Area2D
@onready var timer: Timer = $Timer
@onready var h_box_container: HBoxContainer = $"../Canvas/HBoxContainer"

func _on_body_entered(body: Node2D) -> void:

	if Global.Health==1:
		var RemoveHealth= h_box_container.get_node("TextureRect0")
		RemoveHealth.queue_free()
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale=0.5
		body.velocity.y =-200
		body.move_and_slide()
		body.get_node("Hurt").play()
		timer.start()
	else:
		Global.Health-=1
		body.get_node("Hurt").play()
		var RemoveHealth= h_box_container.get_node("TextureRect"+str(Global.Health))
		RemoveHealth.queue_free()
		if Global.checkpoint!=null:
			body.position=Global.checkpoint


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Global.Reset()
	Engine.time_scale=1
