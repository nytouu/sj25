class_name GlobalManager
extends Node

@export var GlobalCategoryArray: Array[Category]

@export var PlayerInventory: Array[Artwork]

var InitialData:GlobalManagerInitialData = load("res://resources/data/GlobalInitalData.tres")

func _ready() -> void:
	PlayerInventory = InitialData.InitialInventory
	print("Global Manager loaded")
	

func GetTagCategory(t: Tag) -> Category:
	
	for c in GlobalCategoryArray:
		
		for it in c.includedTag:
			
			if(it == t): return c
	
	push_error("No category found for tag", t)
	return null
	
	
