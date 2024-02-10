extends ColorRect

const N_HORZ = 10
const N_VERT = 10
const CELL_WIDTH = 49
const BOARD_WIDTH = CELL_WIDTH * N_HORZ

func _draw():
	for h in range(N_HORZ + 1):
		var x = h * CELL_WIDTH
		draw_line(Vector2(x, 0), Vector2(x, BOARD_WIDTH), Color.BLACK, 1)
		draw_line(Vector2(0, x), Vector2(BOARD_WIDTH, x), Color.BLACK, 1)
	pass

func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
