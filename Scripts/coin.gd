extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Global.score+=5
	queue_free()
