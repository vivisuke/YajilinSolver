extends Node2D

const N_HORZ = 10
const N_VERT = 10
const TILE_NONE = -1
const TILE_CURSOR = 0					# カーソル（薄ピンク）

var cur_pos = Vector2i(-1, -1)

func _ready():
	pass # Replace with function body.

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
		
