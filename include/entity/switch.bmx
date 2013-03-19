Type tswitch Extends tentity

	Field operate:TList

	Method New()
	EndMethod
	
	Method destroy()
	EndMethod
	
	Function Create:tswitch( x:Int, y:Int, parent:tmap )
		Local s:tswitch = New tswitch
		Return s
	EndFunction
	
	Method addoperator( entity:tentity )
		If entity = Null Return
		If operate = Null operate = New TList
		operate.addlast entity
	EndMethod
	
	Method removeoperator( entity:tentity )
		If entity = Null return
		list.remove entity
	EndMethod
	
	Method draw( xoffset:Float, yoffset:Float )
	EndMethod	
	
	Method collision( entity:tentity, flags:Int )
	EndMethod
	
EndType
