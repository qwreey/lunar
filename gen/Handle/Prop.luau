local types = require("../type")

local PropClass = {} :: types.PropImpl<unknown>
PropClass.__index = PropClass

-- Create new Prop
local function Prop<T>(t:T): types.Prop<T>
    return setmetatable({}::{T:T},PropClass)
end

-- On Prop Call; Create new instance or append data
function PropClass.__call(self,val)
    local this:any = self
    if not this.__instance then
        this = Prop(val) :: any
        this.__instance = true
        this.__handler = self.__handler
        this.__define = self.__define
        this.__data = {}
    end
    table.insert(this.__data,val)
    return this
end

-- Add Prop Handler
function PropClass:Handle(handler)
    if self.__handler then error("Redefine __handler") end
    self.__handler = handler
end

return Prop
