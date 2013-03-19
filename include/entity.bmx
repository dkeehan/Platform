Include "entity/player.bmx"
Include "entity/crate.bmx"
Include "entity/metal crate.bmx"

Include "entity/door.bmx"
Include "entity/switch.bmx"

Const COLLIDE_ABOVE		= 1
Const COLLIDE_BELOW		= 2
Const COLLIDE_LEFT		= 3
Const COLLIDE_RIGHT		= 4

Const ENTITY_GRAVITY	= 1
Const ENTITY_STANDABLE	= 2
Const ENTITY_MOVEABLE	= 4
Const ENTITY_MAP		= 8

Type tentity

	Global list:TList
	
	Field id:String

	Field x:Int, y:Int
	Field width:Int, height:Int
		
	Field pvx:Int, pvy:Int
	
	Field xac:Float, yac:Float
	
	Field flags:Int
	Field state:Int
	
	Field facing:Int
	Field jumping:Int
	Field falling:Int
	Field moving:Int
	
	Field holding:tentity
	Field pushing:tentity
	
	Field allow_left:Int
	Field allow_right:Int
	
	Field pushable:Int = False
	
	Field parent:tmap
	
	Method removeflag( flag:Int )
		If flags&flag
			flags:-flag
		Else
		EndIf
	EndMethod
	
	Method addflag( flag:Int )
		If flags&flag
		Else
			flags:+flag
		EndIf
	EndMethod

	Method New()
		If list = Null list = New TList
		list.addfirst Self
		flags = ENTITY_GRAVITY|ENTITY_STANDABLE|ENTITY_MOVEABLE
	EndMethod
	
	Method destroy()
		If list = Null Return
		list.remove Self
	EndMethod	
	
	Function updateall( xoffset:Float, yoffset:Float )
		If list = Null Return
		For Local e:tentity = EachIn list
			e.update()

			If RectsOverlap( e.x-xoffset, (e.y-e.height)-yoffset, e.width, e.height, 0, 0, GraphicsWidth(), GraphicsHeight() )
				e.draw( xoffset, yoffset )
			EndIf
			
		Next
	EndFunction
	
	Method getx:Int()
		Return x
	EndMethod
	
	Method gety:Int()
		Return y
	EndMethod
	
	Method getwidth:Int()
		Return width
	EndMethod
	
	Method getheight:Int()
		Return height
	EndMethod
	
	Method update()
	
		pvx = x
		pvy = y	
		
		Local pv_yac:Float = yac
		
		Local pv_falling:Int = falling
		Local pv_jumping:Int = jumping
					
		If flags & ENTITY_GRAVITY 
			
			y:+yac
		
			If jumping
				If entityabove() jumping = False
			EndIf
				
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
								PlaySound( sfx_land )
							Next
							xac = 0
						EndIf
						jumping = True
					EndIf
				EndIf	
			EndIf
		
		EndIf
		
		entitybelow()
		entityabove()

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
		
		entitypush()

	EndMethod
	
	Method check_left:Int( reset:Int=True )
	
		If Not parent Return
		
		Local xx1:Int, yy1:Int, mx1:Int, my1:Int	
		Local xx2:Int, yy2:Int, mx2:Int, my2:Int	
		Local bl1:Int, bl2:Int
				
		xx1 = x-1
		yy1 = y-(height-1)
		
		mx1 = xx1/64 
		my1 = yy1/64
		
		yy2 = y

		my2 = (yy2/64)

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx1, my2 )]
			If bl1 <> 1 Or bl2 <> 1	
				If reset
					If xac<0 xac = 0
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
		my1 = yy1/64
		
		yy2 = y

		my2 = (yy2/64)

		For Local l:Int = 0 To 2	
			bl1 = tiledata[parent.get( l, mx1, my1 )]
			bl2 = tiledata[parent.get( l, mx1, my2 )]
			If bl1 <> 1 Or bl2 <> 1
				If reset
					If xac>0 xac = 0
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
					If yac<0 yac = 0
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
					If yac>0 yac = 0
					y = (Int((y+1)/64)*64)-1
				EndIf
				Return False
			EndIf
		Next
		
		Return True
		
	EndMethod
	
	Method entitypush:Int( reset:Int=True )
	
		Local ex:Int = getx()
		Local ey:Int = gety()
		Local ew:Int = getwidth()
		Local eh:Int = getheight()
	
		If Not list Return
	
		For Local e:tentity = EachIn list
		
			If e <> Self 'And e.pushable
				If RectsOverlap( ex, ey-(eh-1), ew, eh-1, e.getx(), e.gety()-(e.getheight()-1), e.getwidth(), e.getheight()-1 ) And pvy > e.y-height
					If pvx < e.x
						If e.allow_right And e.pushable
							e.x = x+width
							e.xac = xac
						Else
							allow_right = False
							x = e.x-width
							If xac>0 xac = 0
						EndIf
						collision( e, COLLIDE_LEFT )
					Else
						If e.allow_left	And e.pushable					
							e.x = x-e.width
							e.xac = xac
						Else
							allow_left = False
							x = e.x+e.width
							If xac<0 xac = 0
						EndIf
						collision( e, COLLIDE_RIGHT )
					EndIf
				Else
				EndIf
			EndIf
		
		Next
			
	EndMethod
	
	Method entitybelow:Int( reset:Int=True )
	
		If Not (falling Or list ) Return
		
		For Local e:tentity = EachIn list
		
			If e <> Self
				If RectsOverlap( x, y-(height), width-1, height, e.x, e.y-(e.height), e.width-1, e.height ) And pvy <= (e.y-e.height)
					falling = False
					y = e.y-e.height
					If yac >= 11 PlaySound( sfx_land )
					If yac>0 yac = 0
					collision( e, COLLIDE_ABOVE )
				Else
				EndIf
			EndIf
		
		Next
		
	EndMethod
	
	Method entityabove:Int( reset:Int=True )
		
		If Not (jumping Or list ) Return
		
		For Local e:tentity = EachIn list
		
			If e <> Self 'And e.pushable
				If RectsOverlap( x, y-(height-1), width-1, height-1, e.x, e.y-(e.height-1), e.width-1, e.height-1 ) And pvy > (e.y+height)
					If jumping
						jumping = False
						If reset
							y = e.y+height
							If yac<0 yac = 0
						EndIf
					EndIf
					collision( e, COLLIDE_BELOW )
					Return True
				Else
				EndIf
			EndIf	
		Next		
		
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract
	
	Method collision( entity:tentity, flags:Int ) Abstract

EndType
