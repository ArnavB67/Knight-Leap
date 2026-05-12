extends CharacterBody2D

const RollingSpeed=300
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
var direction=1
var LastLeft=0
var LastRight=0
var rolling = false
var rollingDir=1
func StartRoll(dir,delta):
	if rolling: return
	rolling = true
	animated_sprite_2d.flip_h = dir == -1
	animated_sprite_2d.play(&"Roll")
	timer.start()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if rolling:
		velocity.x=RollingSpeed*rollingDir
	# Handle jump.
	if Input.is_action_just_pressed(&"Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(&"Left", &"Right")
	if Input.is_action_just_pressed("Left"):
		if Time.get_ticks_msec() - LastLeft < 300:
			StartRoll(-1,delta)
			rollingDir=-1
		LastLeft = Time.get_ticks_msec()

	if Input.is_action_just_pressed("Right"):
		if Time.get_ticks_msec() - LastRight < 300:
			StartRoll(1,delta)
			rollingDir=1
		LastRight = Time.get_ticks_msec()
		
	if not rolling:
		if direction > 0:
			animated_sprite_2d.flip_h = false
		elif direction < 0:
			animated_sprite_2d.flip_h = true
		if is_on_floor():
			if direction==0:
				animated_sprite_2d.play(&"Idle")
			else:
				animated_sprite_2d.play(&"Run")
		else:
			animated_sprite_2d.play(&"Jump")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()





func _on_timer_timeout() -> void:
	rolling=false
