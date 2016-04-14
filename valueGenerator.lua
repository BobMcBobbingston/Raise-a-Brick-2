values = {'Red', 'Blue', 'Yellow', 'Good', 'Evil', 'Speed', 'Special', 'hasBrick'}

function onPlayerEntered(newPlayer)
	wait(.5)
	for i,v in pairs(values) do
		local inst = Instance.new('IntValue')
		inst.Name = v
		inst.Value = 0
		inst.Parent = newPlayer
	end
end

game.Players.ChildAdded:connect(onPlayerEntered)
