Type tswitch Extends tentity

	Field operate:TList

	Method New()
	EndMethod
	
	Method destroy()
	EndMethod
	
	Method getheight()
		If state = 1
			Return 6
		Else
			Return 10
		EndIf
	EndMethod
	
	Function Create:tswitch( x:Int, y:Int, parent:tmap )
		Local s:tswitch = New tswitch
			s.parent	= parent
			s.x			= x
			s.y			= y
			s.width		= 24
			s.height	= 10
		Return s
	EndFunction
	
	Method addoperator( entity:tentity )
		If entity = Null Return
		If operate = Null operate = New TList
		operate.addlast entity
	EndMethod
	
	Method removeoperator( entity:tentity )
		If entity = Null Return
		list.remove entity
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )

		Local xx:Int = x-Int(xoffset)
		Local yy:Int = y-Int(yoffset)
	
		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetBlend( ALPHABLEND )
		
		SetScale( 2, 2 )

		DrawImage( spr_objects1, xx, yy, 3+state )

		SetScale( 1, 1 )

	EndMethod	
	
	Method collision( entity:tentity, flags:Int )
		If flags = COLLIDE_ABOVE And state = 0
			state = 1
			PlaySound( sfx_blip )
			For Local e:tentity = EachIn operate
				If e.state = 1
					e.state = 0
				Else
					e.state = 1
				EndIf
			Next
		EndIf
	EndMethod
	
EndType

Type ttimerswitch Extends tswitch
	
	Field timer:Float

	Function Create:ttimerswitch( x:Int, y:Int, parent:tmap )
		Local s:ttimerswitch = New ttimerswitch
			s.parent	= parent
			s.x			= x
			s.y			= y
			s.width		= 24
			s.height	= 10
		Return s
	EndFunction
	
	Method update()
		Super.update()
		If state = 1 
			timer:-0.25
			If timer < 0
				timer = 0
				state = 0
				For Local e:tentity = EachIn operate
					If e.state = 1
						e.state = 0
					Else
						e.state = 1
					EndIf
				Next
			EndIf
		EndIf
	EndMethod

	Method draw( xoffset:Float, yoffset:Float )

		Local xx:Int = x-Int(xoffset)
		Local yy:Int = y-Int(yoffset)
		Local frame:Int
	
		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetBlend( ALPHABLEND )
		
		SetScale( 2, 2 )

		DrawImage( spr_objects1, xx, yy, 3+state )
		
		If state = 1
			frame = 13-( timer/10 )
			If frame >=0 And frame < 13
				SetAlpha( 0.75 )
				DrawImage( img_timerswitch, xx-4, yy+2, frame)
			EndIf
		EndIf
		
		SetScale( 1, 1 )

	EndMethod
	
	Method collision( entity:tentity, flags:Int )
		Super.collision( entity, flags )
		If timer = 0 timer = 130
	EndMethod
	
EndType