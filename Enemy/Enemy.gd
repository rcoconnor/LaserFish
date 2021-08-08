extends KinematicBody2D

class_name Enemy

var Bullet
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Bullet = load("res://Bullet/Bullet.gd")
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if (area.get_parent() is Bullet):
		area.get_parent().queue_free()
		# FIXME: should play death animation
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
