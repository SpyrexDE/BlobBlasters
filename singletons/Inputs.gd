extends Node


var leftDown = false
var rightDown = false
var middleDown = false

func _input(event):
	if event.is_action_pressed("leftClick"):
		leftDown = true
	elif event.is_action_released("leftClick"):
		leftDown = false
	elif event.is_action_pressed("rightClick"):
		rightDown = true
	elif event.is_action_released("rightClick"):
		rightDown = false
	elif event.is_action_pressed("middleClick"):
		middleDown = true
	elif event.is_action_released("middleClick"):
		middleDown = false
