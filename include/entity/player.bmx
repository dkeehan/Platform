Type tplayer Extends tentity

	Field gun:Int
	Field rot:Float
	Field speak:Int = 0
	
	Method New()
		id = "player"
		pushable = False
	EndMethod
	
	Function Create:tplayer( x:Float, y:Float, width:Int, height:Int, parent:tmap )
		If parent = Null Return
		Local p:tplayer = New tplayer
			p.x			= x
			p.y			= y
			p.width		= width
			p.height	= height
			p.parent	= parent
		Return p
	EndFunction
	
	Method update()
		Super.update()
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
		
		Local xx:Float = x - Int(xoffset)
		Local yy:Float = y - Int(yoffset)

		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetBlend( ALPHABLEND )
		SetScale( 2, 2 )
		
		If facing = -1
			DrawImage( img_player, xx, yy, 2 )
			DrawImage( img_gun, xx+11, yy-11, 9 )
		Else
			DrawImage( img_player, xx, yy, 1 )
			DrawImage( img_gun, xx+21, yy-11, 1 )
		EndIf
		
		If speak > 0
			DrawImage( img_bubble, xx+width, yy-(height), speak )
		EndIf
		
		SetScale( 1, 1 )
		
		Return True
		
	EndMethod
	
	Method collision( entity:tentity, flags:Int )
	EndMethod	
	
EndType
