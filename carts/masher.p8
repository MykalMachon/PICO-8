pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- masher
-- by mykal.codes

function _init()
	main_menu_init()
end

function _update()
	if game_state == "main_menu" then
	 main_menu_update()
	end
	if game_state == "game" then
		game_update()
 end
 if game_state == "game_over" then
		game_over_update()
 end
end

function _draw()
	if game_state == "main_menu" then
	 main_menu_draw()
	end
	if game_state == "game" then
  game_draw()
	end
	if game_state == "game_over" then
		game_over_draw()
	end
end
-->8
-- gamestate manager

-- main menu
function main_menu_init()
 game_state = "main_menu"
end

function main_menu_update()
	if (btnp(❎)) then
		game_init()
	end
end

function main_menu_draw()
 cls(0)
	print("masher", 56, 48, 15)
	print("press ❎", 56, 56, 15)
end

-- start state
function game_init()
 particles_init()
	player_init()
 game_state = "game"
end

function game_update()
 -- update all the stuff
	player_update()
	particles_update()
end

function game_draw()
	 cls(0)
		player_draw()
		particles_draw()
end

-- game over state
function game_over_init()
 game_state="game_over"
end

function game_over_update()
 if (btnp(🅾️)) then
 	game_init()
 end
end

function game_over_draw()
 cls(0)
 print("game over", 24, 40, 15)
	print("score: "..player.mash_count, 24, 48, 15)
	print("press 🅾️ to play again", 24, 56, 15)
end
-->8
-- player manager
function player_init()
	player = {}
 player.mash_count = 0
 player.start_time = time()
 player.max_time = 15
 player.curr_time = time()
 player.prev_time = time()
end

function player_update()
 -- play ticking noise every second
 player.curr_time = time() - player.start_time
 if flr(player.prev_time) < flr(player.curr_time) then
  sfx(1)
 end
 player.prev_time = player.curr_time
 
 -- handle inputs
 if not ((time() - player.start_time) > player.max_time) then
  if (btnp(❎)) then
		 player.mash_count += 1
		 create_particle()
		 sfx(0)
	 end
	else
	 game_over_init()
	end
end

function player_draw()
 print("player prev time: "..player.prev_time, 0,0,15)
 print("player curr time: "..player.curr_time, 0,8,15)
	print("⧗"..player.max_time-flr(time() - player.start_time), 60, 52, 15)
	print("❎"..player.mash_count, 60, 60, 15)
end
-->8
-- particle manager

function particles_init()
	particles={}
end

function particles_update()
  for p in all(particles) do
   p:update()
  end
end

function particles_draw()
	for p in all(particles) do
		p:draw()
	end
end

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
080a0000093551b0051b00527205292052b2052d205220052f20530205302052d20527205242051d205192051620515205152051520516205172051a2051b2051100513005160051f0052e00533005300052e005
