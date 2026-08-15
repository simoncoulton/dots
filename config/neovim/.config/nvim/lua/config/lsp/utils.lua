-- utils.lua
local util = require("lspconfig.util")

local M = {}

M.is_deno = function(fname)
  return util.root_pattern("deno.json", "deno.jsonc")(fname) ~= nil
end

return M
