class_name MenuController
extends Control

@onready var right_menu: Control = $"."
@onready var _option_button: OptionButton = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer/OptionButton

@onready var _itemListContainer: VBoxContainer = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer

@onready var art_item_list: ItemList = $PanelContainer/VBoxContainer/TabContainer/Inventory/ArtItemList

@export var _initialCategoryList: Array[Category]
@export var _categoryList: Array[Category]

@export var _selectedCategory: Category = null
@export var _selectedTag:Tag = null


var _itemListList : Array[ItemList]


func _ready() -> void:

	_addInitialItems()
	

# needs to be refacored for clarity
func _addInitialItems():
	
	_option_button.add_item("ALL",0)
	
	
	
	for c in _initialCategoryList:
		
		
		
		var i: ItemList = ItemList.new()
		i.auto_height = true
		i.auto_width = true
		
		for t in c.includedTag:
			
			i.add_item(t.name, null, true)
			
		_itemListContainer.add_child(i)
		_itemListList.append(i)
		
		i.hide()
		
		_categoryList.append(c)
			
		
		_option_button.add_item(c.name, _categoryList.size()-1)
		i.connect("item_selected", Callable(self, "_on_item_list_item_selected").bind(i, c))
		
		_update_art_item_list()



func _on_option_button_item_selected(index: int) -> void:
	
	
		
	
	for i in _itemListList.size():
		
		if (i == index-1):
			_itemListList[i].show()
		else:
			_itemListList[i].hide()
	
	if(index == 0):
		_selectedTag = null
		_selectedCategory = null
	else:
		_selectedCategory = _categoryList[index-1]
		_selectedTag = _selectedCategory.includedTag[0]
		_itemListList[index-1].select(0)
		
	_update_art_item_list()

func _on_item_list_item_selected(index: int,itemList: ItemList ,category: Category):
	
	
	print(category.includedTag[index].name," from category ",category.name)
	_selectedTag= category.includedTag[index]
	_update_art_item_list()
	
func _update_art_item_list():
	
	art_item_list.clear()
	
	for a in GlobalManagerInstance.PlayerInventory:
		
		for t in a.tags:
			
			if(t == _selectedTag || _selectedTag == null):
				art_item_list.add_icon_item(a.texture)
				
				break
	
