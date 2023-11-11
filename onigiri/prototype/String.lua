--[[

    Table to generate String Objects

--]]

local Object = require('onigiri.prototype.Object')

-- @table String
local String = Object.create({
    attributes = {wrapper_string},

    constructor = function(self, _attributes)

        local wrapper_string = _attributes.wrapper_string or _attributes[1]

        self.attributes.wrapper_string = wrapper_string
    end,

    len = function(self)
        return #self.attributes.wrapper_string
    end,

    __tostring = function(self)
        return self.attributes.wrapper_string
    end
})

return String
