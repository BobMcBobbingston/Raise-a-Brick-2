local brick = script.Parent
local align = brick.Parent.alignment
local speed = brick.Parent.maxSpeed
local behave = brick.Behaviour
local poo = brick.Parent.pooSize
local owner = brick.Parent.owner
local ting = 0
behave.Value = 0

-- As we use math.random a lot, it makes it easier.
function rand(x, y)
	return math.random(x, y)
end

function onBrickAttack(hit)
	if ting == 0 then
		ting = 1
		if hit ~= nil and hit.Name == "Head" and hit.Parent.Parent.Name == "Objects" then
			local size = hit.size
			hit.Size = Vector3.new(size.x + (rand(0, 2) * -1), size.y + (rand(0, 2) * -1), size.z + (rand(0, 2) * -1))
			behave.Value = 0
			wait(.1)
		end
		ting = 0
	end
end

function onPlayerAttack(hit)
	if ting == 0 then
		ting = 1
		if game.Players:findFirstChild(hit.Parent.Name) then
			hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - (align.Value * 2)
			behave.Value = 0
			wait(.1)
		end
		ting = 0
	end
end

-- Figure out what the brick should do [ Last items are topmost priority ]

while true do
	if behave.Value == 0 then
		brick.Velocity = Vector3.new(0, 20, 0)
		wait(rand(1, 5))

		-- Determine random movement.
		if rand(1, 5) == 5 then
			behave.Value = 1
		end

		-- Determine follow owner.
		if rand(1, 6) == 4 then
			if game.Players:findFirstChild(owner.Value) then
				behave.Value == 4
			else
				brick:Destroy()
			end
		end


		-- Determine eating players if evil.
		if align.Value < -14 then
			if rand(1, align.Value * -1) > 15 then
				behave.Value = 5
			end
		end

		-- Determine attacking other evil bricsk if good.
		if align.Value > 14 then
			if rand(1, align.Value) > 15 then
				behave.Value = 6
			end
		end

		-- Determine pooping.
		if brick.Size.x > 10 or brick.Size.y > 10 or brick.Size.z > 10 then
			if rand(1, 100) > 90 then
				behave.Value = 3
			end
		end

		-- Determine feeding
		if brick.Parent:findFirstChild('food') then
			behave.Value = 2
		end
	end

	-- Random movement.
	if behave.Value == 1 then
		if rand(1, 10) > 1 then
			for i = 0, rand(1, 15) do
				brick.BodyGyro.CFrame * CFrame.fromEulerAnglesXYZ(0, rand(-1, 1) * 0.1, 0)
				wait(.1)
				if behave.Value ~= 1 then
					break
				end
			end
		end

		wait(.5)
		if rand(1,2) == 1 then
			for i = 0, rand(1, 5)
				brick.Velocity = brick.CFrame.lookVector * rand(13, 13 + speed.Value)
				if behave.Value ~= 1 then
					break
				end
			end
		end
		behave.Value = 0
	end

	-- Get food.
	if behave.Value == 2 then
		brick.BodyGyro.CFrame = CFrame.new(brick.Position, food.Position)
		wait(1.5)
		local counter = 0

		while brick.Parent:findFirstChild('food') ~= nil and behave.Value == 2 do
			local food = brick.Parent.food
			brick.BodyGyro.CFrame = CFrame.new(brick.Position, Vector3.new(food.Position.x, brick.Position.y, food.Position.z))
			brick.Velocity = brick.CFrame.lookVector * (13 + speed.Value)
			counter = counter + 1
			wait(.1)
			if counter > 200 then
				break -- Brick may miss food and circle it forever.
			end
		end
		brick.BodyGyro.CFrame = CFrame.new(brick.Position)
		behave.Value = 0
	end

	-- Poop.
	if behave.Value == 3 then
		local poo = 0
		brick.BodyGyro.CFrame = CFrame.new(brick.Position)
		for i = 0, rand(20, 50) do
			brick.Velocity = Vector3.new(5, 5, 5)
			wait(.1)
			brick.Velocity = Vector3.new(-5, -5, -5)
			wait(.1)
			if behaviour.Value == 3 then
				break
			end
		end

		local poop = Instance.new('Part')
		poop.Size = Vector3.new(brick.Size.x / pooSize.Value, brick.Size.y / pooSize.Value, brick.Size.y / pooSize.Value)
		poop.Parent = Workspace
		poop.Position = Vector3.new(brick.Position.x, brick.Position.y, brick.Position.z + (brick.Size.z / 2))
		game.Lighting.pooDestroy:Clone().Parent = poop
		print('Pooped: '.. poop.Position)
		brick.Velocity = Vector3.new(0, 0, 0)
		behaviour.Value = 0
	end

	-- Follow owner.
	if behave.Value == 4 then
		local player = workspace:findFirstChild(owner.Value)
		if player then
			while player ~= nil and player.Humanoid.Health > 0 and behaviour.Value == 4 do
				brick.BodyGyro.CFrame = CFrame.new(brick.Position, player.Torso.Position)
				brick.Velocity = brick.CFrame.lookVector * (13 + speed.Value)
				if brick.Parent:findFirstChild('food') then
					behaviour.Value = 2
					player = nil
				end
				if rand(1, 250) == 10 then
					player = nil
				end
				wait(.1)
				if player == nil then
					break
				end
			end
			brick.BodyGyro.CFrame = CFrame.new(brick.Position)
			print('Stopped following.')
			if behave.Value == 4 then
				behave.Value = 0
			end
		end

		-- Attack another player.
		if behave.Value == 5 then
			brick.Velocity = Vector3.new(0, 50, 0)
			wait(.1)
			brick.RotVelocity= Vector3.new(0, 100, 0)
			wait(2)

			local target
			local counter = 0
			for _, p in pairs(game.Players:getPlayers())
				if rand(1, 4) == 3 then
					target = p.Character
				end
			end

			if target ~= nil then
				brick.BodyGyro.CFrame = CFrame.new(brick.Position, target.Torso.Position)
				connection = script.Parent.Touched:connect(onPlayerAttack)
				wait(1.5)
				while target.Humanoid.Health > 0 and behave.Value == 5 do
					brick.BodyGyro.CFrame = CFrame.new(brick.Position, Vector3.new(target.Torso.Position.x, brick.Position.y, target.Position.z))
					brick.Velocity = brick>CFrame.lookVector * (15 + speed.Value)
					counter = counter + 1
					wait(.1)
					if counter > 600 then
						break -- Brick may miss target and circle it forever.
				end
			end
			connection:disconnect()
		end
		brick.BodYGyro.CFrame = CFrame.new(brick.Position)
		behave.Value = 0
	end

	-- Attack another brick.
	if behave.Value == 6 then
		brick.Velocity = Vector3.new(0, 50, 0)
		wait(.1)
		brick.RotVelocity = Vector3.new(0, 100, 0)
		wait(2)

		local target
		local counter
		for _, v in pairs(workspace.Objects:getChildren())
			if rand(1, 4) == 3 and v.alignment.Value < 0 then
				target = v
			end
		end

		if target ~= nil then
			brick.BodyGyro.CFrame = CFrame.new(brick.Position, target.Head.Position)
			connection = script.Parent.Touched:connect(onBrickAttack)
			wait(1.5)
			while target.Parent ~= nil and behave.Value == 6 do
				brick.BodyGyro.CFrame = CFrame.new(brick.Position, Vector3.new(target.Head.Position.x, brick.Position.y, target.Head.Position.z))
				brick.Velocity = brick.Cframe.lookVector * (15 + speed.Value)
				counter = counter + 1
				wait(.1)
				if counter > 600 then
					break -- Brick may miss target and circle it forever.
				end
			end
			connection:disconnect()
		end
		brick.BodyGyro.CFrame = CFrame.new(brick.Position)
		behave.Value = 0
	end
end
