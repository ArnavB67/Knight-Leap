extends Node2D

const speed=60
var direction = 1
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var killed = false
var killing_player = false
var KnifeScene=preload("res://Scenes/knife.tscn")


func _process(delta: float) -> void:
	if ray_cast_2d_right.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=true
		
	if ray_cast_2d_left.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=false
	position.x+=speed*delta*direction


func _on_killable_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	$KillZoneEnemy/CollisionShape2D.disabled=true
	if killed:
		return
	killed=true
	Global.enemy_killed=true
	queue_free()
	body.velocity.y=-200
	body.move_and_slide()
	body.get_node("Jump").play()
	var knife=KnifeScene.instantiate()
	knife.position=global_position
	knife.position.x+=15
	get_parent().add_child(knife)
	knife.drop()
	await get_tree().create_timer(0.1).timeout
	Global.enemy_killed = false  
	
	
	
