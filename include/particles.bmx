Const PART_GRAVITY	= 1
Const PART_FADE		= 2

Type tparticle

	Global list:TList
	
	Field flags:Int
	
	Field x:Float, y:Float
	Field xac:Float, yac:Float
	Field angle:Float
	
	Field red:Byte, green:Byte, blue:Byte
	Field alpha:Float
	Field blend:Int
	
	Field scale:Float
	
	Field map:tmap
	
	Field life_time:Float
	Field life_decay:Float
	
	Field fade_rate:Float	= 0.95
	
	Method New()
		If list = Null list = New TList
		list.addlast Self
	EndMethod
	
	Method destroy()
		If list = Null Return
		list.remove Self
	EndMethod
	
	Function flush()
		If list = Null Return
		For Local p:tparticle = EachIn list
			p.destroy()
		Next
		list = Null
	EndFunction
	
	Method addflag( flag:Int )
		If flags & flag
			Return
		Else
			flags:+flag
		EndIf
	EndMethod
	
	Method removeflag( flag:Int )
		If flags & flag
			flags:-flag
		EndIf
	EndMethod
	
	Function updateall( xoffset:Float, yoffset:Float )
		If list = Null Return
		For Local p:tparticle = EachIn list
			p.update()
			p.draw( xoffset, yoffset )
		Next
	EndFunction
	
	Method update()
	
		If flags & PART_GRAVITY
			yac:+0.45
			If Abs(yac) > 8 yac = 8*Sgn(yac)			
		EndIf
		
		If flags & PART_FADE
			alpha:*fade_rate
			If alpha < 0.01 aplha = 0
		EndIf
	
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract
	
EndType

Type tdust Extends tparticle

	Function Create:tdust( x:Int, y:Int, xac:Float, yac:Float, flags:Int=PART_GRAVITY|PART_FADE )
	
		Local c:Int = Rnd( 0, 64 )
 
		Local d:tdust = New tdust
		
			d.flags	= flags
		
			d.x		= x
			d.y		= y
			d.xac	= xac
			d.yac	= yac
			
			d.red	= c
			d.green	= c
			d.blue	= c
			
			d.alpha = Rnd( 0.5, 1.0 )
			
			d.scale	= Rnd( 2.0, 8.0 )
			d.angle = Rnd(360)
			
		Return d
		
	EndFunction

	Method update()
	
		Super.update()
		
		If alpha = 0 destroy()
	
		xac:*0.95
		If Abs(xac) < 0.1 xac = 0
		x:+xac
		
		angle:+(xac*10)
		
		y:+yac	
		
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
	
		Local xx:Float = x - xoffset
		Local yy:Float = y - yoffset
		
		SetColor( red, green, blue )
		SetAlpha( alpha )
		SetBlend( ALPHABLEND )
		
		SetScale( scale, scale )
		
		SetRotation( angle )
		DrawImage( part_dust, xx, yy )
		
		SetScale( 1, 1 )
		SetRotation( 0 )
		
	EndMethod

EndType

Type tfountain

	Global list:TList

	Field x:Int, y:Int
	Field width:Int, height:Int
	
	Method New()
	EndMethod
	
	Method destroy()
	EndMethod

EndType


