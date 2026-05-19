extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var level_menu: Panel = $LevelMenu


func _ready() -> void:
	v_box_container.visible=true
	level_menu.visible=false

func _on_start_pressed() -> void:
	v_box_container.visible=false
	level_menu.visible=true


func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/LEVELS/Level_1.tscn")
