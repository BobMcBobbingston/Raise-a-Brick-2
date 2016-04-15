wait(1)
graphic1 = "http://www.roblox.com/asset/?version=1&id=1467047"
graphic2 = "http://www.roblox.com/asset/?version=1&id=1467033"
local ting = 0

if script.Parent.Name ~= "Workspace" then
function onTouched(hit)

	if ting == 0 then
	ting = 1
	check = hit.Parent:FindFirstChild("Humanoid")

	if check ~= nil then
		local user = game.Players:findFirstChild(hit.Parent.Name)
		if user ~= nil then
		local shirt = hit.Parent:findFirstChild("Shirt Graphic")
		if script.Parent.BrickColor == BrickColor.new(21) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Red.Value = user.Red.Value + 1
			end
			end
			user.Red.Value = user.Red.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(23) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Blue.Value = user.Blue.Value + 1
			end
			end
			user.Blue.Value = user.Blue.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(24) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Yellow.Value = user.Yellow.Value + 1
			end
			end
			user.Yellow.Value = user.Yellow.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(26) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Evil.Value = user.Evil.Value + 1
			end
			end
			user.Evil.Value = user.Evil.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(1) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Good.Value = user.Good.Value + 1
			end
			end
			user.Good.Value = user.Good.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(104) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Speed.Value = user.Speed.Value + 1
			end
			end
			user.Speed.Value = user.Speed.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(28) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Red.Value = user.Red.Value + 10
			user.Blue.Value = user.Blue.Value + 10
			user.Yellow.Value = user.Yellow.Value + 10
			user.Evil.Value = user.Evil.Value + 6
			user.Good.Value = user.Good.Value + 6
			user.Speed.Value = user.Speed.Value + 3
			user.Special.Value = user.Special.Value + 1
			end
			end
			user.Red.Value = user.Red.Value + 10
			user.Blue.Value = user.Blue.Value + 10
			user.Yellow.Value = user.Yellow.Value + 10
			user.Evil.Value = user.Evil.Value + 6
			user.Good.Value = user.Good.Value + 6
			user.Speed.Value = user.Speed.Value + 3
			user.Special.Value = user.Special.Value + 1
		end
		if script.Parent.BrickColor == BrickColor.new(11) then
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Red.Value = user.Red.Value + 150
			user.Blue.Value = user.Blue.Value + 150
			user.Yellow.Value = user.Yellow.Value + 150
			user.Evil.Value = user.Evil.Value + 50
			user.Good.Value = user.Good.Value + 50
			user.Speed.Value = user.Speed.Value + 15
			user.Special.Value = user.Special.Value + 4
			end
			end
			user.Red.Value = user.Red.Value + 150
			user.Blue.Value = user.Blue.Value + 150
			user.Yellow.Value = user.Yellow.Value + 150
			user.Evil.Value = user.Evil.Value + 50
			user.Good.Value = user.Good.Value + 50
			user.Speed.Value = user.Speed.Value + 15
			user.Special.Value = user.Special.Value + 4
		end
		if script.Parent.BrickColor == BrickColor.new(192) then
			user.Special.Value = user.Special.Value + 1
			if shirt~= nil then
			if shirt.Graphic == graphic2 or shirt.Graphic == graphic1 then
			user.Special.Value = user.Special.Value + 1
			end
			end
		end

		connection:disconnect()
		script.Parent:remove()
		end
	end

	ting = 0
	end

end

connection = script.Parent.Touched:connect(onTouched)
end
