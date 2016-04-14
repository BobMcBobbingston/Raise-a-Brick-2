local align = script.Parent.Parent.alignment
local speed = script.Parent.Parent.maxSpeed
local poo = script.Parent.Parent.pooSize
local eating = 0

function onTouch(hit)
  if eating == 0 then
    eating = 1

    if hit.Name == 'food' then
      local size = script.Parent.Size
      if hit.BrickColor == BrickColor.new(21) then
        hit:Destroy()
        script.Parent.Size = Vector3.new(size.x, size.y + .4, size.z)
      elseif hit.BrickColor == BrickColor.new(23) then
        hit:Destroy()
        script.Parent.Size = Vector3.new(size.x, size.y, size.z + 1)
      elseif hit.BrickColor == BrickColor.new(24) then
        hit:Destroy()
        script.Parent.Size = Vector3.new(size.x + 1, size.y, size.z)
      elseif hit.BrickColor == BrickColor.new(26) then
        hit:Destroy()
        align.Value = align.Value - 1
      elseif hit.BrickColor == BrickColor.new(1) then
        hit:Destroy()
        align.Value = align.Value + 1
      elseif hit.BrickColor == BrickColor.new(104) then
        hit:Destroy()
        sp.Value = sp.Value + 1
      elseif hit.BrickColor == BrickColor.new(192) then
        hit:Destroy()
        if poo.Value > 1 then
          poo.Value = poo.Value - 1
        end
      end
    end

    local names = {'Tele', 'FruitPalm', 'Scenery', 'fruits', 'Objects', 'SpawnLocation'}
    if align.Value < -49 and hit.Parent ~= nil then
      for i,v in pairs(names) do
        if hit.Parent.Name == v.Name then
          break
        end
      end
      hit:Destroy()
    end
  eating = 0
  end
end

script.Parent.Touched:connect(onTouch)
