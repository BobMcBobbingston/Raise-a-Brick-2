brick = script.Parent

while true do
wait(10)
local test = game.Players:findFirstChild(brick.Parent.Owner.Value)
if test == nil then
	brick.CanCollide = false
	wait(0.5)
	brick.Parent:remove()
end
end
