Type tmap

	Global tilesize:Int = 64

	Field data:Int[3,100,100]
	
	Field layers:Int
	Field width:Int
	Field height:Int

	Method New()
		layers	= 3
		width	= 100
		height	= 100
	EndMethod
	
	Method destroy()
	EndMethod
	
	Function Create:tmap()
	
		Local m:tmap = New tmap
			m.open()
		Return m
		
	EndFunction

	Method save( filename:String="temp.dat" )
	
		If filename
			
			If ReadDir( "data" )
			Else
				CreateDir( "data" )
			EndIf

			Local stream:TStream = WriteFile( "data/"+filename )
			
			If stream
			
				WriteInt( stream, layers )
				WriteInt( stream, width )
				WriteInt( stream, height )
			
				For Local dl:Int = 0 To layers-1
					For Local dy:Int = 0 To height-1
					For Local dx:Int = 0 To width-1
					
						WriteInt( stream, get(dl,dx,dy) )
						
					Next
					Next
				Next
				
				CloseStream( stream )

			EndIf
			
		EndIf
		
	EndMethod
	
	Method open( filename:String="temp.dat" )
	
		If filename = "" Return
		
		Local stream:TStream = ReadFile( "data/"+filename )
		Local tile:Int
		
		If stream
		
			layers	= ReadInt( stream )
			width 	= ReadInt( stream )
			height 	= ReadInt( stream )
			
			For Local dl:Int = 0 To layers-1
				For Local dy:Int = 0 To height-1
				For Local dx:Int = 0 To width-1
				
					tile = ReadInt( stream )
					set( dl, dx, dy, tile )
				
				Next
				Next
			Next
		
			CloseStream( stream )

		EndIf
	
	EndMethod

	
	Method flush()
	
	EndMethod
	
	Method set( layer:Int, x:Int, y:Int, value:Int )
		If x>= 0 And y>=0 And x<width And y<height
			data[ layer, x, y ] = value
		EndIf
	EndMethod
	
	Method get( layer:Int, x:Int, y:Int )
		If x>= 0 And y>=0 And x<width And y<height
			Return data[ layer, x, y ] 
		EndIf
		Return 0
	EndMethod
	
	Method draw( x:Float, y:Float )
	
		Local vx:Int, vy:Int, vw:Int, vh:Int
		GetViewport( vx, vy, vw, vh )
		
		Local w:Int = vw/tilesize
		Local h:Int = vh/tilesize
		
		Local mapx:Int = x/tilesize
		Local mapy:Int = y/tilesize
		
		Local xoffset:Float = x Mod (tilesize)
		Local yoffset:Float = y Mod (tilesize)
		
		Local dx:Int, dy:Int ' DATA
		
		Local bx:Int, by:Int ' BLOCK POSITION
		Local block:Int
		
		Local mx:Int, my:Int

		
		SetBlend(ALPHABLEND)	
		SetColor( 255, 255, 255 )
		SetAlpha( 1.0 )
		SetScale( 2, 2 )
					
		For Local l:Int = 0 To 2
		
			If l = 1

				SetColor( 255, 255, 255 )			
				SetAlpha( 0.65 )
				SetScale( 2, 2 )
				SetBlend( ALPHABLEND )
	
				For my = 0 To h+1		
					For mx = 0 To w+1				
						bx = Int( mx*tilesize )
						by = Int( my*tilesize )				
						dx = mx+mapx
						dy = my+mapy				
						
						If CheckBounds( dx, 0, width ) And CheckBounds( dy, 0, height )				
							
							block = data[ l, dx, dy ]
							
							If CheckBounds( block, 1, img_tiles.frames.length )					
	
								If block = 1
									DrawImage( img_outline, bx-xoffset, by-yoffset )
								EndIf
											
							EndIf
						
						EndIf
					
					Next
					
				Next
			
			EndIf
		
			For Local b:Int = 0 To 1

			For my = 0 To h+1
			
				For mx = 0 To w+1
				
					bx = Int( mx*tilesize )
					by = Int( my*tilesize )
					
					dx = mx+mapx
					dy = my+mapy
				
					If CheckBounds( dx, 0, width ) And CheckBounds( dy, 0, height )
					
						block = data[ l, dx, dy ]
						If CheckBounds( block, 1, img_tiles.frames.length )
						
							Select b
													
							Case 0
							
								SetColor( 255, 255, 255 )			
								SetAlpha( 1.0 )
								SetScale( 2, 2 )
								SetBlend(ALPHABLEND)

								DrawImage( img_tiles, bx-xoffset, by-yoffset, block )
								
								If tiledata[block] = 0
									SetColor( 0, 0, 0 )
									SetAlpha( 0.75 )
									SetScale( 1, 1 )
									DrawImage( img_noise, bx-xoffset, by-yoffset, (((dy+l) Mod(8))*8)+((dx+l) Mod(8)) )		
								EndIf
							
							Case 1
							
								SetColor( 245, 245, 255 )			
								SetAlpha( 1.0 )
								SetScale( 2, 2 )
								SetBlend(LIGHTBLEND)
								DrawImage( img_bloom, bx-xoffset, by-yoffset, block )
												
							EndSelect
										
						EndIf
					
					EndIf
				
				Next
				
			Next
			
			Next
			
		Next
		
		SetScale( 1, 1 )
	
	EndMethod

EndType
