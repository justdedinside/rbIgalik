extends Character

var can_dash = true
var dashing = false

func _process(_delta):
	var mouse_direction = (get_global_mouse_position() - global_position).normalized()
	if mouse_direction.x > 0 && animated_sprite.flip_h:
		animated_sprite.flip_h = false
	else:
		if mouse_direction.x < 0 && !animated_sprite.flip_h:
			animated_sprite.flip_h = true
	print(acceleration)

func get_input():
	move_direction = Vector2.ZERO
	move_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if Input.is_action_just_pressed("Dash") && can_dash:
		dash()

func dash():
		dashing = true
		#$AnimationPlayer.play("dash")
		$AnimatedSprite2D.animation = "dash"
		acceleration = 300
		can_dash = false
		$Dash.start()
		$DashCooldown.start()
	

func _on_dash_timeout():
	acceleration = 100


func _on_dash_cooldown_timeout():
	can_dash = true
	dashing = false
