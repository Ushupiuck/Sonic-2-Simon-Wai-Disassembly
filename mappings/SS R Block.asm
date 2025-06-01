; ---------------------------------------------------------------------------
; Sprite mappings - special stage "R" block
; ---------------------------------------------------------------------------
Map_SS_R_internal:
		dc.w byte_1B912-Map_SS_R_internal
		dc.w byte_1B918-Map_SS_R_internal
		dc.w byte_1B91E-Map_SS_R_internal
byte_1B912:	dc.w 1
		dc.w $F40A, 0, 0, $FFF4
byte_1B918:	dc.w 1
		dc.w $F40A, 9, 4, $FFF4
byte_1B91E:	dc.w 0
		even