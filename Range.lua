--[[
        WARNINGS
 There is a problem with the logarithme. When the bar is too big,
 and when the cursor moves around the extremity, the values are "logarithmées" so the cursor move more and more.
 
 
 --@implementation: Implemente the step function to allow the cursor will move according to steps.
]]

cameraComponent = nil

Range = {
    state = true,
    init = 0,
    step = 5,
    focus = false,
    name = {"range", "rangebar"},
    min = -5,
    max = 5,
    __call = function(rg, name)
        if rg.state then
            rg:Init(name)
        else
            rg:Disable()
        end
    end
}

Range.__index = Range
setmetatable(Range, Range)

Range.model = {
        ["cursor"] = CS.FindAsset('Web Asset/Range/Cursor'),
        ["bar"] = CS.FindAsset('Web Asset/Range/Bar')
}

function Range:New(name, init, step, min, max, state, callback)
    
    local mouse = CS.Input.GetMousePosition()
    
    Object( name[1], {0,0,-5},  "ModelRenderer",  self.model["cursor"],  {1,1,1} )
    Object( name[2],{0,0,-5.01}, "ModelRenderer", self.model["bar"], {self.step*10, 1, 1})

    return setmetatable(
    {
        name = name or {"range", "rangebar"}, 
        init = init, 
        step = step or 10,
        min = min or -5,
        max = max or 5,
        state = state or true, 
        callback= callback or function() end
    }, self )        
end

function Range:Init(name)
    local mouse = CS.Input.GetMousePosition()
    local ray = cameraComponent:CreateRay( mouse )
    
    local pos = CS.FindGameObject(self.name[1]).transform:GetPosition()
    local warp = (ray.position + ray.direction) * 10
    local axe = pos.y or pos.x
    axe = ( ( axe + 1 > self.max ) and self.max or axe + 1 ) or ( ( axe - 1 < self.min ) and self.min or axe - 1 )
    
    warp = (warp.x - pos.y) or (warp.x - pos.y)
    warp = (warp < self.min) and self.min or ( ( warp > self.max ) and self.max or warp ) 
    
    self.range = CS.FindGameObject(self.name[1])
    self.rangebar = CS.FindGameObject(self.name[2])
    
    local hitCursDistance = ray:IntersectsModelRenderer( self.range:GetComponent( "ModelRenderer" ) )
    local hitBarDistance = ray:IntersectsModelRenderer( self.rangebar:GetComponent( "ModelRenderer" ) )
    if ( hitCursDistance ~= nil ) then
        self.range.transform:SetLocalScale( Vector3:New( 1.05 ) )
        if CS.Input.IsButtonDown( "Fire" ) then
            self.range.transform:SetPosition(Vector3:New(warp+0.135 --[[(-pos.z/3)]], pos.y, pos.z))
        end
        if CS.Input.WasButtonJustPressed("ScrollUp") then
            self.range.transform:SetPosition(Vector3:New( axe, pos.y, pos.z))
        end
        if CS.Input.WasButtonJustPressed("ScrollDown") then
            self.range.transform:SetPosition(Vector3:New( axe, pos.y, pos.z))
        end
    else
        self.range.transform:SetLocalScale( Vector3:New( 1 ) )
    end
    if ( hitBarDistance ~= nil ) then
        if CS.Input.IsButtonDown( "Fire" ) then
            self.range.transform:SetPosition(Vector3:New(warp, pos.y, pos.z))
        end
    end
end

function Range:GetState()
    return self.state
end

function Range:SetState(state)
    self.state = state or true
end

function Range:GetStep()
    return self.step
end

function Range:SetStep(step)
    self.step = step or 10
end

function Range:SetPos(p)
    self.init = p or 0
end

function Range:Disable()

end

function Range:Describe()
    print('~~~~~~Description of this Range~~~~~~')
    print('Name: '..self.name)
    print('Step: '..self:GetStep())
    print('State: '..tostring(self:GetState()))
    print('Min Scroll: '..self.min..' & Max scroll: '..self.max)
end


function Behavior:Awake()
    cameraComponent = CS.FindGameObject("Camera").camera
    self.Range = Range:New( {"Range", "RangeBar"}, 0, 5, -6, 6, true, nil)
    
end

function Behavior:Update()
    self.Range()
    if CS.Input.WasButtonJustPressed("Fire") then
        --self.Range:Describe()
    end
end
