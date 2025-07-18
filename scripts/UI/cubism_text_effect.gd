@tool
extends RichTextEffect
class_name RichTextCubism


var bbcode = "cubism"


func _process_custom_fx(char_fx):
	
	var _max_offset = char_fx.env.get("maw_offset", 4)
	
	
	var x_offset = 0#(sin(char_fx.glyph_index*1))*_max_offset
	var y_offset = (sin(char_fx.glyph_index*40))*_max_offset
	
	
	char_fx.offset = Vector2(x_offset,y_offset)
	return true
