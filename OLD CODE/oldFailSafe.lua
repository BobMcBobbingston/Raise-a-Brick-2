wait(2)
brickparent = script.Parent
brickclone = brickparent.Head:clone()

while true do
wait(3)
if brickparent:FindFirstChild("Head") == nil then
	newbrick = brickclone:clone()
	newbrick.Position = Vector3.new(250,5.8 + newbrick.Size.y/2 + 10, 250)
	newbrick.Parent = brickparent
else
	brickclone = nil
	brickclone = brickparent.Head:clone()
end
end
