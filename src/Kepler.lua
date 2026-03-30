-- Based in original Prometheus.
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*[/%\\])")
end

local oldPkgPath = package.path;
package.path = script_path() .. "?.lua;" .. package.path;

local Pipeline  = require("Kepler.pipeline");
local highlight = require("highlightlua");
local colors    = require("colors");
local Logger    = require("logger");
local Presets   = require("presets");
local Config    = require("config");
local util      = require("Kepler.util");

package.path = oldPkgPath;

return {
    Pipeline  = Pipeline;
    colors    = colors;
    Config    = util.readonly(Config);
    Logger    = Logger;
    highlight = highlight;
    Presets   = Presets;
}

