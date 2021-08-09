extends KinematicBody2D

class_name Enemy

var Bullet
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO

# The list of the possible directions
var directions = [Vector2.UP, Vector2.LEFT, Vector2.DOWN, Vector2.RIGHT]
var cur_index = 0

export var speed = 300

signal hit_wall

# Called when the node enters the scene tree for the first time.
func _ready():
	Bullet = load("res://Bullet/Bullet.gd")
	var cur_direction = directions[0]
	print("cur_direction: ", cur_direction)
	pass # Replace with function body.


func _physics_process(_delta):
	velocity.x = directions[cur_index].x * speed
	velocity.y = directions[cur_index].y * speed
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_area_entered(area):
	if (area.get_parent() is Bullet):
		area.get_parent().queue_free()
		# FIXME: should play death animation
		queue_free()
	if area.get_name() == "TopWall" or area.get_name() == "BottomWall":
		emit_signal("hit_wall")

func _change_direction():
	cur_index += 1
	if (cur_index >= 4): cur_index = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
