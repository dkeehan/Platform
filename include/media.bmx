Global img_tiles:TImage
Global img_bloom:TImage
Global img_back:TImage

Global img_gradient1:TImage
Global img_gradient2:TImage

Global img_vignette1:TImage
Global img_vignette2:TImage

Global img_player:TImage
Global img_gun:TImage
Global img_bubble:TImage

Global spr_objects1:TImage
Global spr_objects2:TImage

Global img_status:TImage
Global img_clouds:TImage

Global img_timerswitch:TImage

Global part_dust:TImage

Global sfx_jump:TSound
Global sfx_land:TSound
Global sfx_blip:TSound

Global mus_default:TSound

Function init_media()

	SetMaskColor( 255,0,255 )
	
	img_back	= LoadImage( "media/image/background.png", 0 )
	
	img_tiles = LoadAnimImage( "media/image/tiles.png", 32, 32, 0, 256, MASKEDIMAGE )
	img_bloom = LoadAnimImage( "media/image/tiles_bloom.png", 32, 32, 0, 256, MASKEDIMAGE|FILTEREDIMAGE|MIPMAPPEDIMAGE )
		
	img_player = LoadAnimImage( "media/image/player.png", 16, 16, 0, 64, MASKEDIMAGE  )
	SetImageHandle( img_player, 0, 15 )
	
	img_bubble	= LoadAnimImage( "media/image/bubbles.png", 32, 32, 0, 64, MASKEDIMAGE )
	SetImageHandle( img_bubble, 1, 30 )
	
	spr_objects1	= LoadAnimImage( "media/image/objects1.png", 16, 16, 0, 64, MASKEDIMAGE )
	SetImageHandle( spr_objects1, 0, 15 )
	
	spr_objects2	= LoadAnimImage( "media/image/objects2.png", 32, 32, 0, 64, MASKEDIMAGE )
	SetImageHandle( spr_objects2, 0, 31 )	
	
	img_timerswitch = LoadAnimImage( "media/image/timer_switch.png", 16, 6, 0, 13, 0 )
	
	img_clouds		= LoadAnimImage( "media/image/clouds.png", 128, 64, 0, 2, MASKEDIMAGE )
	
	img_gun = LoadAnimImage( "media/image/guns.png", 32, 32, 0, 16, MASKEDIMAGE )
	MidHandleImage( img_gun )	
	
	img_vignette1 = LoadImage( "media/image/vignette1.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	img_vignette2 = LoadImage( "media/image/vignette2.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	
	img_gradient1 = LoadImage( "media/image/gradient1.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )
	img_gradient2 = LoadImage( "media/image/gradient2.png", FILTEREDIMAGE|MIPMAPPEDIMAGE )	

	img_status	= LoadImage( "media/image/status.png", 0 )
	
	part_dust	= LoadImage( "media/image/particles/dust.png", MASKEDIMAGE )
	MidHandleImage( part_dust )
	
	sfx_jump	= LoadSound( "media/sfx/jump.wav" )
	sfx_land	= LoadSound( "media/sfx/land.wav" )	
	sfx_blip	= LoadSound( "media/sfx/blip.wav" )
	
	'mus_default	= LoadSound( "media/music/galway.ogg", True )

EndFunction

Function free_media()

EndFunction
