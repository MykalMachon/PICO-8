pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
function _init()
	init_player()
	init_world()
end

function _update()
	update_player()
	update_world()
end

function _draw()
	cls(0) -- reset the screen ♥
	draw_player()
	draw_world()
end
-->8
-- player logic
function init_player()
	player={
		x=56,
		y=56,
		dx=0,
		dy=0,
		gravity=0.68,
		friction=0.3,
		sprite=1,
		last_anim=time(),
		num_sprites=3
	}
end

function update_player()
	curr_time=time()
	if curr_time-player.last_anim > 0.25 then
  player.sprite+=1
  player.last_anim=curr_time
 end
 if player.sprite > player.num_sprites then
  player.sprite-=player.num_sprites
 end
end

function draw_player()
	print("last animate: "..time() - player.last_anim, 0,0,7)
 spr(player.sprite, player.x, player.y)
end


-->8
-- world and map logic

function init_world()

end

function update_world()

end

function draw_world()
  map(0,0,0)
end
__gfx__
00000000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888800088880000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700011fff100888888008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000011fff10011fff10011fff10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000071aaa10011fff10011fff10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070007aaaaa0071aaa10071aaa10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000022222000aaaaa007aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002000200020002000200020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000122222212555555233333333313131310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000214444125544445533333333131313130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000243333425433334533333333313131310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000243333425433334533333333131313130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000243333425433334532323232313131310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000243333425433334523232323131313130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000214444125544445531313131313131310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000122222212555555213131313131313130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000111111111212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000131313131212121212001112001100111212110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000141414141313131313131313000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000141414141414141414141414000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000