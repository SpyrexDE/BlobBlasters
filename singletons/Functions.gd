extends Node


func posAverage(nodes):
	var average = nodes[0].collider.position
	for count in nodes.size():
		if count > 0:
			average = (average + nodes[count].collider.position) / 2
	return average
