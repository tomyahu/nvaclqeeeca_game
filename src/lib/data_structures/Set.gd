class_name Set

var elements = {}

# insert: any
# inserts an element in the set
func insert(e):
	elements[e] = e


# erase: any
# erases the element from the set
func erase(e):
	elements.erase(e)


# has: any -> bool
# checks if the set has an element
func has(e):
	return elements.has(e)


# size: -> int
# returns the number of elements in the set
func size():
	return elements.size()


# is_empty: -> bool
# checks if the set is empty
func is_empty():
	return elements.is_empty()


# clear
# clears the elements in the set
func clear():
	elements.clear
