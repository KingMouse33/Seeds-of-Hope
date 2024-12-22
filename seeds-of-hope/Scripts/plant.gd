extends Node2D

@export var type = "" #name of plant
@export var family = "" #plant family
@export var time_to_grow = 0 #int for how much time in days it takes the plant to grow
@export var time_since_plant = 0 #int time in days since planted
@export var time_since_water = 0 #int time in days since watered, 0 means the plant has been watered today
@export var fruit = 0 #int amount of resources you get when you harvest
@export var seed_chance = 0 #percent chance to drop a seed. 100 means it will always drop 1, 200 means it will always drop 2, etc.

	
#function to give the player the fruits of their labor
func harvest():
	pass

#function that updates the plant's growth state
func update():
	pass

#function that is used when the player waters the plant
func water():
	pass
	
#function that kills the plant if it hasn't been watered for too long
func die():
	self.queue_free()
