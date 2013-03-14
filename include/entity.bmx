Type tentity

	Global list:TList

	Field x:Int, y:Int
	Field width:Int, height:Int
		
	Field pvx:Int, pvy:Int
	
	Field xac:Float, yac:Float
	
	Field facing:Int
	Field jumping:Int
	Field falling:Int
	
	Field allow_left:Int
	Field allow_right:Int
	
	Field parent:tmap

	Method New()
	EndMethod
	
	Method destroy()
	EndMethod	
	
	Function updateall( xoffset:Float, yoffset:Float )
		If list = Null Return
		For Local e:tentity = EachIn list
			e.update()
			e.draw( xoffset, yoffset )
		Next
	EndFunction
	
	Method update()
	
		pvx = x
		pvy = y	
		
		Local pv_yac:Float = yac
		
		Local pv_falling:Int = falling
		Local pv_jumping:Int = jumping
			
		y:+yac
			
		If jumping
			yac:*0.90
			If Abs(yac) < 0.25
				yac = 0
				jumping = False
			EndIf
			check_above()
		Else
			falling = check_below(True)
			If falling
				yac:+0.25
				If Abs(yac) > 16.0 yac = 16.0*Sgn(yac)
			Else
				If pv_falling
					If pv_yac >= 10 
						yac = -0.5
						For Local p:Int = 0 To 9
							tdust.Create( (x+p)+3, y, Rnd(-3.0,3.0)+(xac*-1), Rnd(-4.0, -8.0 ) )
						Next
					EndIf
					jumping = True
				EndIf
			EndIf	
		EndIf

		x:+xac
		xac:*0.9
		If Abs(xac) < 0.25 xac = 0
		
		If xac<>0 facing = Sgn(xac)	
		
		allow_left	= check_left()
		allow_right	= check_right()			

	EndMethod
	
	Method check_left:Int( reset:Int=True )
	
		If Not parent Return
		
		Local xx1:Int, yy1:Int, mx1:Int, my1:Int	
		Local xx2:Int, yy2:Int, mx2:Int, my2:Int	
		Local bl1:Int, bl2:Int
				
		xx1 = x-1
		yy1 = y-(height-1)
		
		mx1 = xx1/64 
		my1 = (yy1/64)
		
		yy2 = y

		my2 = (yy2/64)

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx1, my2 )]
			If bl1 <> 1 Or bl2 <> 1	
				If reset
					xac = 0
					x = (((xx1/64)+1)*64)
				EndIf
				Return False
			EndIf	
		Next
		
		Return True		
	
	EndMethod	
	
	Method check_right:Int( reset:Int=True )
	
		If Not parent Return
		
		Local xx1:Int, yy1:Int, mx1:Int, my1:Int	
		Local xx2:Int, yy2:Int, mx2:Int, my2:Int	
		Local bl1:Int, bl2:Int
				
		xx1 = x+width
		yy1 = y-(height-1)
		
		mx1 = xx1/64 
		my1 = (yy1/64)
		
		xx2 = xx1
		yy2 = y
		
		mx2 = mx1
		my2 = (yy2/64)

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx2, my2 )]
			If bl1 <> 1 Or bl2 <> 1
				If reset
					xac = 0
					x = (((x/64)+1)*64)-width
				EndIf
				Return False
			EndIf	
		Next
		
		Return True		
	
	EndMethod	
		
	Method check_above:Int(reset:Int=True)
	
		If Not parent Return
		
		Local xx1:Int, yy1:Int, mx1:Int, my1:Int	
		Local xx2:Int, yy2:Int, mx2:Int, my2:Int	
		Local bl1:Int, bl2:Int
				
		xx1 = Int(x) 
		yy1 = Int(y-height)
		
		mx1 = xx1/64 
		my1 = (yy1/64)
		
		xx2 = Int(x)+(width-1)
		yy2 = yy1
		
		mx2 = xx2/64
		my2 = my1

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx2, my2 )]
			If bl1 <> 1 Or bl2 <> 1
				If reset
					yac = 0
					y = (Int(y/64)*64)+height
				EndIf
				Return False
			EndIf	
		Next
		
		Return True		
	
	EndMethod
	
	Method check_below:Int(reset:Int=True)

		If Not parent Return
		
		Local xx1:Int, yy1:Int
		Local mx1:Int, my1:Int
		
		Local xx2:Int, yy2:Int
		Local mx2:Int, my2:Int
		
		Local bl1:Int, bl2:Int
				
		xx1 = x
		yy1 = y+1
		
		mx1 = xx1/64 
		my1 = (yy1/64)
		
		xx2 = x+(width-1)
			
		mx2 = xx2/64

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx2, my1 )]
			If bl1 <> 1 Or bl2 <> 1	
				If reset
					yac = 0
					y = (Int((y+1)/64)*64)-1
				EndIf
				Return False
			EndIf
		Next
		
		Return True
		
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract

EndType

Type tplayer Extends tentity

	Field gun:Int
	Field rot:Float

	Method New()
		If list = Null list = New TList
		list.addlast Self
	EndMethod
	
	Method destroy()
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
		
		Local xx:Float = x - xoffset
		Local yy:Float = y - yoffset

		If RectsOverlap( xx, yy-height, width, height, 0, 0, GraphicsWidth(), GraphicsHeight() )
			
			SetColor(255,255,255)
			SetAlpha(1.0)
			SetBlend(ALPHABLEND)
			SetScale( 2, 2 )
			
			If facing = -1
				DrawImage( img_player, xx, yy, 2 )
				DrawImage( img_gun, xx+11, yy-11, 9 )
			Else
				DrawImage( img_player, xx, yy, 1 )
				DrawImage( img_gun, xx+21, yy-11, 1 )
			EndIf
			
			SetScale( 1, 1 )
			
			Return True
			
		EndIf
		
	EndMethod
	
EndType
