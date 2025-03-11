extends CharacterBody2D
class_name jugador
@onready var prota: AnimatedSprite2D = $AnimatedSprite2D

const gravity := 5
var dash_speed = 400
var SPEED = 150 
var dash_duration = 0.5
var cooldown = 1500
var last_dash = Time.get_ticks_msec()
var jump = 500

func _physics_process(delta: float) -> void:
	var jump = 250
	var SPEED = 150
	var direction = Input.get_axis("left", "right")

	if(is_dashing()):
		SPEED = dash_speed
		prota.play("rapidez")

	if is_on_floor() and Input.is_action_just_pressed("up"):
		velocity.y -= jump
		prota.play("saltar")
	velocity.y += gravity

	if direction:
		velocity.x = direction * SPEED
		
		if direction==1:
			prota.flip_h=false
			prota.play("correr")
		
		if direction==-1:
			prota.flip_h=true
			prota.play("correr")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		prota.play("parado")
		
	move_and_slide()


func is_dashing():
	return not $Timer.is_stopped()

func start_dash():
	var time_now = Time.get_ticks_msec()
	if (time_now - last_dash) < cooldown:
		return
	last_dash = time_now
	$Timer.wait_time = dash_duration
	$Timer.start() 

func is_jumping():
	return not $Timer.is_stopped()

func start_jump():
	var time_now = Time.get_ticks_msec()
	if (time_now - last_dash) < cooldown:
		return
	last_dash = time_now
	$Timer.wait_time = dash_duration
	$Timer.start()

func _input(event):
	if Input.is_action_just_pressed("dash"):
		start_dash()
		prota.play("rapidez")
