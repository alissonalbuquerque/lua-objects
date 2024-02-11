local String = require('wrapper.String')
local Object = require('base.prototype.Object')

local str1 = String.new({"String : %s \nInteger: %d\nFloat: %.2f\n"}):format({'str', 1, 2.33})