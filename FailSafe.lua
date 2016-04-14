wait(2)
clone = script.Parent.Head:Clone()

while wait(3) do
	if not script.Parent:findFirstChild('Head') then
		new = clone:Clone()
		new.Position = Vector3.new(250, 5.8 + new.Size.y/2 + 10, 250)
		new.Parent = script.Parent
	else
		clone = script.Parent.Head:Clone() -- Keep the latest version of the head.
	end
end
