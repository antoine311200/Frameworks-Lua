function table.lenghtTable( tableau )
    return #tableau
end

function table.concaten( tableau1, tableau2 )
    return tableau1 .. tableau2
end

function table.copy( tableau1, chaine1 )
    tableau1 = chaine1
    return tableau1
end

function table.compar( tableau1, tableau2 )
    if tableau1 == tableau2 then 
        return 0
    elseif tableau1 < tableau2 then 
        return -1
    elseif tableau1 > tableau2 then
        return 1
    end
end

function table.transpose(t)
   local tt = { }
   for a, b in pairs(t) do tt[b] = a end
   return tt
end

function table.ifilter(f, t)
   local yes, no = { }, { }
   for i=1,#t do table.insert (f(t[i]) and yes or no, t[i]) end
   return yes, no
end

local values = {}

function table.icat(...)
   local result = { }
   for t in values {...} do
      for x in values (t) do
         table.insert (result, x)
      end
   end
   return result
end

function table.iflatten (x) return table.icat (unpack (x)) end

--Reverse the table : t = {2, 4, 8}, print(unpack(table.irev(t))) 
-->> 8?4?2 <--Reversed

function table.irev(t)
   local result, nt = { }, #t
   for i=0, nt-1 do result[nt-i] = t[i+1] end
   return result
end

function table.shallow_copy(x)
   local y={ }
   for k, v in pairs(x) do y[k]=v end
   return y
end

function table.clear(tab)
    local elem = next(tab)
    while elem ~= nil do
        tab[elem] = nil
        elem = next(tab)
    end
    return tab
end

local ert = {2, 3, 7}

local e = table.irev(ert)

--print(unpack(e))

function table.valueOf(tab)
    return table.concat(tab, ", ")
end

function table.join(tab, separ)
    return table.concat(tab, separ)
end

function table.pop(tab, pos)
    return table.remove(tab, pos)
end

function table.push(tab, pos, elem)
    table.insert(tab, pos, elem)
end

function table.shift()

end

function table.unshift()

end


local tab = { "banane", "pomme", "cerise", "mangue"}

table.pop(tab, 1)
print(table.valueOf(tab))
