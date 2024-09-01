local Utility = require("../Utility")

type Write = {
    --[=[
        Set owner of file
    ]=]
    As: (self:Write, user:string)->Write
} & Utility.StringActionQueueExtend<Write>
