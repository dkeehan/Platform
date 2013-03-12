	format	MS COFF
	extrn	___bb_appstub_appstub
	extrn	___bb_audio_audio
	extrn	___bb_bank_bank
	extrn	___bb_bankstream_bankstream
	extrn	___bb_basic_basic
	extrn	___bb_blitz_blitz
	extrn	___bb_bmploader_bmploader
	extrn	___bb_d3d7max2d_d3d7max2d
	extrn	___bb_d3d9max2d_d3d9max2d
	extrn	___bb_data_data
	extrn	___bb_directsoundaudio_directsoundaudio
	extrn	___bb_eventqueue_eventqueue
	extrn	___bb_freeaudioaudio_freeaudioaudio
	extrn	___bb_freejoy_freejoy
	extrn	___bb_freeprocess_freeprocess
	extrn	___bb_freetypefont_freetypefont
	extrn	___bb_glew_glew
	extrn	___bb_gnet_gnet
	extrn	___bb_jpgloader_jpgloader
	extrn	___bb_macos_macos
	extrn	___bb_map_map
	extrn	___bb_maxlua_maxlua
	extrn	___bb_maxutil_maxutil
	extrn	___bb_oggloader_oggloader
	extrn	___bb_openalaudio_openalaudio
	extrn	___bb_pngloader_pngloader
	extrn	___bb_retro_retro
	extrn	___bb_tgaloader_tgaloader
	extrn	___bb_threads_threads
	extrn	___bb_timer_timer
	extrn	___bb_wavloader_wavloader
	extrn	_bbGCFree
	extrn	_bbNullObject
	extrn	_bbOnDebugEnterScope
	extrn	_bbOnDebugEnterStm
	extrn	_bbOnDebugLeaveScope
	extrn	_bbStringClass
	extrn	_brl_graphics_GraphicsHeight
	extrn	_brl_graphics_GraphicsWidth
	extrn	_brl_max2d_CreateImage
	extrn	_brl_max2d_LoadAnimImage
	extrn	_brl_max2d_LoadImage
	extrn	_brl_max2d_MidHandleImage
	extrn	_brl_max2d_SetImageHandle
	extrn	_brl_max2d_SetMaskColor
	public	__bb_main
	public	_bb_free_media
	public	_bb_fx_bloom
	public	_bb_img_back
	public	_bb_img_bloom
	public	_bb_img_gradient1
	public	_bb_img_gun
	public	_bb_img_noise
	public	_bb_img_player
	public	_bb_img_tiles
	public	_bb_img_vignette1
	public	_bb_img_vignette2
	public	_bb_init_media
	section	"code" code
__bb_main:
	push	ebp
	mov	ebp,esp
	push	ebx
	cmp	dword [_60],0
	je	_61
	mov	eax,0
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_61:
	mov	dword [_60],1
	push	ebp
	push	_47
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	call	___bb_blitz_blitz
	call	___bb_appstub_appstub
	call	___bb_audio_audio
	call	___bb_bank_bank
	call	___bb_bankstream_bankstream
	call	___bb_basic_basic
	call	___bb_bmploader_bmploader
	call	___bb_d3d7max2d_d3d7max2d
	call	___bb_d3d9max2d_d3d9max2d
	call	___bb_data_data
	call	___bb_directsoundaudio_directsoundaudio
	call	___bb_eventqueue_eventqueue
	call	___bb_freeaudioaudio_freeaudioaudio
	call	___bb_freetypefont_freetypefont
	call	___bb_gnet_gnet
	call	___bb_jpgloader_jpgloader
	call	___bb_map_map
	call	___bb_maxlua_maxlua
	call	___bb_maxutil_maxutil
	call	___bb_oggloader_oggloader
	call	___bb_openalaudio_openalaudio
	call	___bb_pngloader_pngloader
	call	___bb_retro_retro
	call	___bb_tgaloader_tgaloader
	call	___bb_threads_threads
	call	___bb_timer_timer
	call	___bb_wavloader_wavloader
	call	___bb_freejoy_freejoy
	call	___bb_freeprocess_freeprocess
	call	___bb_glew_glew
	call	___bb_macos_macos
	push	_36
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_38
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_39
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_40
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_41
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_42
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_43
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_44
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_45
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	_46
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,0
	jmp	_30
_30:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_init_media:
	push	ebp
	mov	ebp,esp
	push	ebx
	push	ebp
	push	_110
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_62
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	255
	push	0
	push	255
	call	_brl_max2d_SetMaskColor
	add	esp,12
	push	_63
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	1
	push	256
	push	0
	push	16
	push	16
	push	_22
	call	_brl_max2d_LoadAnimImage
	add	esp,24
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_tiles]
	dec	dword [eax+4]
	jnz	_67
	push	eax
	call	_bbGCFree
	add	esp,4
