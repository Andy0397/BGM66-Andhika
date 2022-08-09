local MovingPlatform = {}


local part = nil

local maxPosition = Vector3.new(10,0,32)

local minPosition = Vector3.new(-10,0,32)

local initialPosition = Vector3.new(0,0,32)

local speed = 0.05

local nextPosition = nil

local intervalVector = nil

local timer = nil

local function Move()
  local distance = Vector3.Distance(part.WorldPosition, nextPosition)
  
  if  distance < 0.5 then
    local isMinPosition and maxPosition or minPosition
    local direction = nextPosition - part.WorldPosition
    intervalVector = direction.Normalized*speed
  else
    part.WorldPosition = part.WorldPosition + intervalVector
  end

end

function MovingPlatform:start(map)
  part = map.Root:findFirstChild("MovingPlatform", true)
  part.WorldPosition = initialPosition
  
  nextPosition = minPosition
  local direction = nextPosition - part.WorldPosition
  intervalVector = direction.Normalized * speed
  
  timer = timer.new(1, Move)
  timer.Loop = true
  timer:Start()

return MovingPlatform