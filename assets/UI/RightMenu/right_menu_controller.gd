class_name MenuController
extends Control

@onready var right_menu: Control = $"."
@onready var option_button: OptionButton = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer/OptionButton

@onready var _date_item_list: ItemList = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer/DateItemList
@onready var _style_item_list: ItemList = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer/StyleItemList
@onready var _color_item_list: ItemList = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer/ColorItemList
@onready var _itemListContainer: VBoxContainer = $PanelContainer/VBoxContainer/TabContainer/Inventory/VBoxContainer

@export var _initialCategoryList: Array[Category]


var _itemListList : Array[ItemList]


#func _ready() -> void:

	#_addInitialItems()
		

#func _addInitialItems() ->void:
	#
	#for i in _initialCategoryList.size():
		#
		#
		#var _newItemList:ItemList = ItemList.new()
		#_newItemList.auto_height = true
		#_newItemList.auto_width = true
		#
		#for j in _initialCategoryList[i].includedTag.size():
			#_newItemList.add_item(_initialCategoryList[i].includedTag[j].name)
		#
		#
		#
		#_itemListContainer.add_child(_newItemList)
		#
		#
		#

func _on_option_button_item_selected(index: int) -> void:
	
	for i in _itemListList.size():
		
		if (i == index):
			_itemListList[i].show()
		else:
			_itemListList[i].hide()

	
	
	
