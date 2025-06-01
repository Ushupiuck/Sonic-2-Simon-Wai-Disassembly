; ---------------------------------------------------------------------------
; Sprite mappings - chaos emeralds from	the special stage results screen
; ---------------------------------------------------------------------------
Map_SSRC_internal:
		dc.w byte_CE02-Map_SSRC_internal
		dc.w byte_CE08-Map_SSRC_internal
		dc.w byte_CE0E-Map_SSRC_internal
		dc.w byte_CE14-Map_SSRC_internal
		dc.w byte_CE1A-Map_SSRC_internal
		dc.w byte_CE20-Map_SSRC_internal
		dc.w byte_CE26-Map_SSRC_internal
byte_CE02:	dc.w 1
		dc.w $F805, $20, 4, $FFF8
byte_CE08:	dc.w 1
		dc.w $F805, 0,	0, $FFF8
byte_CE0E:	dc.w 1
		dc.w $F805, $40, 4, $FFF8
byte_CE14:	dc.w 1
		dc.w $F805, $60, 4, $FFF8
byte_CE1A:	dc.w 1
		dc.w $F805, $20, 8, $FFF8
byte_CE20:	dc.w 1
		dc.w $F805, $20, $C, $FFF8
byte_CE26:	dc.w 0			; Blank frame
		even