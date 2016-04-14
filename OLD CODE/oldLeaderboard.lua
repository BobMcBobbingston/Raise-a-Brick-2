print("Community Leaderboard script loaded")


function onPlayerEntered(newPlayer)

	local stats = Instance.new("IntValue")
	stats.Name = "leaderstats"

	local mins = Instance.new("IntValue")
	mins.Name = "Credits"
	mins.Value = 0


	mins.Parent = stats

	stats.Parent = newPlayer

	while true do
		wait(10)
		mins.Value = mins.Value + 1
	end
end



game.Players.ChildAdded:connect(onPlayerEntered)
