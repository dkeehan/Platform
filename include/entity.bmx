Include "entity/player.bmx"
Include "entity/crate.bmx"

Type tentity

	Global list:TList
	
	Field id:String

	Field x:Int, y:Int
	Field width:Int, height:Int
		
	Field pvx:Int, pvy:Int
	
	Field xac:Float, yac:Float
	
	Field facing:Int
	Field jumping:Int
	Field falling:Int
	Field moving:Int
	
	Field holding:tentity
	
	Field allow_left:Int
	Field allow_right:Int
	
	Field pushable:Int = False
	
	Field parent:tmap

	Method New()
		If list = Null list = New TList
		list.addfirst Self
	EndMethod
	
	Method destroy()
		If list = Null Return
		list.remove Self
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
						For Local p:Int = 3 To width-6 Step 2
							tdust.Create( (x+p), y, Rnd(-2.0,3.0)+(xac*-1), Rnd(-4.0, -8.0 ) )
						Next
						xac = 0
					EndIf
					jumping = True
				EndIf
			EndIf	
		EndIf
		
		entitybelow()

		x:+xac
		xac:*0.9
		If Abs(xac) < 0.25 xac = 0
		
		If xac<>0 
			facing = Sgn(xac)	
			moving = True
			If holding holding.x = x
		Else
			moving = False
		EndIf
		
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
					x = (((xx1/64)+1)*64)+1
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
	
	Method entitybelow:Int( reset:Int=True )
	
		If Not falling Return
		
		For Local e:tentity = EachIn list
		
			If e <> Self
				If RectsOverlap( x, y-height, width, height, e.x, e.y-e.height, e.width, e.height ) And pvy <= (e.y-e.height)
					falling = False
					y = e.y-e.height
					yac = 0
					'e.holding = Self
				Else
					'e.holding = Null
				EndIf
			EndIf
		
		Next
		
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract

EndType
