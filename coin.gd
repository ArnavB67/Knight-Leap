extends Area2D

func _on_area_entered(area: Area2D) -> void:
	print("coin collected +1")
	queue_free()
