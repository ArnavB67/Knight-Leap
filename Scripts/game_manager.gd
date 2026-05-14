extends Node

@onready var label_10: Label = $"../Labels/Label10"

func _process(delta: float) -> void:
	label_10.text="CONGRATS! You Have completed The Tutorial with a Score of "+str(Global.score)
