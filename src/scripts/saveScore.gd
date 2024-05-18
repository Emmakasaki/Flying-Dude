extends Node

const saveFile = "user://highScore.save"

var highestScore = 0

func _ready():
	loadScore()

func saveScore():
	var file = FileAccess.open(saveFile, FileAccess.WRITE_READ)
	file.store_32(highestScore)
	file = null
	
func loadScore():
	var file = FileAccess.open(saveFile, FileAccess.READ)
	if FileAccess.file_exists(saveFile):
		highestScore = file.get_32()
