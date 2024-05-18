extends Node

@export var pipeScene: PackedScene
var gameRunning
var gameOver
var scroll
var score: int
var highScore: int
const scrollSpeed = 4
var screenSize
var groundHeight
var pipes: Array
const pipeDelay = 100
const pipeRange = 200



func _ready():
	screenSize = get_window().size
	groundHeight = $Ground.get_node("Sprite2D").texture.get_height()
	newGame()
	
func _process(delta):
	if gameRunning:
		scroll += scrollSpeed
		if scroll >= screenSize.x:
			scroll = 0
		$Ground.position.x = -scroll
		for pipe in pipes:
			pipe.position.x -= scrollSpeed

func _input(event):
	if !gameOver:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if !gameRunning:
					startGame()
				else:
					if $Player.flying:
						$Player.flap()
						checkTop()

func newGame():
	gameRunning = false
	gameOver = false
	score = 0
	scroll = 0
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()
	generatePipes()
	$Player.reset()
	$Button.hide()
	$HighScore.hide()
	$ScoreLabel2.hide()
	score = 0
	$ScoreLabel.text = "Score: " + str(score)


func startGame():
	gameRunning = true
	$Player.flying = true
	$Player.flap()
	$PipeTimer.start()

func stopGame():
	if score > SaveScore.highestScore:
		SaveScore.highestScore = score
		$HighScore.text = "High Score: " + str(SaveScore.highestScore)
	$HighScore.text = "High Score: " + str(SaveScore.highestScore)
	$ScoreLabel2.text = "Score: " + str(score)
	$PipeTimer.stop()
	$Player.flying = false
	gameRunning = false
	gameOver = true
	$HighScore.show()
	$ScoreLabel2.show()
	$Button.show()
	SaveScore.saveScore()

func checkTop():
	if $Player.position.y < 0:
		$Player.falling = true
		stopGame()

func _on_pipe_timer_timeout():
	generatePipes()
	
func generatePipes():
	var pipe = pipeScene.instantiate()
	pipe.position.x = screenSize.x + pipeDelay
	pipe.position.y = (screenSize.y - groundHeight) / 2 + randi_range(-pipeRange, pipeRange)
	pipe.hit.connect(birdHit)
	pipe.scored.connect(scored)
	add_child(pipe)
	pipes.append(pipe)
	
func birdHit():
	$Player.falling = true
	stopGame()

func scored():
	score += 1
	$ScoreLabel.text = "Score: " + str(score)

func _on_ground_hit():
	$Player.falling = false
	stopGame()


func _on_button_pressed():
	newGame()
	
