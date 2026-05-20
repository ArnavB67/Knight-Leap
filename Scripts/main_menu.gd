extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var level_menu: Panel = $LevelMenu
@onready var settings: VBoxContainer = $OptionsMenu/ScrollContainer/Settings
@onready var options_menu: Panel = $OptionsMenu
var musicbus
var sfxbus
var resolutions = [
	[1280, 720],
	[1366, 768],
	[1600, 900],
	[1920, 1080],
	[2560, 1440],
	[3840, 2160]
]
func _ready() -> void:
	v_box_container.visible=true
	level_menu.visible=false
	options_menu.visible=false
	musicbus=AudioServer.get_bus_index(&"Music")
	sfxbus=AudioServer.get_bus_index(&"Sfx")

func _on_start_pressed() -> void:
	v_box_container.visible=false
	level_menu.visible=true


func _on_options_pressed() -> void:
	options_menu.visible=true
	v_box_container.visible=false



func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/LEVELS/Level_1.tscn")

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(musicbus,linear_to_db(value))

func _on_h_slider_2_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfxbus,linear_to_db(value))


func _on_option_button_item_selected(index: int) -> void:
	print(index)
	DisplayServer.window_set_size(Vector2i(resolutions[index][0],resolutions[index][1]))
	get_tree().root.content_scale_size = Vector2i(resolutions[index][0],resolutions[index][1])
	


func _on_back_pressed() -> void:
	options_menu.visible=false
	v_box_container.visible=true
	
