local PackageList = require("PackageList")
local Handle = require("../Handle")

local Package = {}
local function CreatePackage(self)
    if self == Package then
        self = setmetatable({ PackageList = {}, Options = {}, Handles = {} },Package)
    end
    return self
end

function Package.__call(self,...)
    self = CreatePackage(self)
    for i=1,select("#",...) do
        local arg = select(i,...)
        if type(arg) == "string" then
            table.insert(self.PackageList,arg)
        elseif type(arg) == "table" then
            for i,v in pairs(arg) do
                if type(i) == "number" then
                    table.insert(self.Options,v)
                else
                    self.Options[i] = v
                end
            end
        end
    end
    return self
end

function Package:Finalize()
    for i,v in pairs(self) do
        v.__package = self
    end
end

function Package:Name(str:string)
    self.__name = str
end
function Package:Handle()
end

return Package
