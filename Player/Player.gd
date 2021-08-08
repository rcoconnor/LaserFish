extends KinematicBody2D

export var speed = 10

var velocity = Vector2.ZERO

export (PackedScene) var bullet

var cooldown = 0.1
var cooldown_timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown_timer > 0.0:
		cooldown_timer -= delta
	if Input.is_action_pressed("fire") and cooldown_timer <= 0:
		var bullet_instance = bullet.instance()
		get_parent().add_child(bullet_instance)
		bullet_instance.position = position
		cooldown_timer = cooldown

func _physics_process(_delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	velocity = move_and_slide(velocity, Vector2.UP)