_67:
	mov	dword [_bb_img_tiles],ebx
	push	_68
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	7
	push	256
	push	0
	push	16
	push	16
	push	_23
	call	_brl_max2d_LoadAnimImage
	add	esp,24
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_bloom]
	dec	dword [eax+4]
	jnz	_72
	push	eax
	call	_bbGCFree
	add	esp,4
_72:
	mov	dword [_bb_img_bloom],ebx
	push	_73
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	1
	push	64
	push	0
	push	16
	push	16
	push	_24
	call	_brl_max2d_LoadAnimImage
	add	esp,24
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_player]
	dec	dword [eax+4]
	jnz	_77
	push	eax
	call	_bbGCFree
	add	esp,4
_77:
	mov	dword [_bb_img_player],ebx
	push	_78
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	1097859072
	push	0
	push	dword [_bb_img_player]
	call	_brl_max2d_SetImageHandle
	add	esp,12
	push	_79
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	1
	push	16
	push	0
	push	32
	push	32
	push	_25
	call	_brl_max2d_LoadAnimImage
	add	esp,24
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_gun]
	dec	dword [eax+4]
	jnz	_83
	push	eax
	call	_bbGCFree
	add	esp,4
_83:
	mov	dword [_bb_img_gun],ebx
	push	_84
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	dword [_bb_img_gun]
	call	_brl_max2d_MidHandleImage
	add	esp,4
	push	_85
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	6
	push	_26
	call	_brl_max2d_LoadImage
	add	esp,8
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_vignette1]
	dec	dword [eax+4]
	jnz	_89
	push	eax
	call	_bbGCFree
	add	esp,4
_89:
	mov	dword [_bb_img_vignette1],ebx
	push	_90
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	6
	push	_27
	call	_brl_max2d_LoadImage
	add	esp,8
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_vignette2]
	dec	dword [eax+4]
	jnz	_94
	push	eax
	call	_bbGCFree
	add	esp,4
_94:
	mov	dword [_bb_img_vignette2],ebx
	push	_95
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	6
	push	_28
	call	_brl_max2d_LoadImage
	add	esp,8
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_gradient1]
	dec	dword [eax+4]
	jnz	_99
	push	eax
	call	_bbGCFree
	add	esp,4
_99:
	mov	dword [_bb_img_gradient1],ebx
	push	_100
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	6
	push	64
	push	0
	push	64
	push	64
	push	_29
	call	_brl_max2d_LoadAnimImage
	add	esp,24
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_img_noise]
	dec	dword [eax+4]
	jnz	_104
	push	eax
	call	_bbGCFree
	add	esp,4
_104:
	mov	dword [_bb_img_noise],ebx
	push	_105
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	7
	push	1
	call	_brl_graphics_GraphicsHeight
	cdq
	and	edx,3
	add	eax,edx
	sar	eax,2
	add	eax,32
	push	eax
	call	_brl_graphics_GraphicsWidth
	cdq
	and	edx,3
	add	eax,edx
	sar	eax,2
	add	eax,32
	push	eax
	call	_brl_max2d_CreateImage
	add	esp,16
	inc	dword [eax+4]
	mov	ebx,eax
	mov	eax,dword [_bb_fx_bloom]
	dec	dword [eax+4]
	jnz	_109
	push	eax
	call	_bbGCFree
	add	esp,4
_109:
	mov	dword [_bb_fx_bloom],ebx
	mov	ebx,0
	jmp	_32
_32:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_free_media:
	push	ebp
	mov	ebp,esp
	push	ebx
	push	ebp
	push	_112
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	mov	ebx,0
	jmp	_34
_34:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
	section	"data" data writeable align 8
	align	4
_60:
	dd	0
_48:
	db	"media",0
_49:
	db	"img_tiles",0
_50:
	db	":TImage",0
	align	4
_bb_img_tiles:
	dd	_bbNullObject
_51:
	db	"img_bloom",0
	align	4
_bb_img_bloom:
	dd	_bbNullObject
_52:
	db	"img_back",0
	align	4
_bb_img_back:
	dd	_bbNullObject
_53:
	db	"img_gradient1",0
	align	4
_bb_img_gradient1:
	dd	_bbNullObject
_54:
	db	"img_vignette1",0
	align	4
_bb_img_vignette1:
	dd	_bbNullObject
_55:
	db	"img_vignette2",0
	align	4
_bb_img_vignette2:
	dd	_bbNullObject
_56:
	db	"img_noise",0
	align	4
_bb_img_noise:
	dd	_bbNullObject
_57:
	db	"img_player",0
	align	4
_bb_img_player:
	dd	_bbNullObject
_58:
	db	"img_gun",0
	align	4
