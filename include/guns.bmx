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
	
EndType

Type tpistol Extends tgun

	Method New()
		magazine = 8
	EndMethod

	Function Create:tpistol()
		Local p:tpistol = New tpistol
			
		Return p
	EndFunction

EndType

Type tshotgun Extends tgun

	Method New()
		magazine = 1
	EndMethod

	Function Create:tshotgun()
		Local s:tshotgun = New tshotgun 
			
		Return s
	EndFunction

EndType