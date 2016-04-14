print('Creating ground and cloning brick.')
obj = workspace.Objects
temp = obj:findFirstChild('Brick')
clone = temp:Clone()

temp:Destroy()
ground = workspace.Scenery.Ground

for count = 1, 3 do
  for dist = 1, 3 do
    local newGround = ground:Clone()
    newGround.Size = Vector3.new(2000, 1.2, 2000)
    newGround.Position = Vector3.new(-4000 + (2000 * count), 0.6, (-4000 + 2000 *dist))
    newGround.Parent = workspace.Scenery

    if (dist == 1 or dist == 3) or (count == 1 or count == 3) then
      if math.random(1,2) == 1 then
        for i = 0, math.random(3,9) do
          width = 800 - (80*i) + math.random(-50, 50)
          mountainPiece = newGround:Clone()
          mountainPiece.Size = Vector3.new(width, 30, width)
          mountainPiece.Position = Vector3.new(-4000 + (2000 * count), 15.6 + (i*30), (-4000 + 2000 * dist))
          mountainPiece.Parent = workspace.Scenery
        end
      end
    end
  end
end
ground:Destroy()

while wait(1) do
  for i,v in pairs(game.Players:getChildren()) do
    if v and v:findFirstChild('hasBrick') and v.hasBrick.Value ~= 1 then
      wait(3)
      local newBrick = clone:Clone()
      newBrick.Parent = obj
      newBrick.owner.Value = v.Name
      v.hasBrick.Value = 1
    end
  end
end
