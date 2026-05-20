extends Node
var enemy_killed = false
var KnifeCount=0
var Health=5
var checkpoint
var score=0
var current_level=1
var TotalLvl=2
var LevelPath="res://Scenes/LEVELS/"



func Reset():
	enemy_killed = false
	KnifeCount=0
	Health=5
	checkpoint
	score=0


func NextLevel():
	if current_level!=TotalLvl:
		Reset()
		current_level+=1
		var FinalPath=LevelPath+"Level_"+str(current_level)+".tscn"
		get_tree().change_scene_to_file(FinalPath)
	else:
		Reset()
		current_level=0
		get_tree().change_scene_to_file("res://Scenes/FinishedGame.tscn")
