extends Label


# action
# does the action for this option
func action():
	pass


# select
# shows the rectangle for this option
func select():
	$ReferenceRect.show()


# unselect
#hides the rectangle for this option
func unselect():
	$ReferenceRect.hide()
