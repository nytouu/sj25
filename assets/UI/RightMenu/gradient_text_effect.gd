@tool
extends RichTextEffect
class_name RichTextGrandient


var bbcode = "gradient"

func _process_custom_fx(char_fx):
	var color0 = Color(char_fx.env.get("color0", "#FF00FF"))
	var color1 = Color(char_fx.env.get("color1", "#00FF00"))
	
	
	var speed = char_fx.env.get("freq", 2)
	var span = char_fx.env.get("span", 10.0)

	var i_color =   lerp(color0,color1,	sin(char_fx.elapsed_time * speed + (char_fx.range.x / span)) * 0.5 + 0.5)
	char_fx.color = i_color
	return true
