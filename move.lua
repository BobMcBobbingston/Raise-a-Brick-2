local brick = script.Parent
local alignment = brick.Parent.alignment
local speed = brick.Parent.maxSpeed
local group = brick.Parent.Parent
local behaviour = brick.behaviour
local pooSize = brick.Parent.pooSize
local owner = brick.Parent.Owner
local ting = 0

behaviour.Value = 0
brick.Parent.Name = owner.Value .. "'s Brick"

function onBrickAttack(hit) -- Brick A attempts to attack Brick B
  if ting == 0 then -- To stop it from destroying a brick in less than a second.
    ting = 1
    if hit ~= nil and hit.Name == "Head" and hit.Parent.Parent.Name == "Objects" then -- If it hits a brick.
      local s = hit.Size
      local x = s.x + (math.random(0,2) * -1)
      local y = s.y + (math.random(0,2) * -1)
      local z = s.z + (math.random(0,2) * -1)
      hit.Size = Vector3.new(x,y,z) -- Make Brick B slightly smaller.
      behaviour.Value = 0 -- Reset the behaviour to 0.
      wait()
    end
  end
  ting = 0
end

function onPlayerAttack(hit)
  if ting == 0 then
    ting = 1
    if game.Players:findFirstChild(hit.Parent.Name) then
      local player = hit.Parent
      player.Humanoid.Health = player.Humanoid.Health - (alignment.Value * 2)
      behaviour.Value = 0
      wait()
    end
    ting = 0
  end
end

while true do
  -- Figure out what the Brick should do (last items are topmost priority).
  if behaviour.Value == 0 then
    brick.Velocity = Vector3.new(0,20,0)
    wait(math.random(1,5))

    -- Determine random Movement.
    if math.random(1,5) == 5 then
      behaviour.Value = 1
    end

    -- Determine follow Owner.
    if math.random(1,6) == 4 then
      if game.Players:findFirstChild(owner.Value) then
        behaviour.Value = 4
      else
        brick.Parent:Destroy()
      end
    end

    -- Determine eating Players if Evil
    if alignment.Value < -14 and math.random(1,alignment.Value * -1) > 15 then
      behaviour.Value = 5
    end

    -- Determine attacking other Evil Bricks if Good.
    if alignment.Value > 14 and math.random(1, alignment.Value) > 15 then
      behaviour.Value = 6
    end

    -- Determine Pooping
    local s = brick.Size
    if s.x > 10 or s.y > 10 or s.z > 10 then
      if math.random(1,100) > 90 then
        behaviour.Value = 3
      end
    end

    -- Determine Feeding
    if brick.Parent:findFirstChild('food') then
      behaviour.Value = 2
    end
  end

  -- Random Movement
  if behaviour.Value == 1 and math.random(1,10) ~= 1 then
    for i = 0, math.random(1,15) do
      brick.BodyGyro.CFrame = brick.BodyGyro.CFrame * CFrame.fromEulerAnglesXYZ(0, math.random(-1,1) * 0.1, 0)
      wait()
      if behaviour.Value ~= 1 then
        break
      end
    end
    wait()
    if math.random(1,2) == 1 then
      for i = 0, math.random(1,5) do
        brick.Velocity = brick.Cframe.lookVector * math.random(13,13 + speed.Value)
        if behaviour.Value ~= 1 then
          break
        end
      end
    end
  end

  -- Get Food
  if behavour.Value == 2 and brick.Parent:findFirstChild('food') then
    local food = brick.Parent:findFirstChild('food')
    brick.BodyGyro.CFrame = CFrame.new(brick.Position, food.Position)
    wait(1.5)
    local count = 0
    while food.Parent ~= nil and behaviour.Value == 2 do
      local foodPos = food.Position
      local brickPos = brick.Position
      brick.BodyGyro.CFrame = CFrame.new(brick.Position, Vector3.new(foodPos.x, brickPos.y, foodPos.z))
      brick.Velocity = brick.CFrame.lookVector * (13 + speed.Value)
      count = count + 1
      wait()
      if count > 200 then
        break -- In case of infinite food-chasing. (Brick may miss food and circle it forever)
      end
    end
    brick.BodyGyro.CFrame = CFrame.new(brick.Position)
    behaviour.Value = 0
  end

  -- Poop
  if behaviour.Value == 3 then
    brick.BodyGyro.CFrame = CFrame.new(brick.Position)
    for i = 0, math.random(20,50) do
      brick.Velocity = Vector3.new(5,5,5)
      wait()
      brick.Velocity = Vector3.new(-5,-5,-5)
      wait()
      if behaviour.Value ~= 3 then
        break
      end
    end
    local bS = brick.Size
    local bP = brick.Position
    local poop = Instance.new('Part')
    poop.Size = Vector3.new(bS.x / pooSize.Value, bS.y / pooSize.Value, bS.z / pooSize.Value)
    poop.Parent = workspace
    poop.Position = Vector3.new(bP.x, bP.y, bP.z + (bS.z/2))
    game.Lighting.objDestroy:clone().Parent = poop
    print('Pooped at ', poop.Position)
    brick.Velocity = Vector3.new(0,0,0)
    behaviour.Value = 0
  end

  -- Follow Owner
