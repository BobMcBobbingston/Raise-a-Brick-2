wait(1)
al= script.Parent.Parent.alignment
while true do
col = al.Value/100
script.Parent.BrickColor = BrickColor.new(0.5 + col,0.5 + col,0.5 + col)
wait(5)
end
