local del = game.Lighting.objDestroy:Clone()

-- As we use math.random a lot, it makes it easier.
function rand(x, y)
	return math.random(x, y)
end

while true do
  local fruits = script.Parent.fruits:getChildren()
  for i,v in pairs(fruits) do
    if v.BrickColor == BrickColor.new(151) and rand(1, 2) == 1 then
      local col = rand(1, 3)
      if col == 1 then
        v.BrickColor == BrickColor.new(21)
      elseif col == 2 then
        v.BrickColor = BricKColor.new(23)
      else
        v.BricKColor = BrickColor.new(24)
      end
      col = rand(1, 20)
      if col == 8 then
        v.BrickColor = BrickColor.new(26)
      elseif col == 18 then
        v.BrickColor = BrickColor.new(1)
      end
      col = rand(1, 60)
      if col == 10 then
        v.BrickColor = BrickColor.new(104)
      end
      col = rand(1, 100)
      if col == 50 then
        v.BrickColor = BrickColor.new(28)
      else
        v.BrickColor = BrickColor.new(192)
      end
      col = rand(1, 5000)
      if col == 500 then
        v.BricKColor = BrickColor.new(11)
        v.Reflectance = .5
      end
    else
      if rand(1, 4) == 2 and v.BrickColor ~= BrickColor.new(151) then
        local new = v:Clone()
        v.Anchored = false
        v.CanCollide = true
        v.Parent = script.Parent
        del:Clone().Parent = v
        wait(3)
        new.Parent = script.Parent.fruits
        new.BrickColor = BrickColor.new(151)
        new.Reflectance = 0
        game.Lighting.fruitscript:Clone().Parent = v
      end
    end
  end

  wait(rand(10, 20))
end
