function string.sqrLength( a, b )
    if type( a ) == "string" and type( b ) == "number" then
        return String.len( a ) ^ b
    else error( " a must be a string and b a number." )
    end
end

function string.number( a )
    if type( a ) == "string" then
        a = a
    else 
        error( " a must be a string" )
    end
    return a
end

function string.numlettre( lettre ) 
    lettres = {a = 1, b = 2, c = 3, d = 4, e = 5, f = 6, g = 7, h = 8, i = 9, j = 10, k = 11, l = 12, m = 13, 
               n = 14, o = 15, p =16, q = 17, r = 18, s = 19, t = 20, u = 21, v = 22, w = 23, x = 24, y = 25, z = 26}
    if lettre ~= nil then
        return lettres
    else 
        error( "Error, a value is expected" )
    end
end

function string.uppFirst( text )
    if type(text) == "string" then
        return String.upper(String.sub(text, 1, 1)) .. String.sub( text, 2)
    else
        error("It's not a string")
    end
end

function string.lowFirst( text )
    if type(text) == "string" then
        return String.lower(String.sub(text, 1, 1)) .. String.sub( text, 2)
    else
        error("It's not a string")
    end
end

function string.split(str, pat)
   local t = {} 
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = string.find(str, fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
          table.insert(t,cap)
       end
      last_end = e+1
      s, e, cap = string.find(str, fpat, last_end)
   end
   if last_end <= string.len(str) then
      cap = string.sub(str, last_end)
      table.insert(t, cap)
   end
   return t
end

function string.le_to_number (s)
  local res = 0
  for i = #s, 1, -1 do
    res = res * 256 + string.byte (s, i)
  end
  return res
end

function string.le_to_hex (s)
  local res = ""
  for i = 1, #s do
    res = res .. string.format ("%.2x", string.byte (s, i))
  end
  return res
end

function string.writeXML (t, indent, spacing)
  indent = indent or "\t"
  spacing = spacing or ""
  return render (t,
     function (x)
       spacing = spacing .. indent
       if x.tag then
         local s = "<" .. x.tag
         if type (x.attr) == "table" then
           for i, v in pairs (x.attr) do
             if type (i) ~= "number" then
               s = s .. " " .. tostring (i) .. "=" .. string.format ("%q", tostring (v))
             end
           end
         end
         if #x == 0 then
           s = s .. " /"
         end
         s = s .. ">"
         return s
       end
       return ""
     end,
     function (x)
       spacing = string.gsub (spacing, indent .. "$", "")
       if x.tag and #x > 0 then
         return spacing .. "</" .. x.tag .. ">"
       end
       return ""
     end,
     function (s)
       s = tostring (s)
       s = string.gsub (s, "&([%S]+)",
            function (s)
                if not string.match (s, "^#?%w+;") then
                    return "&amp;" .. s
                else
                    return "&" .. s
                end
            end)
       s = string.gsub (s, "<", "&lt;")
       s = string.gsub (s, ">", "&gt;")
       return s
     end,
     function (x, i, v, is, vs)
       local s = ""
       if type (i) == "number" then
         s = spacing .. vs
       end
       return s
     end,
     function (_, i, _, j)
       if type (i) == "number" or type (j) == "number" then
         return "\n"
       end
       return ""
     end)
end

function string:split( inSplitPattern, outResults )

   if not outResults then
      outResults = { }
   end
   local start = 1
   local splitStart, splitEnd = string.find( self, inSplitPattern, start )
   while splitStart do
      table.insert( outResults, string.sub( self, start, splitStart-1 ) )
      start = splitEnd + 1
      splitStart, splitEnd = string.find( self, inSplitPattern, start )
   end
   table.insert( outResults, string.sub( self, start ) )
   return outResults
end

--[[local string_name = "Robert/Gilbert/Rolland/Arnaud/Quentin/Nicole/Mathilde/Berte/Anna/Elodie"

local table_string = string_name:split("/")
for i = 1, #table_string do
   print( table_string[i] )
end]]

function string.utf8DecodeUnicode(code1, code2)
    code1, code2 = tonumber(code1, 16), tonumber(code2, 16)
    if code1 == 0 and code2 < 0x80 then
        return string.char(code2)
    end
    if code1 < 0x08 then
        return string.char(
            0xC0 + code1 * 4 + math.floor(code2 / 64),
            0x80 + code2 % 64)
    end
    return string.char(
        0xE0 + math.floor(code1 / 16),
        0x80 + (code1 % 16) * 4 + math.floor(code2 / 64),
        0x80 + code2 % 64)
end

function string.decodeX(code)
    code = tonumber(code, 16)
    return string.char(code)
end
