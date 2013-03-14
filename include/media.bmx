Global img_tiles:TImage
Global img_bloom:TImage
Global img_back:TImage

Global img_gradient1:TImage

Global img_vignette1:TImage
Global img_vignette2:TImage

Global img_noise:TImage

Global img_player:TImage
Global img_gun:TImage

Global img_status:TImage
Global img_outline:TImage

Global part_dust:TImage

Function init_media()

	SetMaskColor( 255,0,255 )
	
	img_back	= LoadImage( "media/image/background.png", 0 )
	
	img_tiles = LoadAnimImage( "media/image/tiles.png", 32, 32, 0, 256, MASKEDIMAGE )
	img_bloom = LoadAnimImage( "media/image/tiles_bloom.png", 32, 32, 0, 256, MASKEDIMAGE|FILTEREDIMAGE|MIPMAPPEDIMAGE )
		
	img_player = LoadAnimImage( "media/image/player.png", 16, 16, 0, 64, MASKEDIMAGE  )
	SetImageHandle( img_player, 0, 15 )
	
	img_gun = LoadAnimImage( "media/image/guns.png", 32, 32, 0, 16, MASKEDIMAGE )
	MidHandleImage( img_gun )	
	
	img_vignette1 = LoadImage( "media/image/vignette1.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	img_vignette2 = LoadImage( "media/image/vignette2.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	
	img_gradient1 = LoadImage( "media/image/gradient1.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	
	img_noise = LoadAnimImage( "media/image/noise.png", 64, 64, 0, 64, FILTEREDIMAGE|MIPMAPPEDIMAGE )
	
	img_status	= LoadImage( "media/image/status.png", 0 )
	
	img_outline	= LoadImage( "media/image/outline.png", MASKEDIMAGE )
	SetImageHandle( img_outline, 1, 1 )
	
	part_dust	= LoadImage( "media/image/particles/dust.png", MASKEDIMAGE )
	MidHandleImage( part_dust )

EndFunction

Function free_media()

EndFunction
