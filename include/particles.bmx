Type tparticle

	Global list:TList
	
	Field x:Int, y:Int
	Field xac:Float, yac:Float
	Field angle:Float
	
	Field red:Byte, green:Byte, blue:Byte
	Field alpha:Float
	Field blend:Int
	
	Method New()
		If list = Null list = New TList
		list.addlast Self
	EndMethod
	
	Method destroy()
		If list = Null Return
		list.remove Self
	EndMethod
	
	Function updateall( xoffset:Float, yoffset:Float )
		If list = Null Return
		For Local p:tparticle = EachIn list
			p.update()
			p.draw( xoffset, yoffset )
		Next
	EndFunction
	
	Method update() Abstract
	Method draw( xoffset:Float, yoffset:Float ) Abstract
	
EndType

Type tdust Extends tparticle

	Function Create:tdust( x:Int, y:Int, xac:Float, yac:Float )
	
		Local c:Int = Rnd( 0, 96 )
 
		Local d:tdust = New tdust
		
			d.x		= x
			d.y		= y
			d.xac	= xac
			d.yac	= yac
			
			d.red	= c
			d.green	= c
			d.blue	= c
			
			d.alpha = Rnd( 0.25, 1.0 )
			
		Return d
		
	EndFunction

	Method update()
		xac:*0.95
		If Abs(xac) < 0.1 xac = 0
		x:+xac
		yac:+0.45
		If Abs(yac) > 8 yac = 8*Sgn(yac)
		y:+yac
		alpha:*0.95
		If alpha < 0.1 destroy()
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
	
		Local xx:Float = x - xoffset
		Local yy:Float = y - yoffset
		
		SetColor( red, green, blue )
		SetAlpha( alpha )
		SetBlend( ALPHABLEND )
		
		SetScale( 1, 1 )
		
		DrawRect( xx, yy, 4, 4 )
		
	EndMethod

EndType
