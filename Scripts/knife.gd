extends Area2D

var KnifeSpeed=60

func drop():
	var Material = ShaderMaterial.new()
	Material.shader=preload("res://Scenes/knife.gdshader")
	$Sprite2D.material = Material


func pick_up():
	$Sprite2D.material = null

func _on_body_entered(body: Node2D) -> void:
	Global.KnifeCount+=1
	queue_free()
	pick_up()


func _process(delta: float) -> void:
	if Global.thrown==true:
		position.x+=KnifeSpeed*Global.KnifeDirection*delta
		rotation+=10*delta
