local PackageName = require("PackageName")
local types = require("../type")

local PackageList = {} :: types.PackageList
PackageList.__index = PackageList

-- Add packages to packagelist
function PackageList:Add(...)
    for i=1,select("#",...) do
        local pkgname = select(i,...)
        if not self:Has(pkgname) then
            table.insert(self,pkgname)
        end
    end
end

-- Remote packages from packagelist
function PackageList:Remove(...)
    for i=1,select("#",...) do
        local pkgname = select(i,...)
        local idx
        for i,v in ipairs(self) do
            if PackageName.name(v) == PackageName.name(pkgname) then
                idx = i
                break
            end
        end
        if idx then
            table.remove(self,idx)
        end
    end
end

-- Check this packagelist has packages
function PackageList:Has(...)
    local test = true
    for i=1,select("#",...) do
        local pkgname = select(i,...)
        local idx
        for i,v in ipairs(self) do
            if PackageName.name(v) == PackageName.name(pkgname) then
                idx = i
                break
            end
        end
        if not idx then
            test = false
            break
        end
    end
    return test
end

function PackageList:Merge(with)

end

-- Create New PackageList
function PackageList.New(): types.PackageList
    return setmetatable({}, PackageList) :: any
end

return PackageList
