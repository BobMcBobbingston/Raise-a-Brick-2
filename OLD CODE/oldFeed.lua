wait(0.1)
script.Parent.Parent.Name = script.Parent.Parent.Owner.Value .. "s Brick"
brick = script.Parent
alignment = brick.Parent.alignment
maxspd = brick.Parent.maxSpeed
group = brick.Parent.Parent
behaviour = brick.Behaviour
behaviour.Value = 0
poosize = brick.Parent.poosize
owner = brick.Parent.Owner
local ting = 0

function onBrickAttack(hit)
if ting == 0 then
ting = 1
if hit ~= nil then
if hit.Name == "Head" and hit.Parent.Parent.Name == "Objects" then
	local s = { hit.Size }
	local x = s[1].x + (math.random(0,2) * -1)
	local y = s[1].y + (math.random(0,2) * -1)
	local z = s[1].z + (math.random(0,2) * -1)
	hit.Size = Vector3.new(x,y,z)
	behaviour.Value = 0
	wait(0.1)
end
end
ting = 0
end
end

function onPlayerAttack(hit)
if ting == 0 then
ting = 1
local check = game.Players:findFirstChild(hit.Parent.Name)
if check ~= nil then
	hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - (alignment.Value * 2)
	behaviour.Value = 0
	wait(0.1)
end
ting = 0
end
end

while true do

--Figure out what the brick should do (last items are topmost priority)
if behaviour.Value == 0 then
	brick.Velocity = Vector3.new(0,20,0)
	wait(math.random(1,5))

	--determine random movement
	if math.random(1,5) == 5 then
		behaviour.Value = 1
	end

	--determine follow owner
	if math.random(1,6) == 4 then
		local test = game.Players:findFirstChild(owner.Value)
		if test ~= nil then
			behaviour.Value = 4
		else
			brick.CanCollide = false
			wait(0.5)
			brick.Parent:remove()
		end
	end

	--determine eating players if evil
	if alignment.Value < -14 then
		if math.random(1,alignment.Value * -1) > 15 then
		behaviour.Value = 5
		end
	end

	--determine attacking other evil bricks if good
	if alignment.Value > 14 then
		if math.random(1,alignment.Value) > 15 then
		behaviour.Value = 6
		end
	end

	--determine pooping
	local siz = {brick.Size}
	local x = siz[1].x
	local y = siz[1].y
	local z = siz[1].z
	if x > 10 or (y > 10 or z > 10) then
		if math.random(1,100) > 90 then
			behaviour.Value = 3
		end
	end

	--determine feeding
	food = brick.Parent:findFirstChild("food")
	if food ~= nil then
		behaviour.Value = 2
	end
end

--Random movement
if behaviour.Value == 1 then
	if math.random(1,10) ~= 1 then
	local y = math.random(-1,1)*0.1
	local i
	for i = 0, math.random(1,15) do
		brick.BodyGyro.cframe=brick.BodyGyro.cframe * CFrame.fromEulerAnglesXYZ(0, y, 0)
		wait(0.1)
		if behaviour.Value ~= 1 then break end
	end
	end
	wait(0.5)
	if math.random(1,2) == 1 then
	for i = 0, math.random(1,5) do
		brick.Velocity = brick.CFrame.lookVector * math.random(13,13 + maxspd.Value)
		if behaviour.Value ~= 1 then break end
	end
	end
	behaviour.Value = 0
end

--Get food
if behaviour.Value == 2 then
	brick.BodyGyro.cframe=CFrame.new(brick.Position, food.Position)
	wait(1.5)
	local counter = 0
	while food.Parent ~= nil and behaviour.Value == 2 do
		local foodpos = {food.Position}
		local fx = foodpos[1].x
		local fz = foodpos[1].z
		local brickpos = {brick.Position}
		local by = brickpos[1].y
		brick.BodyGyro.cframe=CFrame.new(brick.Position, Vector3.new(fx,by,fz))
		brick.Velocity = brick.CFrame.lookVector * (13 + maxspd.Value)
		counter = counter + 1
		wait(0.1)
		if counter > 200 then
			break --in case of eternal food-chasing (brick may miss food and circle it forever)
		end
	end
	brick.BodyGyro.cframe=CFrame.new(brick.Position)
	behaviour.Value = 0
end

