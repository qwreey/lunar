local Package = require("Package")
local Handle = require("Handle")
local Prop = require("Handle/Prop")
local Template = require("Template")

return {
    TString = Template.TString;
    TNumber = Template.TNumber;
    Package = Package;

    -- Export Handle module
    AfterInstall = Handle.AfterInstall;
    BeforeInstall = Handle.BeforeInstall;
    Handle = Handle.Handle;
    Prop = Prop;
    --PackageSolver;
}
