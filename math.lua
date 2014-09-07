function math.pgcd( a, b )
  local x, y = a, b
  
  while y > 1 do
    x, y = y, x % y
  end
  
  return x
end

function math.regleTrois( a, b, c )
  return c * b / a
end
