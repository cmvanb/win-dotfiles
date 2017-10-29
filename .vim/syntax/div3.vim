" DIV DX 3.0 Syntax Highlighting for Vim

if exists("b:current_syntax")
    finish
endif

" Keywords
syntax keyword div3Keywords program process begin end private const global local function repeat until loop frame if else switch from while for break continue return clone debug offset compiler_options do struct
syntax keyword div3Keywords PROGRAM PROCESS BEGIN END PRIVATE CONST GLOBAL LOCAL FUNCTION REPEAT UNTIL LOOP FRAME IF ELSE SWITCH FROM WHILE FOR BREAK CONTINUE RETURN CLONE DEBUG OFFSET COMPILER_OPTIONS DO STRUCT

" Comments
syntax keyword div3TodoComment contained TODO FIXME TBD NOTE
syntax region div3Comment start=/\/\// end=/$/ contains=div3TodoComment,@Spell extend keepend
syntax region div3Comment start=/\/\*/ end=/\*\// contains=div3TodoComment,@Spell extend keepend

" Strings
syntax region div3String start=+"+ skip=+\\\("\|$\)+ end=+"\|$+

" Numbers
syntax match div3Number /\<\d\+\%([eE][+-]\=\d\+\)\=\>\|\<0[bB][01]\+\>\|\<0[oO]\o\+\>\|\<0[xX]\x\+\>/

" Operators
"   match single-char operators:  - + % < > ! & | ^ * =
syntax match div3Operator /[-+%<>!&|^*=]/

" Special
syntax keyword div3Special _max_process _extended_conditions _simple_conditions _case_sensitive _ignore_errors _free_syntax _no_strfix _no_optimization _no_range_check _no_id_check _no_null_check _no_check

" Commands
syntax keyword div3Commands collision get_angle get_dist get_distx get_disty get_id let_me_alone signal advance fget_angle fget_dist near_angle xadvance path_find path_free path_line abs acos asin atan atan2 cos pow sin sqrt tan rand rand_seed clear_screen get_pixel map_block_copy map_get_pixel map_put map_put_pixel map_xput new_map put put_pixel put_screen screen_copy xput delete_draw draw move_draw change_channel change_sound reset_sound set_volume is_playing_sound load_pcm load_wav sound stop_sound unload_pcm unload_wav is_playing_cd play_cd stop_cd get_song_line get_song_pos is_playing_song load_song set_song_pos song stop_song unload_song get_joy_button get_joy_position key convert_palette fade fade_off fade_on find_color force_pal load_pal roll_palette set_color move_scroll refresh_scroll start_mode7 start_scroll stop_mode7 stop_scroll get_point_m8 get_sector_height get_sector_texture get_wall_texture go_to_flag load_wld set_env_color set_fog set_point_m8 set_sector_height set_sector_texture set_wall_texture start_mode8 stop_mode8 delete_text load_fnt move_text write unload_fnt write_int write_in_map char lower strcat strchr strcmp strcpy strdel strlen strset strstr upper calculate itoa end_fli frame_fli reset_fli start_fli define_region out_region get_point get_real_point graphic_info set_fps set_mode load_fpg load_map load_pcx unload_fpg unload_map unload_pcx save_map save_pcx load save fclose filelength flush fopen fread fseek ftell fwrite chdir disk_free get_dirinfo get_fileinfo getdrive mkdir remove setdrive compress_file uncompress_file decode_file encode encode_file exit ignore_error system free malloc memory_free net_get_games net_join_game

" Highlighting
let b:current_syntax = "div3"

hi def link div3Keywords Statement
hi def link div3Comment Comment
hi def link div3TodoComment Todo
hi def link div3String String
hi def link div3Number Number
hi def link div3Operator Operator
hi def link div3Special PreProc
hi def link div3Commands Type

" WIP
" Expression
"syntax cluster div3Expression contains=div3Keywords,div3Comment,div3TodoComment,div3String,div3Number,div3Operator
"
" Operators
"syntax match div3Operator /[\!\|\&\+\-\<\>\=\%\/\*\~\^]\{1}/ skipwhite skipempty nextgroup=@div3Expression
" match /
"syntax match div3Operator /[/]/