--Poop
if behaviour.Value == 3 then
	brick.BodyGyro.cframe=CFrame.new(brick.Position)
	local i
	local poo = 0
	for i = 0, math.random(20,50) do
		brick.Velocity = Vector3.new(5,5,5)
		wait(0.1)
		brick.Velocity = Vector3.new(-5, 5,-5)
		wait(0.1)
		if behaviour.Value ~= 3 then break end
	end
	local siz = {brick.Position}
	local x = siz[1].x
	local y = siz[1].y
	local z = siz[1].z
	local siz = {brick.Size}
	local xx = siz[1].x
	local yy = siz[1].y
	local zz = siz[1].z
	local poop = Instance.new("Part")
	poop.Size = Vector3.new(xx/poosize.Value,yy/poosize.Value,zz/poosize.Value)
	poop.Parent = game.Workspace
	poop.Position = Vector3.new(x,y,z+(zz/2))
	game.Workspace.pooremover:clone().Parent = poop
	print(poop.Position)
	print("Pooped")
	brick.Velocity = Vector3.new(0,0,0)
	behaviour.Value = 0
end

--follow owner
if behaviour.Value == 4 then
	player = game.Workspace:findFirstChild(owner.Value)
	if player ~= nil then
	while player.Humanoid.Health > 0 and behaviour.Value == 4 do
		food = brick.Parent:findFirstChild("food")
		brick.BodyGyro.cframe=CFrame.new(brick.Position, player.Torso.Position)
		brick.Velocity = brick.CFrame.lookVector * (13 + maxspd.Value)
		if food ~= nil then
			behaviour.Value = 2
			player = nil
		end
		if math.random(1,250) == 10 then
			player = nil
		end
		wait(0.1)
		if player == nil then break end
	end
	end
	brick.BodyGyro.cframe=CFrame.new(brick.Position)
	print("stopped following")
	if behaviour.Value == 4 then behaviour.Value = 0 end
end

--Attack another Player
if behaviour.Value == 5 then
	brick.Velocity = Vector3.new(0,50,0)
	wait(0.1)
	brick.RotVelocity = Vector3.new(0,100,0)
	wait(2)
	local target
	local c = game.Players:getChildren()
	for i = 1, #c do
		if math.random(1,4) == 3 then
			target = game.Workspace:findFirstChild(c[i].Name)
		end
	end

	if target ~= nil then
	brick.BodyGyro.cframe=CFrame.new(brick.Position, target.Torso.Position)
	connection = script.Parent.Touched:connect(onPlayerAttack)
	wait(1.5)
	local counter = 0
	while target.Humanoid.Health > 0 and behaviour.Value == 5 do
		local foodpos = {target.Torso.Position}
		local fx = foodpos[1].x
		local fz = foodpos[1].z
		local brickpos = {brick.Position}
		local by = brickpos[1].y
		brick.BodyGyro.cframe=CFrame.new(brick.Position, Vector3.new(fx,by,fz))
		brick.Velocity = brick.CFrame.lookVector * (15 + maxspd.Value)
		counter = counter + 1
		wait(0.1)
		if counter > 600 then
			break --in case of eternal chasing (brick may miss target and circle it forever)
		end
	end
	connection:disconnect()
	end
	brick.BodyGyro.cframe=CFrame.new(brick.Position)
	behaviour.Value = 0
end

--Attack another Brick
if behaviour.Value == 6 then
	brick.Velocity = Vector3.new(0,50,0)
	wait(0.1)
	brick.RotVelocity = Vector3.new(0,100,0)
	wait(2)
	local target
	local c = game.Workspace.Objects:getChildren()
	for i = 1, #c do
		if math.random(1,4) == 3 and c[i].alignment.Value < 0 then
			target = c[i]
		end
	end
	if target ~= nil then
	brick.BodyGyro.cframe=CFrame.new(brick.Position, target.Head.Position)
	connection = script.Parent.Touched:connect(onBrickAttack)
	wait(1.5)
	local counter = 0
	while target.Parent ~= nil and behaviour.Value == 6 do
		local foodpos = {target.Head.Position}
		local fx = foodpos[1].x
		local fz = foodpos[1].z
		local brickpos = {brick.Position}
		local by = brickpos[1].y
		brick.BodyGyro.cframe=CFrame.new(brick.Position, Vector3.new(fx,by,fz))
		brick.Velocity = brick.CFrame.lookVector * (15 + maxspd.Value)
		counter = counter + 1
		wait(0.1)
		if counter > 600 then
			break --in case of eternal chasing (brick may miss target and circle it forever)
		end
	end
	connection:disconnect()
	end
	brick.BodyGyro.cframe=CFrame.new(brick.Position)
	behaviour.Value = 0
end

end
