; ---------------------------------------------------------------------------
; Constants
; ---------------------------------------------------------------------------

; VDP addressses
vdp_data_port:		equ $C00000
vdp_control_port:	equ $C00004
vdp_counter:		equ $C00008

psg_input:		equ $C00011

; Z80 addresses
z80_ram:		equ $A00000	; start of Z80 RAM
z80_dac3_pitch:		equ $A000EA
z80_dac_status:		equ $A01FFD
z80_dac_sample:		equ $A01FFF
z80_ram_end:		equ $A02000	; end of non-reserved Z80 RAM
z80_version:		equ $A10001
z80_port_1_data:	equ $A10002
z80_port_1_control:	equ $A10008
z80_port_2_control:	equ $A1000A
z80_expansion_control:	equ $A1000C
z80_bus_request:	equ $A11100
z80_reset:		equ $A11200
ym2612_a0:		equ $A04000
ym2612_d0:		equ $A04001
ym2612_a1:		equ $A04002
ym2612_d1:		equ $A04003

security_addr:		equ $A14000

; VRAM data
vram_fg:	equ $C000	; foreground namespace
vram_bg:	equ $E000	; background namespace
vram_sonic:	equ $F000	; Sonic graphics
vram_sprites:	equ $F800	; sprite table
vram_hscroll:	equ $FC00	; horizontal scroll table

; Game modes
; id_Sega:	equ ptr_GM_Sega-GameModeArray	; $00
; id_Title:	equ ptr_GM_Title-GameModeArray	; $04
; id_Demo:	equ ptr_GM_Demo-GameModeArray	; $08
; id_Level:	equ ptr_GM_Level-GameModeArray	; $0C
; id_Special:	equ ptr_GM_Special-GameModeArray; $10
; id_Continue:	equ ptr_GM_Cont-GameModeArray	; $14
; id_Ending:	equ ptr_GM_Ending-GameModeArray	; $18
; id_Credits:	equ ptr_GM_Credits-GameModeArray; $1C

; Levels
id_GHZ:		equ 0
id_LZ:		equ 1
id_MZ:		equ 2
id_SLZ:		equ 3
id_SYZ:		equ 4
id_SBZ:		equ 5
id_EndZ:	equ 6
id_SS:		equ 7

; Colours
cBlack:		equ $000		; colour black
cWhite:		equ $EEE		; colour white
cBlue:		equ $E00		; colour blue
cGreen:		equ $0E0		; colour green
cRed:		equ $00E		; colour red
cYellow:	equ cGreen+cRed		; colour yellow
cAqua:		equ cGreen+cBlue	; colour aqua
cMagenta:	equ cBlue+cRed		; colour magenta

; Joypad input
btnStart:	equ %10000000 ; Start button	($80)
btnA:		equ %01000000 ; A		($40)
btnC:		equ %00100000 ; C		($20)
btnB:		equ %00010000 ; B		($10)
btnR:		equ %00001000 ; Right		($08)
btnL:		equ %00000100 ; Left		($04)
btnDn:		equ %00000010 ; Down		($02)
btnUp:		equ %00000001 ; Up		($01)
btnDir:		equ %00001111 ; Any direction	($0F)
btnABC:		equ %01110000 ; A, B or C	($70)
bitStart:	equ 7
bitA:		equ 6
bitC:		equ 5
bitB:		equ 4
bitR:		equ 3
bitL:		equ 2
bitDn:		equ 1
bitUp:		equ 0

