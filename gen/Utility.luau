local void:(...unknown)->() = function()end
local types = require("type")
local StringActionQueue = {}::types.StringActionQueue

local Action_gsub = 0x0
function StringActionQueue:gsub(...)
    table.insert(self._actions,{Action_gsub,table.pack(...)})
end

local Action_rep =  0x1
function StringActionQueue:rep(...)
    table.insert(self._actions,{Action_rep,table.pack(...)})
end
local Action_reverse = 0x2
function StringActionQueue:reverse(...)
    table.insert(self._actions,{Action_reverse,table.pack(...)})
end

local Action_upper = 0x3
function StringActionQueue:upper(...)
    table.insert(self._actions,{Action_upper,table.pack(...)})
end

local Action_lower = 0x4
function StringActionQueue:lower(...)
    table.insert(self._actions,{Action_lower,table.pack(...)})
end

local Action_format = 0x5
function StringActionQueue:format(...)
    table.insert(self._actions,{Action_format,table.pack(...)})
end

local Action_sub = 0x6
function StringActionQueue:sub(...)
    table.insert(self._actions,{Action_sub,table.pack(...)})
end

local Action_StripIndent = 0x6
function StringActionQueue:StripIndent(...)
    table.insert(self._actions,{Action_StripIndent,table.pack(...)})
end

function StringActionQueue:ConcatWith(delimiter)
    self._del = delimiter
end

function StringActionQueue:Push(...)
    for i=1,select('#',...) do
        table.insert(self._strings,select(i,...))
    end
end

function StringActionQueue:Compile()
    local str = table.concat(self._strings,self._del or "")
    for _,action in ipairs(self._actions) do
        local id = action[0]
        if id == Action_gsub then

        end
    end
    return str
end

local function EscapeBashString(str:string)
    return str:gsub("\\","\\\\"):gsub("\"","\\\"")
end

return {void=void,EscapeBashString=EscapeBashString,StringActionQueue=StringActionQueue}
