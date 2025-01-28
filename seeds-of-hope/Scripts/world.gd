extends Node2D
const plant_scene = preload("res://Scenes/plant.tscn")
@onready var plant_bank = $PlantBank

var plant_dict = {
	#plant : [family(str),time_to_grow,fruit,seed_chance]
	"potato" : ["underground",2,4,230]
}

#ready function to test if the potato is planted
func _ready():
	plant("potato")
	plant("potato")
	plant("potato")
	for i in plant_bank.get_children():
		print(i.type)
	print(plant_bank.get_children())
	
#function to assign the plant instance all of its correct variables
func plant(type):
	#take the name of the plant and pass it through plant_dict, assigning all of the correct values.
	var plant_values = plant_dict[type]
	#create an instance of the plant scene with the assigned parameters, stored in PlantBank
	var new_plant = plant_scene.instantiate()
	new_plant.type = type
	new_plant.family = plant_values[0]
	new_plant.time_to_grow = plant_values[1]
	new_plant.fruit = plant_values[2]
	new_plant.seed_chance = plant_values[3]
	plant_bank.add_child(new_plant) #adds the plant to plant_bank
	
