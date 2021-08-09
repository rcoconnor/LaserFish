extends Node2D

class_name EnemyController

# Enemy Controller class
export var cooldown = 5.0


# Vectors containing the four directions the enemies will move



func _ready():
	for i in range(get_child_count()):
		if "Enemy" in get_child(i).get_name():
			var _val = get_child(i).connect("hit_wall", self, "_on_wall_entered")

func _on_wall_entered():
	for each_child in get_children():
		each_child._change_direction()

func _process(delta):
	# subtract the time delta from cooldown
	cooldown -= delta
	if(cooldown <= 0):
		cooldown = 5.0
		print("cooldown refresh")