_bb_img_gun:
	dd	_bbNullObject
_59:
	db	"fx_bloom",0
	align	4
_bb_fx_bloom:
	dd	_bbNullObject
	align	4
_47:
	dd	1
	dd	_48
	dd	4
	dd	_49
	dd	_50
	dd	_bb_img_tiles
	dd	4
	dd	_51
	dd	_50
	dd	_bb_img_bloom
	dd	4
	dd	_52
	dd	_50
	dd	_bb_img_back
	dd	4
	dd	_53
	dd	_50
	dd	_bb_img_gradient1
	dd	4
	dd	_54
	dd	_50
	dd	_bb_img_vignette1
	dd	4
	dd	_55
	dd	_50
	dd	_bb_img_vignette2
	dd	4
	dd	_56
	dd	_50
	dd	_bb_img_noise
	dd	4
	dd	_57
	dd	_50
	dd	_bb_img_player
	dd	4
	dd	_58
	dd	_50
	dd	_bb_img_gun
	dd	4
	dd	_59
	dd	_50
	dd	_bb_fx_bloom
	dd	0
_37:
	db	"D:/My Documents/Programming/Blitz/Platform2/include/media.bmx",0
	align	4
_36:
	dd	_37
	dd	1
	dd	1
	align	4
_38:
	dd	_37
	dd	2
	dd	1
	align	4
_39:
	dd	_37
	dd	3
	dd	1
	align	4
_40:
	dd	_37
	dd	5
	dd	1
	align	4
_41:
	dd	_37
	dd	7
	dd	1
	align	4
_42:
	dd	_37
	dd	8
	dd	1
	align	4
_43:
	dd	_37
	dd	10
	dd	1
	align	4
_44:
	dd	_37
	dd	12
	dd	1
	align	4
_45:
	dd	_37
	dd	13
	dd	1
	align	4
_46:
	dd	_37
	dd	15
	dd	1
_111:
	db	"init_media",0
	align	4
_110:
	dd	1
	dd	_111
	dd	0
	align	4
_62:
	dd	_37
	dd	19
	dd	2
	align	4
_63:
	dd	_37
	dd	21
	dd	2
	align	4
_22:
	dd	_bbStringClass
	dd	2147483647
	dd	21
	dw	109,101,100,105,97,47,105,109,97,103,101,47,116,105,108,101
	dw	115,46,112,110,103
	align	4
_68:
	dd	_37
	dd	22
	dd	2
	align	4
_23:
	dd	_bbStringClass
	dd	2147483647
	dd	27
	dw	109,101,100,105,97,47,105,109,97,103,101,47,116,105,108,101
	dw	115,95,98,108,111,111,109,46,112,110,103
	align	4
_73:
	dd	_37
	dd	24
	dd	2
	align	4
_24:
	dd	_bbStringClass
	dd	2147483647
	dd	22
	dw	109,101,100,105,97,47,105,109,97,103,101,47,112,108,97,121
	dw	101,114,46,112,110,103
	align	4
_78:
	dd	_37
	dd	25
	dd	2
	align	4
_79:
	dd	_37
	dd	27
	dd	2
	align	4
_25:
	dd	_bbStringClass
	dd	2147483647
	dd	20
	dw	109,101,100,105,97,47,105,109,97,103,101,47,103,117,110,115
	dw	46,112,110,103
	align	4
_84:
	dd	_37
	dd	28
	dd	2
	align	4
_85:
	dd	_37
	dd	30
	dd	2
	align	4
_26:
	dd	_bbStringClass
	dd	2147483647
	dd	25
	dw	109,101,100,105,97,47,105,109,97,103,101,47,118,105,103,110
	dw	101,116,116,101,49,46,112,110,103
	align	4
_90:
	dd	_37
	dd	31
	dd	2
	align	4
_27:
	dd	_bbStringClass
	dd	2147483647
	dd	25
	dw	109,101,100,105,97,47,105,109,97,103,101,47,118,105,103,110
	dw	101,116,116,101,50,46,112,110,103
	align	4
_95:
	dd	_37
	dd	33
	dd	2
	align	4
_28:
	dd	_bbStringClass
	dd	2147483647
	dd	25
	dw	109,101,100,105,97,47,105,109,97,103,101,47,103,114,97,100
	dw	105,101,110,116,49,46,112,110,103
	align	4
_100:
	dd	_37
	dd	35
	dd	2
	align	4
_29:
	dd	_bbStringClass
	dd	2147483647
	dd	21
	dw	109,101,100,105,97,47,105,109,97,103,101,47,110,111,105,115
	dw	101,46,112,110,103
	align	4
_105:
	dd	_37
	dd	37
	dd	2
_113:
	db	"free_media",0
	align	4
_112:
	dd	1
	dd	_113
	dd	0
