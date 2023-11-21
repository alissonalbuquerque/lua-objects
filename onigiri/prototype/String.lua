--[[

    Table to generate String Objects

--]]

local Object = require('onigiri.prototype.Object')

-- @table String
local String = Object.create({
    attributes = {'wrapped_string'},

    constructor = function(self, _attributes)

        local wrapped_string = _attributes.wrapped_string or _attributes[1]

        self.attributes.wrapped_string = wrapped_string
    end,

    content = function(self)
        return self.attributes.wrapped_string
    end,

    upper = function(self)

        local constructor = {
            string.upper(self:content())
        }
        
        return self:new(constructor)
    end,

    lower = function(self)

        local constructor = {
            string.lower(self:content())
        }

        return self:new(constructor)
    end,

    format = function(self, ...)

        local constructor = {
            string.format(self:content(), table.unpack(...))
        }

        return self:new(constructor, constructor)
    end,

    len = function(self)
        return string.len(self:content())
    end,

    new = function(self, _constructor)
        return Object.create(self).new(_constructor)
    end,

    __tostring = function(self)
        return self:content()
    end
})

return String
