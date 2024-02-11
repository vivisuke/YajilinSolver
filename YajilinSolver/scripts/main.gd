extends Node2D

enum {
	TILE_NONE = -1,
	TILE_CURSOR,			# カーソル（薄ピンク）
	TILE_ARROWS,			# 
	TILE_ARROWS2,			# 
	#
	TILE_LEFT = 0,
	TILE_DOWN,
	TILE_UP,
	TILE_RIGHT,
}

const N_HORZ = 10
const N_VERT = 10
const CELL_WIDTH = 49

var cur_pos = Vector2i(-1, -1)
var num_labels = []

func _ready():
	init_labels()
	for y in range(N_VERT):
		for x in range(N_HORZ):
			var t = TILE_LEFT + (x+y)%4
			$Board/TileMap2.set_cell(0, Vector2i(x, y), t, Vector2i(0, 0))
	pass # Replace with function body.
func init_labels():
	for y in range(N_VERT):
		var py = y * CELL_WIDTH + 2
		for x in range(N_HORZ):
			var px = x * CELL_WIDTH + 10
			var label = Label.new()
			num_labels.push_back(label)
			label.add_theme_color_override("font_color", Color.BLACK)
			label.add_theme_font_size_override("font_size", 40)
			label.position = Vector2(px, py)
			label.text = str((x+y)%6)
			$Board.add_child(label)
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var mp = $Board/TileMap.local_to_map($Board/TileMap.get_local_mouse_position())
		print(mp)
		if mp[0] >= 0 && mp[0] < N_HORZ && mp[1] >= 0 && mp[1] < N_VERT:
			if cur_pos[0] >= 0:
				$Board/TileMap.set_cell(0, cur_pos, TILE_NONE)
			cur_pos = mp
			$Board/TileMap.set_cell(0, cur_pos, TILE_CURSOR, Vector2i(0, 0))
		
