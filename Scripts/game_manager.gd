extends Node

@onready var label_10: Label = $"../Labels/Label10"

func _process(delta: float) -> void:
	$"../Canvas/Score".text=str(Global.score)
