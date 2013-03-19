Function editor()

	Local done:Int = False
	
	Local grid:tgrid = tgrid.Create( 64, GRID_DOUBLEDASH )
	SetGridColor( grid, 0, 0, 0, 0.75 )
	
	Local map:tmap = tmap.Create()
	
	Local coords:tfloatcontrol = tfloatcontrol.Create()
	SetControlBounds( coords, 0, (map.width*64)-GraphicsWidth(), 0, (map.height*64)-GraphicsHeight() )	
	
	Local displaygrid:Int = True
	
	Local mx:Int, my:Int
	
	Local layer:Int = 0
	Local pen:Int = 1
	Local paper:Int = 0
	
	Local mapx:Float, mapy:Float
	
	Local player1:tplayer = tplayer.Create( 140, 128, 32, 32, map )	
	
	tcrate.Create( 210, 0, map )	
	tmetalcrate.Create( 410, 0, map )
	tcrate.Create( 640, 0, map )
	
	Local door1:tdoor = tdoor.Create( (6*64)+16, (9*64)-1, map )
	Local door2:tdoor = tdoor.Create( (5*64)+16, (12*64)-1, map )
	Local door3:tdoor = tdoor.Create( (10*64)+16, (14*64)-1, map )
	door3.state = 1
	
	Local switch1:tswitch = tswitch.Create( (2*64)+20, (8*64)-1, map )
	Local switch2:tswitch = ttimerswitch.Create( (9*64)+20, (8*64)-1, map )
		
	switch1.addoperator( door1 )
	switch1.addoperator( door3 )
	switch2.addoperator( door2 )				
	
	If mus_default PlaySound( mus_default )
			
	Repeat
	
		If KeyDown( KEY_Z )
			If player1.allow_left player1.xac:-0.5
		EndIf
		
		If KeyDown( KEY_X )
			If player1.allow_right player1.xac:+0.5		
		EndIf
		
		If KeyHit(KEY_J)
			If Not ( player1.falling Or player1.jumping )
				player1.jumping = True
				player1.yac = -16.0	
				PlaySound( sfx_jump )		
			EndIf
		EndIf
	
		If KeyDown(KEY_ESCAPE) Or AppTerminate() done = True
		
		If KeyHit(KEY_G) ToggleState( Varptr displaygrid )

		If KeyHit( KEY_EQUALS )
			If pen < img_tiles.frames.length pen:+1
		EndIf
		
		If KeyHit( KEY_MINUS )
			If pen >0 pen:-1
		EndIf
		
		If KeyHit( KEY_1 ) layer = 0
		If KeyHit( KEY_2 ) layer = 1
		If KeyHit( KEY_3 ) layer = 2
		
		If KeyHit(KEY_S)
			map.save()
		EndIf
		
		If KeyHit(KEY_O)
			map.open()
		EndIf
		
		player1.speak = 0
		
		If KeyDown(KEY_SPACE)
			player1.speak = 1
		EndIf

		If KeyDown(KEY_A)
			player1.speak = 2
		EndIf
		
		If KeyDown(KEY_M)
			player1.speak = 4
		EndIf		
				
		UpdateControl(coords)
		
		SetGridCoords( grid, GetControlX(coords), GetControlY(coords) )
		
		mapx = GetControlX(coords)
		mapy = GetControlY(coords)
		
		GetGridCoords( grid, mx, my )
		
		If KeyHit( KEY_COMMA )
			pen = map.get( layer, mx, my )
		EndIf
			
		If MouseDown(1)
			map.set( layer, mx, my, pen )			
		EndIf
		
		If MouseDown(2)
			map.set( layer, mx, my, paper )
		EndIf

		If KeyHit(KEY_C)
			tcrate.Create( MouseX()+mapx, MouseY()+mapy, map )
		EndIf

		If KeyHit(KEY_M)
			tmetalcrate.Create( MouseX()+mapx, MouseY()+mapy, map )
		EndIf
		

		SetClsColor( 1, 150, 255 )
		
		Cls
		
			SetScale( 1, 1 )
		
			SetColor( 255, 127, 1 )
			SetBlend( ALPHABLEND )
			SetAlpha( 0.75 )

			DrawImageRect( img_gradient1, 0, 0, gfxw, gfxh )
			
			SetColor( 25, 155, 255 )
			SetAlpha( 1.0 )
			
			DrawImageRect( img_back, 0, 0, gfxw, gfxh )
						
			SetColor( 64, 64, 64 )
			SetAlpha( 0.95 )
			DrawImageRect( img_vignette1, 0, 0, gfxw, gfxh )

			map.draw( mapx, mapy )
			
			tparticle.updateall( Int(mapx), Int(mapy) )			
			tentity.updateall( mapx, mapy )

			SetColor( 0, 0, 0 )
			SetAlpha( 0.5 )
			SetBlend( ALPHABLEND )
		
			DrawImageRect( img_vignette2, 0, 0, gfxw, gfxh )
			
			SetColor( 255, 255, 255 )
			SetAlpha( 0.75 )
			SetScale( 2, 2 )
			
			DrawImage( img_status, 16, gfxh-48 )			

			SetScale( 1, 1 )

			SetAlpha( 1.0 )
			SetBlend( ALPHABLEND )
			
			If displaygrid DrawGrid( grid )
		
		Flip
	
	Until done

EndFunction

Function drawtiles( pos:Float, selected:Int )

	Local w:Int = GraphicsWidth()/64
	
	SetColor( 255, 255, 255 )
	SetAlpha( 1.0 )
	SetBlend( ALPHABLEND )
	SetScale( 4, 4 )
	
	For Local x:Int = 0 To w+1
		DrawImage( img_tiles, x*64, 0, x )
	Next
	
	SetScale( 1, 1 )
	

EndFunction

Function endeditor()

EndFunction
