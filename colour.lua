align = script.Parent.Parent.alignment

while wait(5) do
  local col = (0.5 + align.Value/100)
  script.Parent.BrickColor = BrickColor.new(col, col, col)
end
