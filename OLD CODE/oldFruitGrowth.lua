wait(1)
rem = game.Workspace.pooremover:clone()
tree = script.Parent

while true do
c = tree.fruits:getChildren()
for i = 1, #c do
if c[i].BrickColor == BrickColor.new(151) and math.random(1,2) == 1 then
	local col = math.random(1,3)
	if col == 1 then c[i].BrickColor = BrickColor.new(21) end
	if col == 2 then c[i].BrickColor = BrickColor.new(23) end
	if col == 3 then c[i].BrickColor = BrickColor.new(24) end
	col = math.random(1,20)
	if col == 8 then c[i].BrickColor = BrickColor.new(26) end
	if col == 18 then c[i].BrickColor = BrickColor.new(1) end
	col = math.random(1,60)
	if col == 10 then c[i].BrickColor = BrickColor.new(104) end
	col = math.random(1,100)
	if col == 50 then c[i].BrickColor = BrickColor.new(28) end
	if col == 60 then c[i].BrickColor = BrickColor.new(192) end
	col = math.random(1,5000)
	if col == 500 then
	c[i].BrickColor = BrickColor.new(11)
	c[i].Reflectance = 0.5
	end
else
	if math.random(1,4) == 2 and c[i].BrickColor ~= BrickColor.new(151) then
	local new = c[i]:clone()
	c[i].Anchored = false
	c[i].CanCollide = true
	c[i].Parent = tree
	rem:clone().Parent = c[i]
	wait(3)
	new.Parent = tree.fruits
	new.BrickColor = BrickColor.new(151)
	new.Reflectance = 0
	game.Workspace.fruitscript:clone().Parent = c[i]
	end
end
end

wait(math.random(10,20))
end
