ququ = require("../")
Package = ququ.Package
Handle = ququ.Handle
Prop = ququ.Prop

grub = Handle {
    Package 'grub';

    --[=[
        Kernel parameter

        EX:
        ```lua
        grub.KernelParameter
            "psi=1"
            "acpi.ec_no_wakeup=1";
        ```
    ]=]
    KernelParameter =
    Prop(ququ.TString)
    :Handle(function(handle)
        handle.HandleShared.param = {}
        handle.OnData = function(data)
            table.insert(handle.HandleShared.param, data)
        end
    end);

    ququ.BeforeInstall(function(Package,HandleShared)
    end);
    ququ.AfterInstall(function(Package,HandleShared)
    end);
}

return grub
