local Package = require("../Package")

-- Create handle group
function Handle<T>(handlers:T):T&Handle
    for i,v in pairs(handlers :: any) do
        v.__define = handlers
    end
    return handlers
end

function BeforeInstall(func:(Package:Package.Package,HandleShared:{any})->(...unknown))
    return {__hook = "BeforeInstall",func}
end

function AfterInstall(func:(Package:Package.Package,HandleShared:{any})->(...unknown))
    return {__hook = "BeforeInstall",func}
end

return {
    Handle = Handle;
    BeforeInstall = BeforeInstall;
    AfterInstall = AfterInstall;
}
