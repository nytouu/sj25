class_name CustomItemList
extends ItemList

var  _currentlyHoveredItemIndex: int = -1

@export var _tooltip_window: TooltipWindow 
@export var _menu_controller: MenuController

func _ready() -> void:
	
	self.connect("mouse_exited",Callable(self, "_on_mouse_exited"))

func _gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		
		var _mousePos = event.position
		var index = get_item_at_position(_mousePos, true)
				

		if(_currentlyHoveredItemIndex != index):
			
			_on_item_unhover(_currentlyHoveredItemIndex)
			if(index == -1):
				_currentlyHoveredItemIndex = -1
			else:
				_on_item_hover(index)
				_currentlyHoveredItemIndex = index
				

func _on_item_hover(index:int):
	
	
	_tooltip_window.rich_text_label.text = _menu_controller.ArtworkList[index].description
	_tooltip_window.show()
	
func _on_item_unhover(index:int):

	print("Just UNhovered item n°",index)
	_tooltip_window.hide()
	
	
func _on_mouse_exited():
	
	_on_item_unhover(_currentlyHoveredItemIndex)
	_currentlyHoveredItemIndex = -1
