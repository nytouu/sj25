class_name CustomItemList
extends ItemList

var  _currentlyHoveredItemIndex: int = -1

func _gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		
		var _mousePos = event.position
		var index = get_item_at_position(_mousePos, true)
				

		if(_currentlyHoveredItemIndex != index):
			
			if(index == -1):
				_on_item_unhover(_currentlyHoveredItemIndex)
				_currentlyHoveredItemIndex = -1
			else:
				_on_item_hover(index)
				_currentlyHoveredItemIndex = index
				

func _on_item_hover(index:int):
	
	print("Just hovered item n°",index)
	
func _on_item_unhover(index:int):

	print("Just UNhovered item n°",index)
	
