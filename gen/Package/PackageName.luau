-- Parse aur/asdf-asdf:version
local PackageName = {}

function PackageName.name(pkgname)
    return pkgname:match(".+/():.+") or pkgname:match("():.+") or pkgname:match(".+/()") or pkgname
end
function PackageName.version(pkgname)
    
end
function PackageName.repo(pkgname)
    
end

return PackageName
