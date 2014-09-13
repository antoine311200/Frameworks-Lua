vector3 = >vector3

function vector3:Right()
    return vector3:New( 1, 0, 0 )
end

function vector3:DiagonalL_U()
    return vector3:New( -1, 1, 0 )
end

function vector3:DiagonalR_U()
    return vector3:New( 1, 1, 0 )
end

function vector3:DiagonalL_D()
    return vector3:New( -1, -1, 0 )
end

function vector3:DiagonalR_D()
    return vector3:New( 1, -1, 0 )
end

function vector3:Cube()
  return self.x ^ 3 + self.y ^ 3 + self.z ^ 3
end

function vector3:Exposant( value )
    return self.x ^ value + self.y ^ value + self.z ^ value
end

function vector3:Round( e )
    return vector3:New( Math.floor( e.x + 0.5), Math.floor( e.y + 0.5), Math.floor( e.z + 0.5) )
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------


Vector2 = {
  __add = function( a, b )
    return Vector2:New( a.x + b.x, a.y + b.y )
  end,
  
  __sub = function( a, b )
    return Vector2:New( a.x - b.x, a.y - b.y )
  end,
  
 __mul = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return Vector2:New( a.x * b, a.y * b )
    elseif type(a) == "number" and type(b) == "table" then
      return Vector2:New( a * b.x, a * b.y )
    elseif type(a) == "table" and type(b) == "table" then
      return Vector2:New( a.x * b.x, a.y * b.y )
    end
  end,
  
  __div = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return Vector2:New( a.x / b, a.y / b )
    elseif type(a) == "number" and type(b) == "table" then
      return Vector2:New( a / b.x, a / b.y )
    elseif type(a) == "table" and type(b) == "table" then
      return Vector2:New( a.x / b.x, a.y / b.y )
    end
  end,
  
  __unm = function ( e )
    return Vector2:New( -e.x, -e.y )
  end,
  
  __pow = function ( a, b )
    if type(a) == "table" and type(b) == "number" then
      return Vector2:New( a.x ^ b, a.y ^ b )
    end
  end,
  
  __eq = function ( a, b )
    return ( a.x == b.x ) and ( a.y == b.y )
  end,
  
  __tostring = function( e )
    return "{ x=" .. e.x .. ", y=" .. e.y .. " }"
  end
}
Vector2.__index = Vector2

function Vector2:New( x, y )
  if y == nil then
    if type(x) == "table" then
      y = x.y
      x = x.x
    else
      y = x
    end
  end
  
  return setmetatable( { x=x, y=y }, Vector2 )
end

function Vector2:Left()
    return Vector2:New( -1, 0 )
end

function Vector2:Up()
    return Vector2:New( 0, 1 )
end


function Vector2:UnitX()
    return Vector2:New( 1, 0 )
end

function Vector2:UnitY()
    return Vector2:New( 0, 1 )
end

function Vector2:Add( v )
  self.x = self.x + v.x
  self.y = self.y + v.y
end

function Vector2:Subtract( v )
  self.x = self.x - v.x
  self.y = self.y - v.y
end

function Vector2:Length()
  return math.sqrt( self.x ^ 2 + self.y ^ 2 )
end

function Vector2:SqrLength()
  return self.x ^ 2 + self.y ^ 2
end

function Vector2:Normalized()
  local nv = Vector2:New( self.x, self.y )
  nv:Normalize()
  return nv
end

function Vector2:Normalize()
  local len = self:Length()
  self.x = self.x / len
  self.y = self.y / len
end

function Vector2.Lerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = Vector2:New(0)
    out.x = a.x * ( 1 - v ) + b.x * v
    out.y = a.y * ( 1 - v ) + b.y * v
    return out
end

function Vector2.Slerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = Vector2.Lerp( a, b, v )
    
    return ( out:Normalized() * ( a:Length() * ( 1 - v ) + b:Length() * v ) )
end

function Vector2.Cross( a, b )
    return Vector2:New( a.x * b.y - a.y * b.x )
end

function Vector2.Dot( a, b )
    return a.x * b.x + a.y * b.y
end