; Object variables
obRender	= render_flags	; bitfield for x/y flip, display mode
obGfx		= art_tile	; palette line & VRAM setting (2 bytes)
obMap		= mappings	; mappings address (4 bytes)
obX		= x_pos		; x-axis position (2-4 bytes)
obScreenY	= y_pixel	; y-axis position for screen-fixed items (2 bytes)
obY		= y_pos		; y-axis position (2-4 bytes)
obVelX		= x_vel		; x-axis velocity (2 bytes)
obVelY		= y_vel		; y-axis velocity (2 bytes)
obInertia	= inertia	; potential speed (2 bytes)
obHeight	= y_radius	; height/2
obWidth		= x_radius	; width/2
obPriority	= priority	; sprite stack priority -- 0 is front
obActWid	= width_pixels	; action width
obFrame		= mapping_frame	; current frame displayed
obAniFrame	= anim_frame	; current frame in animation script
obAnim		= anim		; current animation
obNextAni	= prev_anim	; prev animation
obTimeFrame	= anim_frame_duration	; time to next frame
;obDelayAni	equ $1F		; time to delay animation
obColType	= collision_flags	; collision response type
obColProp	= collision_property	; collision extra property
obStatus	= status	; orientation or mode
obRespawnNo	= respawn_index	; respawn list index number
obRoutine	= routine	; routine number
ob2ndRout	= routine_secondary	; secondary routine number
obAngle		= angle		; angle
obSubtype	= subtype	; object subtype
obSolid		equ ob2ndRout ; solid status flag
; Object variables used by Sonic
flashtime	= invulnerable_time	; time between flashes after getting hit
invtime		= invincibility_time	; time left for invincibility
shoetime	= speedshoes_time	; time left for speed shoes
standonobject:	equ $3D	; object Sonic stands on
; Animation flags
afEnd:		equ $FF	; return to beginning of animation
afBack:		equ $FE	; go back (specified number) bytes
afChange:	equ $FD	; run specified animation
afRoutine:	equ $FC	; increment routine counter
afReset:	equ $FB	; reset animation and 2nd object routine counter
af2ndRoutine:	equ $FA	; increment 2nd routine counter
; ---------------------------------------------------------------------------
; Background music
; bgm__First:	equ $81
; bgm_GHZ:	equ ((ptr_mus81-MusicIndex)/4)+bgm__First
; bgm_LZ:		equ ((ptr_mus82-MusicIndex)/4)+bgm__First
; bgm_MZ:		equ ((ptr_mus83-MusicIndex)/4)+bgm__First
; bgm_SLZ:	equ ((ptr_mus84-MusicIndex)/4)+bgm__First
; bgm_SYZ:	equ ((ptr_mus85-MusicIndex)/4)+bgm__First
; bgm_SBZ:	equ ((ptr_mus86-MusicIndex)/4)+bgm__First
; bgm_Invincible:	equ ((ptr_mus87-MusicIndex)/4)+bgm__First
; bgm_ExtraLife:	equ ((ptr_mus88-MusicIndex)/4)+bgm__First
; bgm_SS:		equ ((ptr_mus89-MusicIndex)/4)+bgm__First
; bgm_Title:	equ ((ptr_mus8A-MusicIndex)/4)+bgm__First
; bgm_Ending:	equ ((ptr_mus8B-MusicIndex)/4)+bgm__First
; bgm_Boss:	equ ((ptr_mus8C-MusicIndex)/4)+bgm__First
; bgm_FZ:		equ ((ptr_mus8D-MusicIndex)/4)+bgm__First
; bgm_GotThrough:	equ ((ptr_mus8E-MusicIndex)/4)+bgm__First
; bgm_GameOver:	equ ((ptr_mus8F-MusicIndex)/4)+bgm__First
; bgm_Continue:	equ ((ptr_mus90-MusicIndex)/4)+bgm__First
; bgm_Credits:	equ ((ptr_mus91-MusicIndex)/4)+bgm__First
; bgm_Drowning:	equ ((ptr_mus92-MusicIndex)/4)+bgm__First
; bgm_Emerald:	equ ((ptr_mus93-MusicIndex)/4)+bgm__First
; bgm__Last:	equ ((ptr_musend-MusicIndex-4)/4)+bgm__First
; 
; Sound effects
; sfx__First:	equ $A0
; sfx_Jump:	equ ((ptr_sndA0-SoundIndex)/4)+sfx__First
; sfx_Lamppost:	equ ((ptr_sndA1-SoundIndex)/4)+sfx__First
; sfx_A2:		equ ((ptr_sndA2-SoundIndex)/4)+sfx__First
; sfx_Death:	equ ((ptr_sndA3-SoundIndex)/4)+sfx__First
; sfx_Skid:	equ ((ptr_sndA4-SoundIndex)/4)+sfx__First
; sfx_A5:		equ ((ptr_sndA5-SoundIndex)/4)+sfx__First
; sfx_HitSpikes:	equ ((ptr_sndA6-SoundIndex)/4)+sfx__First
; sfx_Push:	equ ((ptr_sndA7-SoundIndex)/4)+sfx__First
; sfx_SSGoal:	equ ((ptr_sndA8-SoundIndex)/4)+sfx__First
; sfx_SSItem:	equ ((ptr_sndA9-SoundIndex)/4)+sfx__First
; sfx_Splash:	equ ((ptr_sndAA-SoundIndex)/4)+sfx__First
; sfx_AB:		equ ((ptr_sndAB-SoundIndex)/4)+sfx__First
; sfx_HitBoss:	equ ((ptr_sndAC-SoundIndex)/4)+sfx__First
; sfx_Bubble:	equ ((ptr_sndAD-SoundIndex)/4)+sfx__First
; sfx_Fireball:	equ ((ptr_sndAE-SoundIndex)/4)+sfx__First
; sfx_Shield:	equ ((ptr_sndAF-SoundIndex)/4)+sfx__First
; sfx_Saw:	equ ((ptr_sndB0-SoundIndex)/4)+sfx__First
; sfx_Electric:	equ ((ptr_sndB1-SoundIndex)/4)+sfx__First
; sfx_Drown:	equ ((ptr_sndB2-SoundIndex)/4)+sfx__First
; sfx_Flamethrower:equ ((ptr_sndB3-SoundIndex)/4)+sfx__First
; sfx_Bumper:	equ ((ptr_sndB4-SoundIndex)/4)+sfx__First
; sfx_Ring:	equ ((ptr_sndB5-SoundIndex)/4)+sfx__First
; sfx_SpikesMove:	equ ((ptr_sndB6-SoundIndex)/4)+sfx__First
; sfx_Rumbling:	equ ((ptr_sndB7-SoundIndex)/4)+sfx__First
; sfx_B8:		equ ((ptr_sndB8-SoundIndex)/4)+sfx__First
; sfx_Collapse:	equ ((ptr_sndB9-SoundIndex)/4)+sfx__First
; sfx_SSGlass:	equ ((ptr_sndBA-SoundIndex)/4)+sfx__First
; sfx_Door:	equ ((ptr_sndBB-SoundIndex)/4)+sfx__First
; sfx_Teleport:	equ ((ptr_sndBC-SoundIndex)/4)+sfx__First
; sfx_ChainStomp:	equ ((ptr_sndBD-SoundIndex)/4)+sfx__First
; sfx_Roll:	equ ((ptr_sndBE-SoundIndex)/4)+sfx__First
; sfx_Continue:	equ ((ptr_sndBF-SoundIndex)/4)+sfx__First
; sfx_Basaran:	equ ((ptr_sndC0-SoundIndex)/4)+sfx__First
; sfx_BreakItem:	equ ((ptr_sndC1-SoundIndex)/4)+sfx__First
; sfx_Warning:	equ ((ptr_sndC2-SoundIndex)/4)+sfx__First
; sfx_GiantRing:	equ ((ptr_sndC3-SoundIndex)/4)+sfx__First
; sfx_Bomb:	equ ((ptr_sndC4-SoundIndex)/4)+sfx__First
; sfx_Cash:	equ ((ptr_sndC5-SoundIndex)/4)+sfx__First
; sfx_RingLoss:	equ ((ptr_sndC6-SoundIndex)/4)+sfx__First
; sfx_ChainRise:	equ ((ptr_sndC7-SoundIndex)/4)+sfx__First
; sfx_Burning:	equ ((ptr_sndC8-SoundIndex)/4)+sfx__First
; sfx_Bonus:	equ ((ptr_sndC9-SoundIndex)/4)+sfx__First
; sfx_EnterSS:	equ ((ptr_sndCA-SoundIndex)/4)+sfx__First
; sfx_WallSmash:	equ ((ptr_sndCB-SoundIndex)/4)+sfx__First
; sfx_Spring:	equ ((ptr_sndCC-SoundIndex)/4)+sfx__First
; sfx_Switch:	equ ((ptr_sndCD-SoundIndex)/4)+sfx__First
; sfx_RingLeft:	equ ((ptr_sndCE-SoundIndex)/4)+sfx__First
; sfx_Signpost:	equ ((ptr_sndCF-SoundIndex)/4)+sfx__First
; sfx__Last:	equ ((ptr_sndend-SoundIndex-4)/4)+sfx__First
; 
; Special sound effects
; spec__First:	equ $D0
; sfx_Waterfall:	equ ((ptr_sndD0-SpecSoundIndex)/4)+spec__First
; spec__Last:	equ ((ptr_specend-SpecSoundIndex-4)/4)+spec__First
; 
; flg__First:	equ $E0
; bgm_Fade:	equ ((ptr_flgE0-Sound_ExIndex)/4)+flg__First
; sfx_Sega:	equ ((ptr_flgE1-Sound_ExIndex)/4)+flg__First
; bgm_Speedup:	equ ((ptr_flgE2-Sound_ExIndex)/4)+flg__First
; bgm_Slowdown:	equ ((ptr_flgE3-Sound_ExIndex)/4)+flg__First
; bgm_Stop:	equ ((ptr_flgE4-Sound_ExIndex)/4)+flg__First
; flg__Last:	equ ((ptr_flgend-Sound_ExIndex-4)/4)+flg__First