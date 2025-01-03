extends CanvasLayer

#calling the children for easy access
@onready var timer = $Timer
@onready var label = $Label

#not sure if we'll need these but might be good to have anyways (minutes are in groups of 10 currently)
const hours_in_day = 24
const minutes_in_hour = 6
const minutes_in_day = 144

#the actual result of what the clock does
@export var current_hour = 8
@export var current_minutes = 0


#starts the timer when the clock is brought into the scene
func _ready():
	timer.start()
	label.text = (str(current_hour) + ":" + str(current_minutes) + "0")
	
#calls the tick function whenever the timer runs out. This timer is assumed to be equal to 10 minutes of in-game time.
func _on_timer_timeout():
	tick()

#updates everything that needs to be updated every 10 minutes of in game time. For now it should just be the clock.
func tick():
	current_minutes += 1
	#updates the hour if minutes = 60
	if current_minutes == minutes_in_hour:
		current_hour += 1
		current_minutes = 0
	#runs the day_tick function if a day has been completed
	if current_hour == hours_in_day:
		current_hour = 0
		day_tick()
	label.text = (str(current_hour) + ":" + str(current_minutes) + "0")
#updates everything that needs to be updated every day
func day_tick():
	pass
