math = Math --Pour des raisons d'optimisation il vut mieux faire comme ça.

trigonometrie = 1

------------------------------------------------------------------
---------------------------PUISSANCE------------------------------
------------------------------------------------------------------
--do local Math = math
function Math.cube( value )
  return Math.floor( value ^ 3 )
end

function Math.carre( value )
  return Math.floor( value ^ 2 )
end

function Math.exposant( value, exposant )
  return Math.floor( value ^ exposant )
end
 
function Math.integer( value )
    if value == Math.floor(value) then
        return "true"
    else
        return "false"
    end
end

function Math.pgcd( a, b )
  local x, y = a, b
  
  while y > 1 do
    x, y = y, x % y
  end
  
  return x
end

--Print(Math.integer( 12.4 ))
------------------------------------------------------------------
---------------------------EQUATION------------------------------
------------------------------------------------------------------

function Math.pi() 
  return 3.1415926535897932384626433832795
end

function Math.pythagore( a, b )
    return Math.sqrt( a ^ 2 + b ^ 2 )
end

function Math.quaterProp( A, B, C )
    return C * B / A
end


function Math.eqSecDeg( a, b, c )
    local discriminant = Math.carre( b ) * 1 - 4 * a * 1 * c
    if discriminant >= 0 then
        return ( -b * 1 + math.sqrt( discriminant) ) / 2 * a * Math.carre( 1),
               ( -b * 1 - math.sqrt( discriminant) ) / 2 * a * Math.carre( 1)
    else
        error( "error the discriminant is < 0" )
    end
end

--print( Math.eqSecDeg( 4, 4, 1 ) )


--obj[3].value=(-obj[1].value+Math.sqrt(det))/(2*obj[0].value);
--obj[4].value=(-obj[1].value-Math.sqrt(det))/(2*obj[0].value);
------------------------------------------------------------------
---------------------------PERIMETRE------------------------------
------------------------------------------------------------------

function Math.periCerc( diametre )
    return diametre * math.pi()
end

function Math.periRect( largeur, longueur )
    return ( largeur + longueur ) * 2
end 

function Math.periTri( base, coteAdj, coteOpo )
    return base + coteAdj + coteOpo
end

------------------------------------------------------------------
----------------------------VOLUME--------------------------------
------------------------------------------------------------------

function Math.volSphere( rayon )
    return 4 / 3 * Math.pi() * Math.cube( rayon )
end

function Math.volPyramRegul( aireBase, hauteur )
    return aireBase * hauteur / 3
end

function Math.volCylindDroit( rayon, hateur )
    return Math.pi() * Math.cube( rayon ) * hauteur
end

function Math.volPrismeDroit( largeur, longueur, hauteur )
    return largeur * longueur * hauteur
end

function Math.volConeDroit( rayon, hauteur )
    return Math.pi() * Math.carre( rayon ) * hauteur / 3
end

------------------------------------------------------------------
-----------------------------AIRE---------------------------------
------------------------------------------------------------------


function Math.aireTrapez( gBase, pBase, hauteur ) 
    return ( gBase * pBase ) * hauteur / 2
end

function Math.aireLosange( gDiago, pDiago ) 
    return gDiago * pDiago / 2
end

function Math.aireParallelog( base, hauteur ) 
    return base * hauteir
end

function Math.airePolyRegul( cote ,apotheme, nbCote )
    return cote * apotheme * nbCote / 2
end

function Math.aireTri( base, hauteur, perimetre, coteA, coteB, coteC, --[[angleA, angleB,]] angleC )
    if trigonometrie == 1 then
        return ( base * hauteur ) / 2 
    elseif trigonometrie == 2 then
        return Math.sqrt( perimetre * ( perimetre - coteA ) * ( perimetre - coteB ) * ( perimetre - coteC ) ) --Heron
    elseif trigonometrie == 3 then
        return 1 / 2 * coteA * coteB * math.sin(angleC)
    end
end

function Math.aireRect( largeur, longueur )
    return largeur * longueur
end

function Math.aireCerc( rayon )
    return Math.carre( rayon ) * Math.pi()
end

function Math.aireCylindDroit( rayon, hauteur )
    return 2 * Math.pi() * Math.carre(rayon) + 2 * Math.pi() * rayon * hauteur
end

function Math.airePrismeDroit( periBase, aireBase, hauteur )
    return 2 * aireBase + periBase * hauteur
end

function Math.aireSphere( rayon )
    return 4 * Math.pi() * Math.carre( rayon )
end

function Math.aireConeDroit( rayon, apotheme )
    return Math.pi() * Math.carre( rayon ) + Math.pi() * rayon * apotheme
end

function Math.airePyamRegul( aireBase, periBase, apotheme )
    return aireBase + ( periBase * apotheme / 2 )
end
--end
