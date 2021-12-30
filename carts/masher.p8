pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- masher
-- by mykal.codes

function _init()
	game_state="start"
	particles={} -- create basic particles table
	player_init()
end

function _update()
	if game_state == "start" then
		-- update all the stuff
		player_update()
  for p in all(particles) do
   p:update()
  end
 end
 if game_state == "done" then
 	-- todo: manage stuff
 end
end

function _draw()
	if game_state == "start" then
	 cls(0)
		player_draw()
		for p in all(particles) do
			p:draw()
		end
	end
	if game_state == "done" then
		cls(0)
		print("game over", 24, 40, 15)
		print("score: "..player.mash_count, 24, 48, 15)
		print("press ❎ to play again", 24, 56, 15)
	end
end
-->8
-- player manager
function player_init()
	player = {}
 player.mash_count = 0
 player.curr_time = time()
 player.max_time = 15
end

function player_update()
 if not ((time() - player.curr_time) > player.max_time) then
  if (btnp(❎) or btnp(🅾️)) then
		 player.mash_count += 1
		 create_particle()
		 sfx(0)
	 end
	else
	 game_state = "done"
	end
end

function player_draw()
	print("⧗"..player.max_time-flr(time() - player.curr_time), 60, 52, 15)
	print("❎"..player.mash_count, 60, 60, 15)
end
-->8
-- homescreen manager
-->8
-- particle manager

function create_particle(x,y,col)
	add(particles,{
	  x=64,
	  y=64,
	  dx=(rnd(2)-1)*2,
	  dy=(rnd(2)-1)*2,
	  life=rnd(30)+15, -- particle exists for at least 15 frames b
	  col=flr(rnd(14))+1,
	  update=function(self)
	  	self.x += self.dx
	  	self.y += self.dy
	  	self.life-=1
	  	if self.life<0 then
	  		del(particles, self)
	  	end
	  end,
	  draw=function(self)
	   pset(self.x, self.y, self.col)
	  end,
	})
end
__gfx__
000000000bb00bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbbbb00bb00bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000bb1b1b00bbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000bbbbbb00bb1b1b00bb00bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000bbbbbb00bbbbbb00bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000bbbbbb00bbbbbb00bb1b1b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbbbb00bbbbbb00bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000030000300300003003000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00050000175201e030070400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000038205180551d05522055270552b0552e055290551d05516055180551b0551d055220551120522055220551f055220550c205240552705516205270551a20529055290552705527055173051a3050e205
