; ---------------------------------------------------------------------------
; Sprite mappings - special stage "UP" block
; ---------------------------------------------------------------------------
Map_SS_Up_internal:
		dc.w byte_1B944-Map_SS_Up_internal
		dc.w byte_1B94A-Map_SS_Up_internal
byte_1B944:	dc.w 1
		dc.w $F40A, 0, 0, $FFF4
byte_1B94A:	dc.w 1
		dc.w $F40A, $12, 9, $FFF4
		even