-- 실제로는 그냥 exec 에 대한 워랩입니다.
-- dconf load / -
-- sudo -u vagrant HOME=/home/vagrant dbus-launch --exit-with-session dconf ...

local types = require('../type')
local Utility = require("../Utility")

local Dconf = {}

function Dconf:Finalize()
    if not self._as then
        error("Dconf: ")
    end

    return table.concat {
        "cat - <<EOF\n",
        self._content
        "\nEOF | su -u ",self._as
        "\" HOME=~", self._as,
        " dbus-launch --exit-with dconf load ",self._path," -"
    }
end

NewHook(Dconf,'As')
function Dconf:As(user)
    self._as = user
end

return (Dconf :: any) :: types.Dconf
