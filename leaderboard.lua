function onPlayerEntered(newPlayer)
  local stats = Instance.new('Model')
  stats.Name = 'leaderstats'

  local credits = Instance.new('IntValue')
  credits.Name = 'Credits'
  credits.Value = 0
  credits.Parent = stats

  stats.Parent = newPlayer

  while wait(10) do
    credits.Value = credits.Value + 1
    -- This method is exploitable.
    -- But who cares; It's a "Raise a Brick" game.
  end
end

game.Players.ChildAdded:connect(onPlayerEntered)
