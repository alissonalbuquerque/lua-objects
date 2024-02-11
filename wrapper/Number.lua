--[[

    Table to generate Number Objects

--]]

local Object = require('base.prototype.Object')

-- @table String
local Number = Object.create({

    attributes = {'wrapped_number', 'type'},

    -- @return void
    constructor = function(self, _attributes)

        local wrapped_number = _attributes.wrapped_number or _attributes[1]

        self.attributes.wrapped_number = wrapped_number
        self.attributes.type = Object.type('wrapper.Number')
    end,

    -- @return wrapper.Number
    new = function(self, _constructor)
        return Object.create(self).new(_constructor)
    end,

    -- @return wrapper.Number
    abs = function(self)
        return math.abs(self:content())
    end,

    -- @return wrapper.Number
    floor = function(self)
        return math.floor(self:content())
    end,

    -- @return wrapper.Number
    ceil = function(self)
        return math.ceil(self:content())
    end,

    -- @return wrapper.Number
    round = function(self, digits)

        local digits = digits or 2
        local fmt = string.format("%%.%df", digits)
        
        return tonumber(string.format(fmt, self:content()))
    end,

    -- @return string
    content = function(self)
        return self.attributes.wrapped_number
    end,

    -- @return string
    gettype = function(self)
        return self.attributes.type
    end,

    -- @return string
    __tostring = function(self)
        return tostring(self:content())
    end
})

return Number
