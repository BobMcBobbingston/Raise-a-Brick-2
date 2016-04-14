al = script.Parent.Parent.alignment
sp = script.Parent.Parent.maxSpeed
poo = script.Parent.Parent.poosize
local ting = 0

function onTouch(hit)
if ting == 0 then
ting = 1

if hit.Name == "food" then
	if hit.BrickColor == BrickColor.new(21) then
		local s = { script.Parent.Size }
		local x = s[1].x
		local y = s[1].y + 0.4
		local z = s[1].z
		hit:remove()
		script.Parent.Size = Vector3.new(x,y,z)
	end
	if hit.BrickColor == BrickColor.new(23) then
		local s = { script.Parent.Size }
		local x = s[1].x
		local y = s[1].y
		local z = s[1].z + 1
		hit:remove()
		script.Parent.Size = Vector3.new(x,y,z)
		hit:remove()
	end
	if hit.BrickColor == BrickColor.new(24) then
		local s = { script.Parent.Size }
		local x = s[1].x + 1
		local y = s[1].y
		local z = s[1].z
		hit:remove()
		script.Parent.Size = Vector3.new(x,y,z)
	end
	if hit.BrickColor == BrickColor.new(26) then
		al.Value = al.Value - 1
		hit:remove()
	end
	if hit.BrickColor == BrickColor.new(1) then
		al.Value = al.Value + 1
		hit:remove()
	end
	if hit.BrickColor == BrickColor.new(104) then
		sp.Value = sp.Value + 1
		hit:remove()
	end
	if hit.BrickColor == BrickColor.new(192) then
		if poo.Value > 1 then poo.Value = poo.Value -1 end
		hit:remove()
	end
end

if al.Value < -49 and hit.Parent ~= nil then
	if hit.Parent.Name ~= "Tele" and hit.Parent.Name ~= "FruitPalm" then
	if hit.Parent.Name ~= "Scenery" and hit.Parent.Parent.Name ~= "Scenery" then
	if hit.Parent.Name ~= "fruits" and hit.Parent.Parent.Name ~= "Objects" then
	if hit.Parent.Name ~= "SpawnLocation" then
	hit:remove()
	wait(1)
	end
	end
	end
	end
end

ting = 0
end
end

script.Parent.Touched:connect(onTouch)
