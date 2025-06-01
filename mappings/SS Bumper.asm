; ---------------------------------------------------------------------------
; Sprite mappings - pinball bumper (SYZ)
; ---------------------------------------------------------------------------
Map_Bump_internal:
		dc.w .normal-Map_Bump_internal
		dc.w .bumped1-Map_Bump_internal
		dc.w .bumped2-Map_Bump_internal
.normal:	dc.w 2
		dc.w $F007, 0, 0, $FFF0
		dc.w $F007, $800, $800, 0
.bumped1:	dc.w 2
		dc.w $F406, 8, 4, $FFF4
		dc.w $F402, $808, $804, 4
.bumped2:	dc.w 2
		dc.w $F007, $E, 7, $FFF0
		dc.w $F007, $80E, $807, 0
		even