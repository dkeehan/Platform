Import dave.grid
Import dave.floatcontrol
Import dave.myfunctions
Import dave.math

Rem

	Controls:

	z - left
	x - right
	j - jump

EndRem

SetGraphicsDriver GLMax2DDriver()

Include "include/media.bmx"
Include "include/map.bmx"
Include "include/editor.bmx"
Include "include/game.bmx"
Include "include/entity.bmx"
Include "include/tiledata.bmx"

Graphics( 800, 600, 32 )

Global gfxw:Int = GraphicsWidth()
Global gfxh:Int = GraphicsHeight()

init_media()
init_tiledata()

editor()

EndGraphics

End