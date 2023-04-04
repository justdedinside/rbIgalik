extends CharacterBody2D
class_name Character

const FRICTION = 0.15
@export var max_speed = 5000
@export var acceleration = 100
var move_direction = Vector2.ZERO

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

func _physics_process(delta):
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) * delta

func move():
	move_direction = move_direction.normalized()
	velocity += move_direction * acceleration
	velocity = velocity.limit_length(max_speed)
	#print(velocity.length())


