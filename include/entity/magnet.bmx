Type tmagnet Extends tentity

	Method New()
		id = "magnet"
		pushable = False
	EndMethod

	Function Create:tmagnet ( x:Float, y:Float, parent:tmap )
		If parent = Null Return
		Local m:tmagnet = New tmagnet
			m.x			= x
			m.y			= y
			m.width		= 32
			m.height	= 32
			m.parent	= parent
		Return m
	EndFunction
	
	Method update()
		
		Super.update()
		
		Local ex:Int = getx()
		Local ey:Int = gety()
		Local ew:Int = getwidth()
		Local eh:Int = getheight()
		
		Local ex2:Int, ey2:Int, ew2:Int, eh2:Int
		
		For Local e:tentity = EachIn list
			If e <> Self And e.id <> "magnet" And e.id <> "switch" And e.id <> "door"
				ex2	= e.getx()
				ey2 = e.gety()
				ew2 = e.getwidth()
				eh2 = e.getheight()
				If RectsOverlap( ex-256, ey-(eh-2), ew+(512), eh-2, ex2, ey2-(eh2-1), ew2, eh2 )
					'Local dist:Float = GetDistance( ex+16, ey-16, ex2+16, ey2+16 )
					
					If ex2 < ex e.xac:+0.25
					If ex2 > ex e.xac:-0.25

				EndIf
			EndIf
		Next
		
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
		
		Local xx:Float = x - xoffset
		Local yy:Float = y - yoffset
		
		SetBlend( ALPHABLEND )
		
		Rem
		
		SetColor( 255, 64, 64 )
		SetAlpha( 0.25 )
		SetScale( 1, 1 )
		
		DrawRect( xx-256, yy-(height-1), 544, height )

		EndRem

		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetScale( 2, 2 )

		DrawImage( spr_objects1, xx, yy-1, 5 )
		
		SetScale( 1, 1 )	

		Return True

	EndMethod

	Method collision( entity:tentity, flags:Int )
	EndMethod

EndType
