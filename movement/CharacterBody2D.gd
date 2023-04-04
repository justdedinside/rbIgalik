extends CharacterBody2D

const MAX_SPEED = 125
const ACCEL = 15000
const FRICTION = 600

var input = Vector2.ZERO

#func _process(delta):
#	var direction = Vector2(
#		Input.get_action_strength("right") - Input.get_action_strength("left"),
#		Input.get_action_strength("down") - Input.get_action_strength("up")
#	)
	
#	velocity = direction * MAX_SPEED * delta

#func _ready():
	#$AnimationPlayer.play("idle")

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()

	if input == Vector2.ZERO:
		#$AnimationPlayer.play("idle")
		if velocity.length() > (delta):
			velocity = Vector2.ZERO
			#velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		#$AnimationPlayer.play("move")
		velocity += (input * ACCEL * delta)
		velocity = velocity.limit_length(MAX_SPEED)

	move_and_slide()
