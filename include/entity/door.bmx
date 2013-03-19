Type tdoor Extends tentity

	Field open:Float

	Method New()
		flags = 0
	EndMethod
	
	Method destroy()
	EndMethod
	
	Function Create:tdoor( x:Int, y:Int, parent:tmap )
		Local d:tdoor = New tdoor
			d.parent	= parent
			d.x			= x
			d.y			= y
			d.width		= 32
			d.height	= 64
		Return d
	EndFunction
	
	Method gety()
		Return y-Int(open)
	EndMethod
	
	Method getheight()
		Return 64-Int(open)
	EndMethod
	
	Method update()
		Super.update()
		If state = 0
			If open > 0 
				open:-0.25
				If Abs(open) < 0 open = 0
			EndIf
		Else
			If open < 60
				open:+0.25
				If Abs(open) >=60 open = 60
			EndIf
		EndIf
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
	
		Local vx:Int, vy:Int, vw:Int, vh:Int
		GetViewport( vx, vy, vw, vh )
	
		Local xx:Int = x-Int(xoffset)
		Local yy:Int = y-Int(yoffset)
	
		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetBlend( ALPHABLEND )
		
		SetScale( 2, 2 )
		
		SetViewport( xx, yy-(height-1), width, height+1 )
		DrawImage( spr_objects2, xx, yy-open, 2 )
		
		SetScale( 1, 1 )
		
		SetColor( 0, 0, 0 )
		SetAlpha( 0.75 )
		
		DrawImageRect( img_gradient2, xx, yy-(height-1), width, 4 )
		
		SetViewport( vx, vy, vw, vh )
	
	EndMethod
	
	Method collision( entity:tentity, flags:Int )
	EndMethod	

EndType
