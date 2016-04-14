function onPlayerEntered(newPlayer)
	wait(.5)

	local color = Instance.new("IntValue")
	color.Name = "Red"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Blue"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Yellow"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Good"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Evil"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Speed"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "Special"
	color.Value = 0
	color.Parent = newPlayer

	color = Instance.new("IntValue")
	color.Name = "hasBrick"
	color.Value = 0
	color.Parent = newPlayer
end

game.Players.ChildAdded:connect(onPlayerEntered)
