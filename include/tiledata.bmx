Global tiledata:Int[256]

Function init_tiledata()

	Local t:Int

	tiledata[0] = 1
	tiledata[3] = 1
	tiledata[4] = 1	
	tiledata[5] = 1	
	tiledata[8] = 1
	tiledata[9] = 1	
	tiledata[10] = 1
	For t = 14 To 27			
		tiledata[t] = 1
	Next
	
	For t = 34 To 255
		tiledata[t] = 1	
	Next
						
EndFunction
