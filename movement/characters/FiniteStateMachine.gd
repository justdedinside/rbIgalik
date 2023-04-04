extends FiniteStateMachine

func _init():
	_add_state("idle")
	_add_state("move")
	_add_state("dash")

func _ready():
	set_state(states.idle)

func _state_logic(_delta):
	parent.get_input()
	parent.move()
	#parent.dash()

func _get_transition():
	match state:
		states.idle:
			#if parent.move_direction > 0:
			if parent.velocity.length() > 10:
				return states.move
			if parent.dashing:
				print("daaaaaaaaaaaash")
				return states.dash
		states.move:
			#if parent.move_direction <= 0:
			if parent.velocity.length() < 10:
				return states.idle
			if parent.dashing:
				print("daaaaaaaaaaaash")
				return states.dash
		states.dash:
			if parent.velocity.length() > 10:
				return states.move
			if parent.velocity.length() < 10:
				return states.idle
		
	return -1

func _enter_state(_previous_state, new_state):
	match new_state:
		states.idle:
			animation_player.play("idle")
		states.move:
			animation_player.play("move")
