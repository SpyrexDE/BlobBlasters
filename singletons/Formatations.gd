extends Node

var unitCount
var unitID
var unitGroupPos
var spacing = Vector2(50.0, 50.0)
var width
var row = 0
var col = -1

func _unhandled_key_input(event):
	if Globals.selection.size() > 0:
		unitID = 0
		unitCount = Globals.selection.size()
		unitGroupPos = Globals.selection[0].collider.groupPos
		
		if event.is_action_pressed("Formatation1"):
			for unit in Globals.selection:
				unitID += 1
				unit.collider.formatting = true
				unit.collider.target = getUnitPos(unitID)
		resetVars()


func getUnitPos(unitID):
	width = int(sqrt(float(unitCount)))
	if(col + 1 >= width):
		row += 1
		col = 0
	else:
		col += 1
	var unitPos = Vector2(float(col), float(row))
	
	return unitPos * spacing + unitGroupPos

func resetVars():
	row = 0
	col = -1
