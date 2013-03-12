Function game()

	Local done:Int = False

	Repeat
	
		If KeyDown(KEY_ESCAPE) Or AppTerminate() done = True
	
		SetBlend(ALPHABLEND)
	
		SetClsColor( 0, 0, 0 )
		Cls
		
		
		Flip
	
	Until done

EndFunction

Function endgame()

EndFunction
