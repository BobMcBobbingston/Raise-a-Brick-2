local ting = 0

if script.Parent:isA('BasePart') then

	function onTouched(hit)
		if ting == 0 then
			ting = 1
			local player = game.Players:findFirstChild(hit.Parent.Name)
			if hit.Parent:findFirstChild('Humanoid') and player then
				if script.Parent.BrickColor == BrickColor.new(21) then
					player.Red.Value = player.Red.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(23) then
					player.Blue.Value = player.Blue.Value + 1
				elseif script.Parent.BrickColor = BrickColor.new(24) then
					player.Yellow.Value = player.Yellow.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(26) then
					player.Evil.Value = player.Evil.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(1) then
					player.Good.Value = player.Good.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(104) then
					player.Speed.Value = player.Speed.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(28) then
					player.Red.Value = Player.Red.Value + 10
					player.Blue.Value = Player.Blue.Value + 10
					player.Yellow.Value = Player.Yellow.Value + 10
					player.Evil.Value = Player.Bad.Value + 6
					player.Good.Value = Player.Good.Value + 6
					player.Speed.Value = Player.Speed.Value + 3
					player.Special.Value = Player.Special.Value + 1
				elseif script.Parent.BrickColor == BrickColor.new(11) then
					player.Red.Value = Player.Red.Value + 150
					player.Blue.Value = Player.Blue.Value + 150
					player.Yellow.Value = Player.Yellow.Value + 150
					player.Evil.Value = Player.Bad.Value + 50
					player.Good.Value = Player.Good.Value + 50
					player.Speed.Value = Player.Speed.Value + 15
					player.Special.Value = Player.Special.Value + 4
				elseif script.Parent.BrickColor == BrickColor.new(192) then
					player.Special.Value = player.Special.Value + 1
				end
			end
			ting = 0
			connection:Disconnect()
			script.Parent:Destroy()
		end
	end
	connection = script.Parent.Touched:connect(onTouched)
end
