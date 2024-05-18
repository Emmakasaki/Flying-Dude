extends CharacterBody2D


const gravity = 1000
const fallSpeed = 600
const flapSpeed = -500
var flying = false
var falling = false
const startingPosition = Vector2(100, 400)

func _ready():
	reset()


func _physics_process(delta):
	if flying or falling:
		velocity.y += gravity * delta
	if velocity.y > fallSpeed:
		velocity.y = fallSpeed
	if flying:
		rotate(deg_to_rad(velocity.y * 0.05))
	elif falling:
		rotate(PI/2)
	move_and_collide(velocity*delta)



func reset():
	flying = false
	falling = false
	position = startingPosition
	rotate(0)
	
func flap():
	velocity.y = flapSpeed