function Vector2.Angle( a, b )
    local sinA = Vector2.Cross( a, b ):Length() / a:Length() / b:Length()
    local cosA = Vector2.Dot( a, b ) / a:Length() / b:Length()
    
    return math.atan2( sinA, cosA )
end

function Vector2.Distance( a, b )
    return ( b - a ):Length()
end

function Vector2.Rotate( v, q )
    local x = q.x * 2
    local y = q.y * 2
    local w = q.w * x
    
    return Vector2:New(
      v.x * (1 - q.y * y) + v.y * (q.x * y - q.w) * (q.x + q.w * y),
      v.x * (q.x * y)     + v.y * (1 - q.x * x) * (q.y - w),
      v.x * q.x + v.y * w * (1 - q.x * x - q.y * y) )
end

function Vector2:Round( e )
    return Vetor2:New( Math.floor( e.x + 0.5 ), Math.floor( e.y + 0.5 ) )
end

Vector2.Transforme = Vector2.Rotate

---------------------------------------------------------------

VectorX = {
  __add = function( a, b )
    return VectorX:New( a.x + b.x )
  end,
  
  __sub = function( a, b )
    return VectorX:New( a.x - b.x )
  end,
  
 __mul = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorX:New( a.x * b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorX:New( a * b.x )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorX:New( a.x * b.x )
    end
  end,
  
  __div = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorX:New( a.x / b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorX:New( a / b.x )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorX:New( a.x / b.x )
    end
  end,
  
  __unm = function ( e )
    return VectorX:New( -e.x )
  end,
  
  __pow = function ( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorX:New( a.x ^ b )
    end
  end,
  
  __eq = function ( a, b )
    return ( a.x == b.x )
  end,
  
  __tostring = function( e )
    return "{ x=" .. e.x .. " }"
  end
}

VectorX.__index = VectorX

function VectorX:New( x )
  if y == nil then
    if type(x) == "table" then
      x = x.x
    else
      x = x
    end
  end
  
  return setmetatable( { x=x }, VectorX )
end

function VectorX:Add( v )
  self.x = self.x + v.x
end

function VectorX:Subtract( v )
  self.x = self.x - v.x
end

function VectorX:Length()
  return math.sqrt( self.x ^ 2 )
end

function VectorX:SqrLength()
  return self.x ^ 2
end

function VectorX:Normalized()
  local nv = VectorX:New( self.x )
  nv:Normalize()
  return nv
end

function VectorX:Normalize()
  local len = self:Length()
  self.x = self.x / len
end

function VectorX.Lerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorX:New(0)
    out.x = a.x * ( 1 - v ) + b.x * v
    return out
end

function VectorX.Slerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorX.Lerp( a, b, v )
    
    return ( out:Normalized() * ( a:Length() * ( 1 - v ) + b:Length() * v ) )
end

function VectorX.Dot( a, b )
    return a.x * b.x
end

function VectorX.Angle( a, b )
    local sinA = VectorX.Cross( a, b ):Length() / a:Length() / b:Length()
    local cosA = VectorX.Dot( a, b ) / a:Length() / b:Length()
    
    return math.atan2( sinA, cosA )
end

function VectorX.Distance( a, b )
    return ( b - a ):Length()
end

function VectorX:Round( e )
    return Vetor2:New( Math.floor( e.x + 0.5 ) )
end

---------------------------------------------------------------

VectorY = {
  __add = function( a, b )
    return VectorY:New( a.y + b.y )
  end,
  
  __sub = function( a, b )
    return VectorY:New( a.y - b.y )
  end,
  
 __mul = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorY:New( a.y * b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorY:New( a * b.y )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorY:New( a.y * b.y )
    end
  end,
  
  __div = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorY:New( a.y / b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorY:New( a / b.y )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorY:New( a.y / b.y )
    end
  end,
  
  __unm = function ( e )
    return VectorY:New( -e.y )
  end,
  
  __pow = function ( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorY:New( a.y ^ b )
    end
  end,
  
  __eq = function ( a, b )
    return ( a.y == b.y )
  end,
  
  __tostring = function( e )
    return "{ x=" .. e.y .. " }"
  end
}

VectorY.__index = VectorY

function VectorY:New( y )
  if y == nil then
    if type(y) == "table" then
      y = x.y
    else
      y = x
    end
  end
  
  return setmetatable( { y=y }, VectorX )
end

function VectorY:Add( v )
  self.y = self.y + v.y
end

function VectorY:Subtract( v )
  self.y = self.y - v.y
end

function VectorY:Length()
  return math.sqrt( self.y ^ 2 )
end

function VectorY:SqrLength()
  return self.y ^ 2
end

function VectorY:Normalized()
  local nv = VectorY:New( self.y )
  nv:Normalize()
  return nv
end

function VectorY:Normalize()
  local len = self:Length()
  self.y = self.y / len
end

function VectorY.Lerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorY:New(0)
    out.y = a.y * ( 1 - v ) + b.y * v
    return out
end

function VectorY.Slerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorY.Lerp( a, b, v )
    
    return ( out:Normalized() * ( a:Length() * ( 1 - v ) + b:Length() * v ) )
end

function VectorY.Dot( a, b )
    return a.y * b.y
end

function VectorY.Angle( a, b )
    local sinA = VectorY.Cross( a, b ):Length() / a:Length() / b:Length()
    local cosA = VectorY.Dot( a, b ) / a:Length() / b:Length()
    
    return math.atan2( sinA, cosA )
end

function VectorY.Distance( a, b )
    return ( b - a ):Length()
end

function VectorY:Round( e )
    return Vetor2:New( Math.floor( e.y + 0.5 ) )
end

-------------------------------------------------------------------

VectorZ = {
  __add = function( a, b )
    return VectorZ:New( a.z + b.z )
  end,
  
  __sub = function( a, b )
    return VectorZ:New( a.z - b.z )
  end,
  
 __mul = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorZ:New( a.z * b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorZ:New( a * b.z )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorZ:New( a.z * b.z )
    end
  end,
  
  __div = function( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorZ:New( a.z / b )
    elseif type(a) == "number" and type(b) == "table" then
      return VectorZ:New( a / b.z )
    elseif type(a) == "table" and type(b) == "table" then
      return VectorZ:New( a.z / b.z )
    end
  end,
  
  __unm = function ( e )
    return VectorZ:New( -e.z )
  end,
  
  __pow = function ( a, b )
    if type(a) == "table" and type(b) == "number" then
      return VectorZ:New( a.z ^ b )
    end
  end,
  
  __eq = function ( a, b )
    return ( a.z == b.z )
  end,
  
  __tostring = function( e )
    return "{ x=" .. e.z .. " }"
  end
}

VectorZ.__index = VectorZ

function VectorZ:New( z )
  if y == nil then
    if type(z) == "table" then
      x = x.z
    else
      z = x
    end
  end
  
  return setmetatable( { z=z }, VectorZ )
end

function VectorZ:Add( v )
  self.z = self.z + v.z
end

function VectorZ:Subtract( v )
  self.z = self.z - v.z
end

function VectorZ:Length()
  return math.sqrt( self.z ^ 2 )
end

function VectorZ:SqrLength()
  return self.z ^ 2
end

function VectorZ:Normalized()
  local nv = VectorZ:New( self.z )
  nv:Normalize()
  return nv
end

function VectorZ:Normalize()
  local len = self:Length()
  self.z = self.z / len
end

function VectorZ.Lerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorZ:New(0)
    out.z = a.z * ( 1 - v ) + b.z * v
    return out
end

function VectorZ.Slerp( a, b, v )
    if ( v > 1 ) then v = 1 end
    if ( v < 0 ) then v = 0 end
    
    local out = VectorZ.Lerp( a, b, v )
    
    return ( out:Normalized() * ( a:Length() * ( 1 - v ) + b:Length() * v ) )
end

function VectorZ.Dot( a, b )
    return a.z * b.z
end

function VectorZ.Angle( a, b )
    local sinA = VectorZ.Cross( a, b ):Length() / a:Length() / b:Length()
    local cosA = VectorZ.Dot( a, b ) / a:Length() / b:Length()
    
    return math.atan2( sinA, cosA )
end

function VectorZ.Distance( a, b )
    return ( b - a ):Length()
end

function VectorZ:Round( e )
    return Vetor2:New( Math.floor( e.z + 0.5 ) )
end
