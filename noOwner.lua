game.Players.PlayerRemoving:connect(function(player)
	if player.Name == script.Parent.Parent.owner.Value then
		script.Parent.Parent:Destroy()
	end
end)
