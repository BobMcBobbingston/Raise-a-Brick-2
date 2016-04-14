print("creating ground and cloning brick")
obj = game.Workspace.Objects
temppp = obj:findFirstChild("Brick")
clon = temppp:clone()
temppp:remove()

ground = game.Workspace.Scenery.Ground
for c = 1, 3 do
	for d = 1, 3 do
		newground = ground:clone()
		newground.Size = Vector3.new(2000, 1.2, 2000)
		newground.Position = Vector3.new(-4000 + (2000 * c),0.6,(-4000 + 2000 *d))
		newground.Parent = game.Workspace.Scenery
		if (d == 1 or d == 3) or (c == 1 or c == 3) then
			check = math.random(1,2)
			if check == 1 then
				mountainsize = math.random(3,9)
				for i = 0, mountainsize do
					width = 800 - (80*i) + math.random(-50, 50)
					mountainpiece = newground:clone()
					mountainpiece.Size = Vector3.new(width, 30, width)
					mountainpiece.Position = Vector3.new(-4000 + (2000 * c),15.6 + (i*30),(-4000 + 2000 *d))
					mountainpiece.Parent = game.Workspace.Scenery
				end
			end
		end
	end
end
ground:remove()

while true do

players = game.Players:getChildren()
for i = 1, #players do
	if players[i]:findFirstChild("hasBrick") ~= nil then
	if players[i] ~= nil and players[i].hasBrick.Value ~= 1 then
		wait(3)
		local name = players[i].Name
		local newbrick = clon:clone()
		newbrick.Parent = obj
		newbrick.Owner.Value = name
		players[i].hasBrick.Value = 1
	end
	end
end
players = nil

wait(1)
end
