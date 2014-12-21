trigonometrie = 1
------------------------------------------------------------------
---------------------------PUISSANCE------------------------------
------------------------------------------------------------------

--This function extends the value cube.
--@param value (number) the value to the cube.
--@return (number) value cube.
function math.cube( value )
  return math.floor( value ^ 3 )
end

--This function extends the squared value.
--@param value (number) the value to square.
--@return (number) value squared.
function math.carre( value )
  return math.floor( value ^ 2 )
end

--This function extends the value of the exponent 
--@param value (number) the value to the power of the exponent.
--@param exposant (number) the power.
--@return (number) value power exponent
function math.exposant( value, exposant )
  return math.floor( value ^ exposant )
end

--This function returns true if the value is integer or false if the value isn't integer
--@param value (number) the number (integer or not)
--@return true (boolean) if the value is integer
--@return false (boolean) if the value isn't integer
function math.integer( value )
    if value == math.floor(value) then
        return true
    else
        return false
    end
end

--This function returns the PGCD of the two param
--@param a (number) the smaller number
--@param b (number) the taller number
--@return x (number) the PGCD of the two parameters
function math.pgcd( a, b )
  local x, y = a, b
  
  while y > 1 do
    x, y = y, x % y
  end
  
  return x
end

--This functon truncate the parameter
--@param n (number) a positive number or not
--@return math.ceil(n) (number) if the @param n is negative
--@return math.floor(n) (number) if the @param n is positive
function math.trunc(n)
    if n < 0 then
        return math.ceil(n)
    else
        return math.floor(n)
    end
end

--This function is the same funtion that math.random combined with math.randomseed but with the choice of the floor or not
--@param min (number) the minimal value of the random number
--@param max (number) the maximal value of the random number
--@param floor (boolean) the bool value for the random floor or not
--@return math.random with a lot of other things to random a max (number) floor or not
function math.randomplus(min, max, floor)
    if min ~= nil and max ~= nil then
         if floor then
            return math.random(min, max) / 3.1415926535897932384626433832795 * 4
        elseif not false then
            return math.random()
        end
    else
        if floor then
            return math.randomseed()
        elseif not false then
            return math.random()
        elseif floor == nil then
            return math.random()
        end
    end
end
--[[/////////////////////////////////////////////////////////////
    //////////////////////////EQUATIONS//////////////////////////
    ////////////////////////////////////////////////////////////]]

--This function is like math.PI and 
--@return pi
function math.pi() 
  return 3.1415926535897932384626433832795
end

--This function is the value of phi and 
--@param data (boolean) for the equation or the number
--@return phi
function math.phi(data)
    if data == false then
        return (math.sqrt(5) + 1) / 2
    elseif data then
        return 1.6180339887499
    end 
end

--This function returns the theorem of Pythagore
--@param a (number) the value of the first parameter or the value of a segment
--@param b (number) the value of the second parameter or the value of a segment
--@return the theorem of Pythagore with the two parameter
function math.pythagore( a, b )
    return math.sqrt( a ^ 2 + b ^ 2 )
end

--This function extends the fourth proportional also called the rule of 3
--@param a (number) value a
--@param b (number) value b
--@param c (number) value c
--@return d (number) the answer of the rule
function math.quaterProp( a, b, c )
    return c * b / a
end

--This function returns 
function math.eqSecDeg( a, b, c )
    local discriminant = math.carre( b ) * 1 - 4 * a * 1 * c
    if discriminant >= 0 then
        return ( -b * 1 + math.sqrt( discriminant) ) / 2 * a * math.carre( 1),
               ( -b * 1 - math.sqrt( discriminant) ) / 2 * a * math.carre( 1)
    else
        error( "error the discriminant is < 0" )
    end
end

function math.cinet(m, v)
    local Ec = 1 / 2 * m * math.carre(v)
    local Joules = Ec
    return Ec or Joules
    
end

--Alcolémie en Gramme,par Litre d'un individu
function math.ivresse(V, p, m, genre)
    if genre == "m" then
        local c = 0.8
        return ( V *  p * 0.8 ) / ( m * c )
    elseif genre == "f" then
        local c = 0.7
        return ( V *  p * 0.8 ) / ( m * c )
    end
end

function math.moulinmasse(r, v, P)
    local m = math.pi() * math.carre(r) * v * P
    return m
end

--print( math.eqSecDeg( 4, 4, 1 ) )


--obj[3].value=(-obj[1].value+math.sqrt(det))/(2*obj[0].value);
--obj[4].value=(-obj[1].value-math.sqrt(det))/(2*obj[0].value);
------------------------------------------------------------------
---------------------------PERIMETRE------------------------------
------------------------------------------------------------------

function math.periCerc( diametre )
    return diametre * math.pi()
end

function math.periRect( largeur, longueur )
    return ( largeur + longueur ) * 2
end 

function math.periTri( base, coteAdj, coteOpo )
    return base + coteAdj + coteOpo
end

------------------------------------------------------------------
----------------------------VOLUME--------------------------------
------------------------------------------------------------------

function math.volSphere( rayon )
    return 4 / 3 * math.pi() * math.cube( rayon )
end

function math.volPyramRegul( aireBase, hauteur )
    return aireBase * hauteur / 3
end

function math.volCylindDroit( rayon, hateur )
    return math.pi() * math.cube( rayon ) * hauteur
end

function math.volPrismeDroit( largeur, longueur, hauteur )
    return largeur * longueur * hauteur
end

function math.volConeDroit( rayon, hauteur )
    return math.pi() * math.carre( rayon ) * hauteur / 3
end

------------------------------------------------------------------
-----------------------------AIRE---------------------------------
------------------------------------------------------------------


function math.aireTrapez( gBase, pBase, hauteur ) 
    return ( gBase * pBase ) * hauteur / 2
end

function math.aireLosange( gDiago, pDiago ) 
    return gDiago * pDiago / 2
end

function math.aireParallelog( base, hauteur ) 
    return base * hauteir
end

function math.airePolyRegul( cote ,apotheme, nbCote )
    return cote * apotheme * nbCote / 2
end

function math.aireTri( base, hauteur, perimetre, coteA, coteB, coteC, --[[angleA, angleB,]] angleC )
    if trigonometrie == 1 then
        return ( base * hauteur ) / 2 
    elseif trigonometrie == 2 then
        return math.sqrt( perimetre * ( perimetre - coteA ) * ( perimetre - coteB ) * ( perimetre - coteC ) ) --Heron
    elseif trigonometrie == 3 then
        return 1 / 2 * coteA * coteB * math.sin(angleC)
    end
end

function math.aireRect( largeur, longueur )
    return largeur * longueur
end

function math.aireCerc( rayon )
    return math.carre( rayon ) * math.pi()
end

function math.aireCylindDroit( rayon, hauteur )
    return 2 * math.pi() * math.carre(rayon) + 2 * math.pi() * rayon * hauteur
end

function math.airePrismeDroit( periBase, aireBase, hauteur )
    return 2 * aireBase + periBase * hauteur
end

function math.aireSphere( rayon )
    return 4 * math.pi() * math.carre( rayon )
end

function math.aireConeDroit( rayon, apotheme )
    return math.pi() * math.carre( rayon ) + math.pi() * rayon * apotheme
end

function math.airePyamRegul( aireBase, periBase, apotheme )
    return aireBase + ( periBase * apotheme / 2 )
end
--end

