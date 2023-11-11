--[[

    Table to generate simples templates from pseudo-objects, implements inheritance horizontal to other objects, similar to an extends

--]]

-- @table Object
local Object = {
    
    -- @param table _object_template
    -- @return table
    create = function(_object_template)
        
        local metatable = {__index = _object_template}
        local metamethods = {'__tostring'};

        for index, key in ipairs(metamethods) do
            if _object_template[key] then
                metatable[key] = _object_template[key]
            end
        end

        local object_template = setmetatable({}, metatable)
        
        return {
            -- @param table _constructor
            -- @return table object_template
            new = function(_constructor)

                local constructor = _constructor or nil

                if type(object_template.constructor) == 'function' then

                    if constructor then
                        object_template:constructor(_constructor)
                    end
                    
                end

                return object_template
            end
        }
    end,
}

return Object
