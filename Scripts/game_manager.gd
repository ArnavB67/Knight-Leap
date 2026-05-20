extends Node

@onready var label_10: Label = $"../Labels/Label10"
@onready var knife_count: Label = $"../Canvas/Knife/KnifeCount"

func _process(delta: float) -> void:
	$"../Canvas/Score".text=str(Global.score)
	knife_count.text="x "+str(Global.KnifeCount)
