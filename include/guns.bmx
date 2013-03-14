Type tbullet

	Field x:Int, y:Int
	Field width:Int, height:Int
	
	Field parent:tmap
	
	Field strength:Int
	Field speed:Int
	
	Method New()
	EndMethod
	
	Method destroy()
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract
	
EndType

Type tpellet Extends tbullet

	Method draw( xoffset:Float, yoffset:Float )
	EndMethod

EndType

Type trocket Extends tbullet

	Method draw( xoffset:Float, yoffset:Float )
	EndMethod

EndType

Type tgun

	Field x:Int, y:Int
	Field width:Int, height:Int
	
	Field reload:Int
	Field magazine:Int
	
	Field parent:tentity
	
	Method New()
	EndMethod
	
	Method destroy()
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float ) Abstract
	
EndType

Type tpistol Extends tgun

	Method New()
		magazine = 8
	EndMethod

	Function Create:tpistol()
		Local p:tpistol = New tpistol
			
		Return p
	EndFunction
	
	Method draw( xoffset:Float, yoffset:Float )
	EndMethod

EndType

Type tshotgun Extends tgun

	Method New()
		magazine = 1
	EndMethod

	Function Create:tshotgun()
		Local s:tshotgun = New tshotgun 
			
		Return s
	EndFunction

	Method draw( xoffset:Float, yoffset:Float )
	EndMethod

EndType