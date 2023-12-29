class_name Queue

var head
var tail

# constructor from array
func _init(arr):
	var current = QNode.new(arr[0])
	head = current
	for i in range(1, len(arr)):
		var next_qnode = QNode.new(arr[i])
		current.set_next(next_qnode)
		current = next_qnode
	
	tail = current


# top: -> any
# gets the first element in the queue
func top():
	return head.get_value() 


# pop: -> any
# removes the first element and returns its value
func pop():
	var aux = head.get_value()
	head = head.get_next()
	if head == null:
		tail == null
	
	return aux

# push: any
# pushes an element in the array
func push(e):
	var new_qnode = QNode.new(e)
	if head == null:
		head = new_qnode
		tail = new_qnode
	
	else:
		tail.set_next(new_qnode)
		tail = new_qnode


# is_empty: -> bool
# checks if the queue is empty
func is_empty():
	return head == null

class QNode:
	var value
	var next : QNode
	
	# constructor
	func _init(val):
		val = value
		next = null
	
	# setters
	func set_next(next_node):
		next = next_node
	
	# getters
	func get_next():
		return next
	
	func get_value():
		return value
