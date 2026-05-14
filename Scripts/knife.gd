extends Area2D

var KnifeSpeed=120
var thrown=false
var KnifeDirection=1
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
	
func throw(Direction):
	thrown=true
	KnifeDirection=Direction

func _process(delta: float) -> void:
	if thrown==true:
		position.x+=KnifeSpeed*KnifeDirection*delta
		rotation+=10*delta


	
func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.get_parent().queue_free()
