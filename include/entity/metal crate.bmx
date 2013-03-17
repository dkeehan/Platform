Type tmetalcrate Extends tentity

	Method New()
		id = "metal_crate"
		pushable = True
	EndMethod

	Function Create:tmetalcrate( x:Float, y:Float, parent:tmap )
		If parent = Null Return
		Local c:tmetalcrate = New tmetalcrate
			c.x			= x
			c.y			= y
			c.width		= 32
			c.height	= 32
			c.parent	= parent
		Return c
	EndFunction
	
	Method update()
		Super.update()
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
		
		Local xx:Float = x - xoffset
		Local yy:Float = y - yoffset

		If RectsOverlap( xx, yy-(height-1), width-1, height-1, 0, 0, GraphicsWidth(), GraphicsHeight() )
			
			SetColor( 255, 255, 255 )
			SetAlpha( 1.0 )
			SetBlend( ALPHABLEND )
			SetScale( 2, 2 )

			DrawImage( spr_objects1, xx, yy, 2 )

			SetScale( 1, 1 )
			
			Return True
			
		EndIf
		
	EndMethod

EndType
